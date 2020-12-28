<!--#include virtual="/bbs/class/cls_dbconnect.asp" -->
<!--#include virtual="/bbs/class/cls_FSO.asp" -->
<%
' 1�� ��� �Ϲ� Form
' 2�� ��� ABC Upload
Const DBUpdaterForm = 1
Const DBUpdaterABC = 2
response.buffer = true
Server.ScriptTimeOut = 7200					' 3600 = 1�ð�

' Form ���� �Ѿ�� �����͸� �ڵ����� Insert Ȥ�� Update �����ִ� Ŭ����
Class XTclsDBUpdater

	Private DBConn
	Private FSO
	Private UploadForm
	
	Private DefaultUploadType		' ���ε� ������ �����Ѵ�.
	Private DefaultKeyHeader		' Ű��� �ε��� ����
	Private DefaultTableName		' ������ ���̺�� ����
	Private DefaultKeyFieldName		' �ε��� �ʵ� ��������
	Private DefaultKeyFieldValue	' �ε��� �ʵ� �� ����
	Private DefaultUploadDir		' ���ε� ��� ����

	Private ParamCollection			' ���� �Ķ����
	Private ParamCounter			' �Ķ������ ī����		


	Private Sub Class_Initialize()
		Set DBConn = new XTclsDbConn			' DB ���� Ŭ���� ����
		Set FSO = new XTclsFSO					' FSO ���� Ŭ���� ����
		Set UploadForm = Nothing
		ParamCollection = Array()
		ParamCounter = 0
		DefaultUploadType = DBUpdaterForm
	End Sub

	' ABC ������Ʈ�� ����Ѵ�.
	Public Sub LoadClassABC()
		If UploadForm is Nothing Then
			set UploadForm = 	Server.CreateObject("ABCUpload4.XForm")
			UploadForm.Overwrite  = true
			UploadForm.MaxUploadSize = 1024 * 1024 * 50			' ���ε� �뷮 50�ް� ����
			UploadForm.AbsolutePath  = true
			DefaultUploadType = DBUpdaterABC
		End if
	End Sub

	' ABC ������Ʈ���� ���� �޾ƿ´�.
	Public Function GetABC(objName)
		Call LoadClassABC
		GetABC = UploadForm(objName)
	End Function

	' ABC ������Ʈ���� ���� �޾ƿ´�.
	Public Function GetOrgFileName(objName)
		dim RtnName
		Call LoadClassABC
		Set OrgImageFile1 = UploadForm(objName)(1)
		if Len(OrgImageFile1) > 0 then RtnName = OrgImageFile1.safeFileName 	
		Set OrgImageFile1 = Nothing

		GetOrgFileName = RtnName
	End Function


	' ���忡 ���� Ű ������� �޴´�.
	Public Function InitSetting(UploadType, KeyHeader, TableName,KeyFieldName,UploadDir)

		ReDim ParamCollection(0)
		ParamCollection = Array()
		ParamCounter = 0
		Call DBConn.ClearParam

		DefaultKeyHeader = LCase(KeyHeader)
		DefaultTableName = LCase(TableName)
		if Len(KeyFieldName) = 0 then KeyFieldName = KeyHeader & "_idx"
		DefaultKeyFieldName = LCase(KeyFieldName)
		if Len(UploadDir) = 0 then UploadDir = DefUploadDir
		DefaultUploadDir = LCase(UploadDir)
		
		DefaultUploadType = UploadType
		Select Case DefaultUploadType
		Case DBUpdaterABC 
			Call LoadClassABC
		Case Else

		End Select 
		
	End Function

	' DBĿ�ؼ��� �����Ѵ�.
	Public Function DBConnection(strParam)
		DBConn.DBConnection strParam
	End Function

	' �� �Է¹��� �Ķ���͸� �޴´�.
	Public Function AddParam(strHeader,strValue)
		ReDim Preserve ParamCollection(ParamCounter)
		ParamCollection(ParamCounter) = Array(strHeader, strValue)
		ParamCounter = ParamCounter + 1
	End Function

	' HTML�� ������� ���ϰ� ������� ���
	Private function NotUseHTML(ByVal document_content)
		' HTML ����� ���� �ʴ´ٸ�
		if isNull(document_content) then document_content = ""
		document_content = replace(document_content,"<","&lt;")
		document_content = replace(document_content,">","&gt;")
		document_content = replace(document_content,chr(34),"&quot;")
		NotUseHTML = document_content
	End function

	Private function NotUseSQL(ByVal document_content)
		' HTML ����� ���� �ʴ´ٸ�
		if isNull(document_content) then document_content = ""
		document_content = replace(document_content,"<","&lt;")
		document_content = replace(document_content,">","&gt;")
		document_content = replace(document_content,chr(34),"&quot;")
		document_content = replace(document_content,"--","")
		document_content = left(document_content ,30)
		NotUseSQL = document_content
	End function

