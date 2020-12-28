<!-- METADATA TYPE="typelib" NAME="ADODB Type Library" FILE="C:\Program Files\Common Files\SYSTEM\ADO\msado15.dll" -->
<!--#include virtual="/bbs/lib/mdl_paging.asp" -->
<%
Class XTclsDbConn
	Private DefaultConnString
	Private DefaultConnection
	Private DefaultConnType			' ���ӻ��� ������ �Ѵ�.
	Private DefaultTransStatus		' Ʈ����� ���¸� ��Ÿ����
	Private ParamCollection			' ���� �Ķ����
	Private ParamCounter			' �Ķ������ ī����		
	Private DefaultSQLLog			' SQL ���� ������ ���ڵ� ��� , �⺻ false

	' ����¡�� ���� ����
	Private CntTotalRecord			' ��ü ���ڵ� ����
	Private CntTotalPage			' ��ü ������ ����
	Private DefaultPageList			' ����¡�� ��Ű�� QueryString ���� ��
	Private DefaultStartIndexDesc	' ���� �������� ���۹�ȣ (���� : 10,9,8,7,6)
	Private DefaultStartIndexAsc	' ���� �������� ���۹�ȣ (���� : 1,2,3,4,5)

	Private Sub Class_Initialize()
		' ������
		' ���� Ŀ�ؼ��� �����Ѵ�
		DefaultConnString = "Provider=SQLOLEDB.1;Password=akdrh123!@#;Persist Security Info=True;User ID=mangogame;Initial Catalog=mangogame;Data Source=."
		Set	DefaultConnection = Nothing
		DefaultConnType = adCmdText
		DefaultTransStatus = false
		
		ParamCollection = Array()
		ParamCounter = 0
		DefaultSQLLog = false
	End Sub
	  
	'########################################################
	' Ŀ�ؼ��� �����Ұ�쳪 ���� �ѳؼ��� �޾ƿö� ����Ѵ�.
	'########################################################
	Public Function DBConnection(strParam)
		DefaultConnString = strParam
	End Function

	Public Function SetConnType(strParam)
		'adCmdStoredProc	: ���ν����� �̿��� ���
		'adCmdText			: SQL ������ �̿��� ���
		DefaultConnType = strParam
	End Function

	Public Function SetTransStatus(strParam)
		DefaultTransStatus = strParam
	End Function

	Public Property Let SetSQLLog(strParam)
		DefaultSQLLog = strParam
	End Property


	'########################################################
	' DB������ Ŀ�ؼ��� �����Ѵ�.
	' DefaultTransStatus ���� true �ϰ�� Ʈ������� ���� �Ѵ�.
	'########################################################
	Public Sub DBOpen()
		If DefaultConnection is Nothing Then
			Set DefaultConnection = CreateObject("ADODB.Connection")
			DefaultConnection.Open DefaultConnString
			if DefaultTransStatus then DefaultConnection.BeginTrans
		End If
	End Sub

	'########################################################
	' DB������ Ŀ�ؼ��� ���� �Ѵ�.
	'########################################################
	Public Sub DBClose()
		if (Not DefaultConnection is Nothing) Then 
			' ���� Ʈ������߿� ������ �����ϰ�� �ѹ��Ų��.
			if DefaultTransStatus then RollbackTrans
			if (DefaultConnection.State = adStateOpen) Then DefaultConnection.Close
			Set DefaultConnection = Nothing
		End if
	End Sub

	'########################################################
	' Ȱ��ȭ�� Ʈ������� Ŀ���Ѵ�.
	'########################################################
	Public Sub CommitTrans()
		If Not DefaultConnection Is Nothing Then
			DefaultConnection.CommitTrans
			DBClose
		End If
	End Sub
	
	'########################################################
	' Ȱ��ȭ�� Ʈ������� �ѹ��Ѵ�.
	'########################################################
	Public Sub RollbackTrans()
		If Not DefaultConnection Is Nothing Then
			DefaultConnection.RollbackTrans
			DBClose
		End If
	End Sub

	'########################################################
    ' �迭�� �Ű������� �����.
	' 	PName : �Ű������� �̸� , @en_type
	' 	PType : ������ Ÿ������ DataTypeEnum �� �� �ϳ� ** (���� �Ʒ� �ּ� ����)
	' 	PDirection : �Ű������� ������ ParameterDirectionEnum �� �� �ϳ� (�߰��� : adParamInput) ** �Ʒ� ����
	' 	PSize : �Ű������� �ִ� ����(���ڿ� �Ű������� ���� �ʿ�)
	' 	PValue : �Ű������� ��
	'########################################################
	Public Function MakeParam(PName,PType,PDirection,PSize,PValue)
		ReDim Preserve ParamCollection(ParamCounter)
		if Len(PValue) = 0 then PValue = ""
		PValue = CheckHTMLFilter(PValue)
		if Txt2Byte(PValue) > PSize then PSize = Round(Txt2Byte(save_item) * 2,0)
		ParamCollection(ParamCounter) = Array(PName, PType, PDirection, PSize, PValue)
		ParamCounter = ParamCounter + 1		
	End Function

	Public Function AddParam(save_header,save_item)
		MakeParam "@" & save_header, adVarChar, adParamInput, Round(Txt2Byte(save_item) * 2,0), save_item
	End Function

	' ���Ұ� �±׻�� ����ÿ� üũ
	Private Function CheckHTMLFilter(tmpValue)
		if isNull(tmpValue2) then 
			CheckHTMLFilter = ""
			exit function
		end if
		tmpValue2 = LCase(tmpValue)
		CheckArr = Split("<iframe||<script||</script||<style||</style||<object||</object||<param||<html||<head||<meta||<title||</head||<body||</body||</html","||")
		LoopCount = 0
		for LoopArr_i = lbound(CheckArr) to ubound(CheckArr)
			if inStr(tmpValue2,CheckArr(LoopArr_i)) > 0 then
				LoopCount = LoopCount + 1
				RepValue = replace(CheckArr(LoopArr_i),"<","&lt;")
				tmpValue2 = replace(tmpValue2,CheckArr(LoopArr_i),RepValue)
			end if
		next
		if LoopCount = 0 then tmpValue2 = tmpValue
		CheckHTMLFilter = tmpValue2
	End Function

	Public Function ClearParam()
		ReDim ParamCollection(0)
		ParamCollection = Array()
		ParamCounter = 0
	End Function


	'########################################################
    'Array�� �Ѱܿ��� �Ķ���͸� Parsing �Ͽ� Parameter ��ü��
    '�����Ͽ� Command ��ü�� �߰��Ѵ�.
	'########################################################
    Private Function collectParams(cmd)
		Dim i, l, u, params
	    If VarType(ParamCollection) = 8192 or VarType(ParamCollection) = 8204 or VarType(ParamCollection) = 8209 then 
		    params = ParamCollection
		    For i = LBound(params) To UBound(params)
			    l = LBound(params(i))
			    u = UBound(params(i))
			    ' Check for nulls.
			    If u - l = 4 Then
    				
				    If VarType(params(i)(4)) = vbString Then
					    If params(i)(4) = "" Then
						    v = Null
					    Else
						    v = params(i)(4)
					    End If
				    Else
					    v = params(i)(4)
				    End If
					if params(i)(3) < 10 then params(i)(3) = 10
				    cmd.Parameters.Append cmd.CreateParameter(params(i)(0), params(i)(1), params(i)(2), params(i)(3), v)
			    End If
		    Next

		    Set collectParams = cmd
		    Exit Function
	    Else
		    Set collectParams = cmd
	    End If
    End Function

	'########################################################
    ' SQL Query�� �����ϰ�, RecordSet�� ��ȯ�Ѵ�.
	'########################################################
	Public Function RSOpen(byVal strSQL)
		Dim ClsRS
		Dim ClsCMD
		if DefaultSQLLog then
			if response.IsClientConnected = false then response.End()
			response.Flush()
			response.Write(strSQL)
		end if
		
		if DefaultConnType = adCmdText then strSQL = "Set Nocount ON" & vbcrlf & strSQL
		DBOpen
		Set ClsRS = CreateObject("ADODB.RecordSet")
		Set ClsCMD = CreateObject("ADODB.Command")
		ClsCMD.ActiveConnection = DefaultConnection
		ClsCMD.CommandText = strSQL
		ClsCMD.CommandType = DefaultConnType
		Set ClsCMD = collectParams(ClsCMD)	
		ClsRS.CursorLocation = adUseClient
		ClsRS.Open ClsCMD, , adOpenStatic, adLockReadOnly
		
		Set ClsCMD.ActiveConnection = Nothing
		Set ClsCMD = Nothing
		Set ClsRS.ActiveConnection = Nothing
		if DefaultSQLLog then response.clear
		
		Set RSOpen = ClsRS
		DBClose
	End Function

	'########################################################
    ' SQL ������Ʈ�� 
	'########################################################
    Public Sub ExecSQL(strSQL)      
		Dim ClsCMD
		if DefaultSQLLog then
			if response.IsClientConnected = false then response.End()
			response.Flush()
			response.Write(strSQL)
		end if
		if DefaultConnType = adCmdText then strSQL = "Set Nocount ON" & vbcrlf & strSQL
		DBOpen
	    Set ClsCMD = CreateObject("ADODB.Command")
	    ClsCMD.ActiveConnection = DefaultConnection
	    ClsCMD.CommandText = strSQL
	    ClsCMD.CommandType = DefaultConnType
		Set ClsCMD = collectParams(ClsCMD)	
	    ClsCMD.Execute , , adExecuteNoRecords

		if DefaultSQLLog then response.clear
	    Set ClsCMD.ActiveConnection = Nothing
	    Set ClsCMD = Nothing
		DBClose
    End Sub


	' ######################################################################
	' ����¡�� ���Ұ�� ����ϴ� ����
	' Set Rs = DBConn.RSPaging("*", "movie_temp_client", "mtc_id = ?", "mtc_idx", 10, request("page_list"))
	' ######################################################################
	Public Function RSPaging(strItem, strFrom, strWhere, strOrderBy, IntPageLine, strPageList)
	
		Dim strOrderBy1, strOrderBy2, strOrderBy3 , TmpOrderBy, TmpItem, TmpItemString, TmpLoopCnt
		Dim SQL, SQLWhere, Load_page
		
		SQLWhere = ""
		if Len(Trim(strWhere)) > 0 then SQLWhere = " Where " & strWhere
		if Len(IntPageLine) = 0 then IntPageLine = 10

		DefaultPageList = strPageList
		if Len(DefaultPageList) = 0 or DefaultPageList = "" then DefaultPageList = "page_list"
		IntPageList = request(DefaultPageList)
		if Len(IntPageList) = 0 or IntPageList = "" then IntPageList = 1
	
		'strOrderBy ������ ó��
		strOrderBy1 = " Order By " & strOrderBy
		strOrderBy2 = ""
		TmpOrderBy = split(strOrderBy,",")
		For TmpLoopCnt = lbound(TmpOrderBy) to ubound(TmpOrderBy)
			if Len(strOrderBy2) > 0 then strOrderBy2 = strOrderBy2 & ", "
			if Len(strOrderBy3) > 0 then strOrderBy3 = strOrderBy3 & ", "
			TmpItem = split(Trim(TmpOrderBy(TmpLoopCnt))," ")
			TmpItemString = TmpItem(0)
			if inStr(TmpItemString,".") > 0 then TmpItemString = Mid(TmpItemString,inStr(TmpItemString,".") + 1)
			if ubound(TmpItem) = 0 then
				strOrderBy2 = strOrderBy2 & TmpItemString & " Desc"
				strOrderBy3 = strOrderBy3 & TmpItemString & " Asc"
			elseif UCase(TmpItem(1)) = "DESC" then
				strOrderBy2 = strOrderBy2 & TmpItemString & " Asc"
				strOrderBy3 = strOrderBy3 & TmpItemString & " Desc"
			else
				strOrderBy2 = strOrderBy2 & TmpItemString & " Desc"			
				strOrderBy3 = strOrderBy3 & TmpItemString & " Asc"
			end if
		Next
		strOrderBy2 = " Order By " & strOrderBy2
		strOrderBy3 = " Order By " & strOrderBy3
		' ��ü ���ڵ� ī��Ʈ�� ����Ѵ�.
		SQL = "Select Count(*)"
		SQL = SQL & " From " & strFrom
		Set CntRS = RSOpen(SQL & SQLWhere)
		
		' ��ü �������� ������ ����Ѵ�.
		CntTotalRecord = 0
		if not CntRS.eof then CntTotalRecord = CntRS(0)
		if IsNull(CntTotalRecord) or CntTotalRecord = "" then CntTotalRecord = 0
		
		' ��ü ���������� ����Ѵ�.
		CntTotalPage = 0
		if CntTotalRecord >= IntPageLine Then CntTotalPage = fix(CntTotalRecord / IntPageLine)
		if CntTotalRecord mod IntPageLine Then CntTotalPage = CntTotalPage + 1

		' ���� �ҷ��� �������� ���ڵ� ���� ����Ѵ�. (¥���� ��������)
		Load_page = IntPageLine
		if Cint(IntPageList) >= CntTotalPage Then Load_page = CInt(CntTotalRecord mod IntPageLine)
		if Load_page = 0 Then Load_page = IntPageLine
		
		' ������ �����Ѵ�.
		SQL = "Select *"
		SQL = SQL & " From (Select Top " & Load_page & " * From ("
			SQL = SQL & "Select Top " & (IntPageLine * IntPageList) 
			SQL = SQL & " " & strItem
			SQL = SQL & " From " & strFrom
			SQL = SQL & SQLWhere						' �˻� ���ǽ�
			SQL = SQL & strOrderBy1
			SQL = SQL & ") A"
		SQL = SQL & strOrderBy2
		SQL = SQL & ") B"
		SQL = SQL & strOrderBy3

		DefaultStartIndexDesc = CntTotalRecord - (IntPageList - 1) * IntPageLine
		DefaultStartIndexAsc = (IntPageList - 1) * IntPageLine + 1

		Set RSPaging = RSOpen(SQL)
	End Function

	' ����¡�� ������ִ� �Լ�	
	Public Function PrintPaging()
