<!--#include virtual="/bbs/class/cls_dbconnect.asp" -->
<!--#include virtual="/bbs/class/cls_FSO.asp" -->
<%
' 1일 경우 일반 Form
' 2일 경우 ABC Upload
Const DBUpdaterForm = 1
Const DBUpdaterABC = 2
response.buffer = true
Server.ScriptTimeOut = 7200					' 3600 = 1시간

' Form 으로 넘어온 데이터를 자동으로 Insert 혹은 Update 시켜주는 클래스
Class XTclsDBUpdater

	Private DBConn
	Private FSO
	Private UploadForm
	
	Private DefaultUploadType		' 업로드 종류를 지정한다.
	Private DefaultKeyHeader		' 키헤더 인덱스 저장
	Private DefaultTableName		' 저장할 테이블명 저장
	Private DefaultKeyFieldName		' 인덱스 필드 네임저장
	Private DefaultKeyFieldValue	' 인덱스 필드 값 저장
	Private DefaultUploadDir		' 업로드 경로 지정

	Private ParamCollection			' 사용될 파라메터
	Private ParamCounter			' 파라메터의 카운터		


	Private Sub Class_Initialize()
		Set DBConn = new XTclsDbConn			' DB 접속 클래스 선언
		Set FSO = new XTclsFSO					' FSO 관련 클래스 선언
		Set UploadForm = Nothing
		ParamCollection = Array()
		ParamCounter = 0
		DefaultUploadType = DBUpdaterForm
	End Sub

	' ABC 컴포넌트를 사용한다.
	Public Sub LoadClassABC()
		If UploadForm is Nothing Then
			set UploadForm = 	Server.CreateObject("ABCUpload4.XForm")
			UploadForm.Overwrite  = true
			UploadForm.MaxUploadSize = 1024 * 1024 * 50			' 업로드 용량 50메가 제한
			UploadForm.AbsolutePath  = true
			DefaultUploadType = DBUpdaterABC
		End if
	End Sub

	' ABC 컴포넌트에서 값을 받아온다.
	Public Function GetABC(objName)
		Call LoadClassABC
		GetABC = UploadForm(objName)
	End Function

	' ABC 컴포넌트에서 값을 받아온다.
	Public Function GetOrgFileName(objName)
		dim RtnName
		Call LoadClassABC
		Set OrgImageFile1 = UploadForm(objName)(1)
		if Len(OrgImageFile1) > 0 then RtnName = OrgImageFile1.safeFileName 	
		Set OrgImageFile1 = Nothing

		GetOrgFileName = RtnName
	End Function


	' 저장에 사용될 키 헤더값을 받는다.
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

	' DB커넥션을 셋팅한다.
	Public Function DBConnection(strParam)
		DBConn.DBConnection strParam
	End Function

	' 더 입력받을 파라메터를 받는다.
	Public Function AddParam(strHeader,strValue)
		ReDim Preserve ParamCollection(ParamCounter)
		ParamCollection(ParamCounter) = Array(strHeader, strValue)
		ParamCounter = ParamCounter + 1
	End Function

	' HTML을 사용하지 못하게 막을경우 사용
	Private function NotUseHTML(ByVal document_content)
		' HTML 사용을 하지 않는다면
		if isNull(document_content) then document_content = ""
		document_content = replace(document_content,"<","&lt;")
		document_content = replace(document_content,">","&gt;")
		document_content = replace(document_content,chr(34),"&quot;")
		NotUseHTML = document_content
	End function

	Private function NotUseSQL(ByVal document_content)
		' HTML 사용을 하지 않는다면
		if isNull(document_content) then document_content = ""
		document_content = replace(document_content,"<","&lt;")
		document_content = replace(document_content,">","&gt;")
		document_content = replace(document_content,chr(34),"&quot;")
		document_content = replace(document_content,"--","")
		document_content = left(document_content ,30)
		NotUseSQL = document_content
	End function