'**************************************************************************
'  ���ε�� �Լ�
'  save_item = XTUpdater.ABCUpload_File("/bbs/pds/superxt/", "superxt.jpg","mem_image")
'  ���ϰ�=����� ���ϸ�					���� , 				  , ����� ���ϸ�, ������(Type=File)
'**************************************************************************
	Public Function ABCUpload_File(save_path, save_filename,item_name)
		Call LoadClassABC
		Dim ImageFile1
		ABCUpload_File = ""
		' ��������
		Call FSO.Create_Folder(save_path)
		Set ImageFile1 = UploadForm(item_name)(1)
		if Len(ImageFile1) = 0 then exit function 
		' ����� ���ϸ��� �������� ������� ���ε�Ǵ� ���ϸ��� �⺻���� �Ѵ�.
		if Len(save_filename) = 0 then
			FileName = ImageFile1.FileName  
		else
			FileName = save_filename
		end if
	
		intComma = InstrRev(FileName, ".") 
		strName = Mid(FileName, 1, intComma - 1)    				' Ȯ���ڸ� ������ ���ϸ��� ��´�.
		strExt = Mid(FileName, intComma + 1)     				   	'Ȯ���ڸ� ��´�.
		TempName = ""
		Randomize  			' �������� �����Ѵ�.
		for i=1 to Len(strName)  '���ڿ��� �ѹ��ھ� �о�´�..
			char = mid(strName, i, 1)		
			if char = "_" then
				char = Chr(Int((122 - 97 + 1) * Rnd + 97))
			else
				char = mid(strName, i, 1)
			end if
			TempName = TempName & char
		next
		strName = TempName
		
		FileName = strName & "." & strExt  										' �켱 �����̸��� ������ �����Ѵٰ� ����
		strFileName = FSO.FileNameCheck(save_path & FileName)
		ImageFile1.Save server.mappath(strFileName) 							' ������ ������ �����Ѵ�.
		ABCUpload_File = Mid(strFileName,InstrRev(strFileName, "/")+1)
	
	End Function