'		PrintPaging = Print_Paging(DefaultPageList, CntTotalPage, 10, "<img src=""/images/btn_back.gif"" width=""34"" height=""18"" align=""absmiddle"">", "<img src=""/images/btn_next.gif"" width=""34"" height=""18"" align=""absmiddle"">", "<strong>[id]</strong>", "[id]", "&nbsp;")
		PrintPaging = Print_Paging(DefaultPageList, CntTotalPage, 10, "[���� 10��]", "[���� 10��]", "<strong>[id]</strong>", "[id]", "&nbsp;")
	End Function

	' ����¡�� �ε����� ��´� (����)
	Public Property Get GetIndexDesc()
		GetIndexDesc = DefaultStartIndexDesc
	End Property

	' ����¡�� �ε����� ��´� (����)
	Public Property Get GetIndexAsc()
		GetIndexAsc = DefaultStartIndexAsc
	End Property

	' ��ü ���ڵ尹���� ��´�.
	Public Property Get GetTotalRecord()
		GetTotalRecord = CntTotalRecord
	End Property

	' ��ü �������� ������ ��´�.
	Public Property Get GetTotalPage()
		GetTotalPage = CntTotalPage
	End Property

	' ����Ʈ üũ���ִ� �Լ�
	Public Function Txt2Byte(strText)
		Dim strLen, strByte, strCut, strRes, char, i
		if IsNull(strText) or strText = "" then 
			strByte = 30
		else
			strLen = 0
			strByte = 0
			strLen = Len(strText)
			for i = 1 to strLen
				char = ""
				strCut = Mid(strText, i, 1)	'	�ϴ� 1��ŭ �߶� strRes�� �����Ѵ�.
				char = Asc(strCut)		'	�ƽ�Ű �ڵ尪 �о����
				char = Left(char, 1)
				if char = "-" then			'	"-"�̸� 2����Ʈ ������
					strByte = strByte + 2
				else
					strByte = strByte + 1
				end if
			next		
		end if
		Txt2Byte = strByte
	End Function


	Private Sub Class_Terminate()
		' �Ҹ���
		DBClose
	End Sub