'**************************************************************************
'  업로드용 함수
'  save_item = XTUpdater.ABCUpload_File("/bbs/pds/superxt/", "superxt.jpg","mem_image")
'  리턴값=저장된 파일명					폴더 , 				  , 저장될 파일명, 변수명(Type=File)
'**************************************************************************
	Public Function ABCUpload_File(save_path, save_filename,item_name)
		Call LoadClassABC
		Dim ImageFile1
		ABCUpload_File = ""
		' 폴더생성
		Call FSO.Create_Folder(save_path)
		Set ImageFile1 = UploadForm(item_name)(1)
		if Len(ImageFile1) = 0 then exit function 
		' 저장용 파일명을 지정하지 않을경우 업로드되는 파일명을 기본으로 한다.
		if Len(save_filename) = 0 then
			FileName = ImageFile1.FileName  
		else
			FileName = save_filename
		end if
	
		intComma = InstrRev(FileName, ".") 
		strName = Mid(FileName, 1, intComma - 1)    				' 확장자를 제외한 파일명을 얻는다.
		strExt = Mid(FileName, intComma + 1)     				   	'확장자를 얻는다.
		TempName = ""
		Randomize  			' 랜덤문을 선언한다.
		for i=1 to Len(strName)  '문자열을 한문자씩 읽어온다..
			char = mid(strName, i, 1)		
			if char = "_" then
				char = Chr(Int((122 - 97 + 1) * Rnd + 97))
			else
				char = mid(strName, i, 1)
			end if
			TempName = TempName & char
		next
		strName = TempName
		
		FileName = strName & "." & strExt  										' 우선 같은이름의 파일이 존재한다고 가정
		strFileName = FSO.FileNameCheck(save_path & FileName)
		ImageFile1.Save server.mappath(strFileName) 							' 파일을 실제로 저장한다.
		ABCUpload_File = Mid(strFileName,InstrRev(strFileName, "/")+1)
	
	End Function


'**************************************************************************
' 실제 작동되는 Insert, Update 함수
'**************************************************************************
	Public Sub SaveSQLForm()
		Dim SaveIdx
		Dim SQLTop, SQLBody, SQLBottom
		if Len(DefaultKeyHeader) = 0 then 
			response.write "키 헤더값이 없습니다."
			response.end
			exit Sub		' 헤더가 없으면 에러
		end if
	
		if Len(DefaultTableName) = 0 then 
			response.write "테이블 명이 빠졌습니다."
			response.end
			exit Sub		' 헤더가 없으면 에러
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
			' 업데이트 일 경우 쿼리
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
	
					if Right(save_header,5) = "_html" then			' html을 사용할경우 오른쪽 5글자가 _html이 들어가야한다.
						save_header = Left(save_header,Len(save_header) - 5)
					else
						NotUseHTML save_item
					end if
					
					if Len(DefaultKeyFieldValue) > 0 then
						' 업데이트 일 경우 쿼리
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
	
	' QueryString, Form , 업로드 컴포넌트용 Insert, Update 쿼리 생성 모듈
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
					if Right(save_header,5) = "_file" then		' 업로드일경우 오른쪽 5글자가 _file 이어야한다.
						save_item = ABCUpload_File(TmpUplpadDir, "",save_header)
						save_header = Left(save_header,Len(save_header) - 5)
						if trim(save_item) = "" then AddUpdate = false
					elseif Right(save_header,5) = "_html" then			' html을 사용할경우 오른쪽 5글자가 _html이 들어가야한다.
						save_header = Left(save_header,Len(save_header) - 5)
					else
						NotUseHTML save_item	
					end if
					
					if AddUpdate then
						if Len(strSQLTop) > 0 then strSQLTop = strSQLTop & "," & vbCrLf
						if Len(strSQLBody) > 0 then strSQLBody = strSQLBody & "," & vbCrLf
						if Len(DefaultKeyFieldValue) > 0 then
							' 업데이트 일 경우 쿼리
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
		' 소멸자
		If not UploadForm is Nothing Then Set UploadForm = nothing
		Set DBConn = Nothing
		Set FSO = Nothing
	End Sub

End Class
 
'###########################################  
'사용법
'Set XTUpdater = new XTclsDBUpdater
'Call XTUpdater.InitSetting(DBUpdaterForm, "mem", "member","mem_idx",DefUploadDir)
'Call XTUpdater.DBConnection("Provider=SQLOLEDB.1;Password=;Persist Security Info=True;User ID=;Initial Catalog=;Data Source=")
'Call XTUpdater.AddParam("admin_id","testAdmin")
'Call XTUpdater.AddParam("group_id","56")
'XTUpdater.SaveSQLForm
'Set XTUpdater = nothing
'###########################################  
%>