'**************************************************************************
' ���� �۵��Ǵ� Insert, Update �Լ�
'**************************************************************************
	Public Sub SaveSQLForm()
		Dim SaveIdx
		Dim SQLTop, SQLBody, SQLBottom
		if Len(DefaultKeyHeader) = 0 then 
			response.write "Ű ������� �����ϴ�."
			response.end
			exit Sub		' ����� ������ ����
		end if
	
		if Len(DefaultTableName) = 0 then 
			response.write "���̺� ���� �������ϴ�."
			response.end
			exit Sub		' ����� ������ ����
		end if
		For LoopCnt = lbound(ParamCollection) to ubound(ParamCollection)
			save_header = ParamCollection(LoopCnt)(0)
			save_header = NotUseSQL(save_header)
			save_item = ParamCollection(LoopCnt)(1)
			if Lcase(save_header) = LCase(DefaultKeyFieldName) then DefaultKeyFieldValue = save_item
		Next				

		Select Case DefaultUploadType
		Case DBUpdaterABC 
			if Len(DefaultKeyFieldValue) = 0 then DefaultKeyFieldValue = UploadForm(DefaultKeyFieldName)
			MakeQuery UploadForm, SQLBody, SQLBottom
		Case Else
			if Len(DefaultKeyFieldValue) = 0 then DefaultKeyFieldValue = Request(DefaultKeyFieldName)
			MakeQuery Request.Form, SQLBody, SQLBottom
		End Select 

		MakeQuery Request.QueryString, SQLBody, SQLBottom
		MakeQueryData SQLBody, SQLBottom

		if Len(DefaultKeyFieldValue) > 0 then
			' ������Ʈ �� ��� ����
			SQL = "Update " & DefaultTableName & " Set " & vbCrLf
			SQL = SQL & SQLBottom & " Where " & DefaultKeyFieldName & " = ?"
			Call DBConn.MakeParam("@" & DefaultKeyFieldName, adVarChar, adParamInput, Len(DefaultKeyFieldValue) * 2, DefaultKeyFieldValue)
		else
			SQL = "Insert Into " & DefaultTableName & " (" & SQLBody & ") values (" & SQLBottom & ")"
		end if
		DBConn.ExecSQL SQL
	End Sub
	
	Private Sub MakeQueryData(strSQLTop, strSQLBody)
		Dim save_header,save_item
		if ParamCounter > 0 then
			For LoopCnt = lbound(ParamCollection) to ubound(ParamCollection)
				save_header = ParamCollection(LoopCnt)(0)
				save_header = NotUseSQL(save_header)
				save_item = ParamCollection(LoopCnt)(1)
				if Lcase(save_header) <> LCase(DefaultKeyFieldName) then 
					if Len(strSQLTop) > 0 then strSQLTop = strSQLTop & "," & vbCrLf
					if Len(strSQLBody) > 0 then strSQLBody = strSQLBody & "," & vbCrLf
	
					if Right(save_header,5) = "_html" then			' html�� ����Ұ�� ������ 5���ڰ� _html�� �����Ѵ�.
						save_header = Left(save_header,Len(save_header) - 5)
					else
						NotUseHTML save_item
					end if
					
					if Len(DefaultKeyFieldValue) > 0 then
						' ������Ʈ �� ��� ����
						strSQLBody = strSQLBody & save_header & " = ?"
					else
						strSQLTop = strSQLTop & save_header 
						strSQLBody = strSQLBody & " ? "
					end if
	'				Call DBConn.MakeParam("@" & save_header, adVarChar, adParamInput, Round(DBConn.Txt2Byte(save_item) * 1.1,0), save_item)
					Call DBConn.AddParam(save_header, save_item)
				end if
			Next
		end if
	End Sub	
	
	' QueryString, Form , ���ε� ������Ʈ�� Insert, Update ���� ���� ���
	Private Sub MakeQuery(ObjArray, strSQLTop, strSQLBody)

		Dim ObjItem
		Dim TmpUplpadDir
		Dim save_header,save_item
		
		strSQLTop = strSQLTop
		strSQLBody = strSQLBody
		
		TmpUplpadDir = DefaultUploadDir & DefaultTableName & "/"
		For each ObjItem in ObjArray

			save_header = Trim(LCase(ObjItem))
			save_header = NotUseSQL(save_header)
			if DefaultKeyFieldName <> save_header then
				if Left(save_header,Len(DefaultKeyHeader) + 1) = DefaultKeyHeader & "_" then
					save_item = ObjArray(save_header)
					AddUpdate = true
					if Right(save_header,5) = "_file" then		' ���ε��ϰ�� ������ 5���ڰ� _file �̾���Ѵ�.
						save_item = ABCUpload_File(TmpUplpadDir, "",save_header)
						save_header = Left(save_header,Len(save_header) - 5)
						if trim(save_item) = "" then AddUpdate = false
					elseif Right(save_header,5) = "_html" then			' html�� ����Ұ�� ������ 5���ڰ� _html�� �����Ѵ�.
						save_header = Left(save_header,Len(save_header) - 5)
					else
						NotUseHTML save_item	
					end if
					
					if AddUpdate then
						if Len(strSQLTop) > 0 then strSQLTop = strSQLTop & "," & vbCrLf
						if Len(strSQLBody) > 0 then strSQLBody = strSQLBody & "," & vbCrLf
						if Len(DefaultKeyFieldValue) > 0 then
							' ������Ʈ �� ��� ����
							strSQLBody = strSQLBody & save_header & " = ?"
						else
							strSQLTop = strSQLTop & save_header 
							strSQLBody = strSQLBody & " ? "
						end if
	'					Call DBConn.MakeParam("@" & save_header, adVarChar, adParamInput, Round(DBConn.Txt2Byte(save_item) * 1.1,0), save_item)
						 Call DBConn.AddParam(save_header, save_item)
					end if
				end if
			end if
		next
	End Sub
		
	Private Sub Class_Terminate()
		' �Ҹ���
		If not UploadForm is Nothing Then Set UploadForm = nothing
		Set DBConn = Nothing
		Set FSO = Nothing
	End Sub

End Class
 
'###########################################  
'����
'Set XTUpdater = new XTclsDBUpdater
'Call XTUpdater.InitSetting(DBUpdaterForm, "mem", "member","mem_idx",DefUploadDir)
'Call XTUpdater.DBConnection("Provider=SQLOLEDB.1;Password=;Persist Security Info=True;User ID=;Initial Catalog=;Data Source=")
'Call XTUpdater.AddParam("admin_id","testAdmin")
'Call XTUpdater.AddParam("group_id","56")
'XTUpdater.SaveSQLForm
'Set XTUpdater = nothing
'###########################################  
%>