End Class
 
'###########################################  
'����
'SQL = " Select Top 10 *"
'SQL = SQL & " From movie_temp_client"
'SQL = SQL & " Where mtc_id = ?"
'SQL = SQL & " And mtc_device_id Like ?"
'SQL = SQL & " Order By mtc_idx Asc"
'
'Set DBConn = new XTclsDbConn			' Ŭ���� ����
'Call DBConn.MakeParam("@id", adVarChar, adParamInput, 20, id)				' �Ķ���� �Է� (mtc_id = [?]) �κ�
'Call DBConn.MakeParam("@device_id", adVarChar, adParamInput, 20, "%DE4F%")	' �Ķ�����Է� (mtc_device_id Like [?]) �κ�
'Set Rs = DBConn.RSOpen(SQL)												' ���ڵ�� �޾ƿ��� 
'DBConn.DbClose																' DB Close			
'Set DBConn = nothing														' Ŭ���� ����
'
'###########################################  
' �Ű����� : ParameterDirectionEnum 
'adParamInput		 	1 ����ġ�Դϴ�.�Ķ���Ͱ� �Է� �Ķ������ ���� ��Ÿ���ϴ�.
'adParamInputOutput 	3 �Ķ���Ͱ� ����� �Ķ������ ���� ��Ÿ���ϴ�.
'adParamOutput 			2 �Ķ���Ͱ� ��� �Ķ������ ���� ��Ÿ���ϴ�.
'adParamReturnValue	 	4 �Ķ���Ͱ� ��ȯ���� ���� ��Ÿ���ϴ�
'adParamUnknown 		0 �Ķ������ ��� ����� �Ҹ��� ���� ��Ÿ���ϴ�.
'###########################################  
' ������ Ÿ�� : DataTypeEnum ��
'Const adEmpty = 0
'Const adTinyInt = 16
'Const adSmallInt = 2
'Const adInteger = 3
'Const adBigInt = 20
'Const adUnsignedTinyInt = 17
'Const adUnsignedSmallInt = 18
'Const adUnsignedInt = 19
'Const adUnsignedBigInt = 21
'Const adSingle = 4
'Const adDouble = 5
'Const adCurrency = 6
'Const adDecimal = 14
'Const adNumeric = 131
'Const adBoolean = 11
'Const adError = 10
'Const adUserDefined = 132
'Const adVariant = 12
'Const adIDispatch = 9
'Const adIUnknown = 13
'Const adGUID = 72
'Const adDate = 7
'Const adDBDate = 133
'Const adDBTime = 134
'Const adDBTimeStamp = 135
'Const adBSTR = 8
'Const adChar = 129
'Const adVarChar = 200
'Const adLongVarChar = 201
'Const adWChar = 130
'Const adVarWChar = 202
'Const adLongVarWChar = 203
'Const adBinary = 128
'Const adVarBinary = 204
'Const adLongVarBinary = 205
'Const adChapter = 136
'Const adFileTime = 64
'Const adPropVariant = 138
'Const adVarNumeric = 139
'Const adArray = &H2000
'###########################################
%>