<!-- METADATA TYPE="typelib" NAME="ADODB Type Library" FILE="C:\Program Files\Common Files\SYSTEM\ADO\msado15.dll" -->
<!--#include virtual="/bbs/lib/mdl_paging.asp" -->
<%
Class XTclsDbConn
	Private DefaultConnString
	Private DefaultConnection
	Private DefaultConnType			' 접속상태 설정을 한다.
	Private DefaultTransStatus		' 트랜잭션 상태를 나타낸다
	Private ParamCollection			' 사용될 파라메터
	Private ParamCounter			' 파라메터의 카운터		
	Private DefaultSQLLog			' SQL 쿼리 오류시 레코드 출력 , 기본 false

	' 페이징용 변수 모음
	Private CntTotalRecord			' 전체 레코드 숫자
	Private CntTotalPage			' 전체 페이지 숫자
	Private DefaultPageList			' 페이징을 시키는 QueryString 변수 명
	Private DefaultStartIndexDesc	' 현재 페이지의 시작번호 (역순 : 10,9,8,7,6)
	Private DefaultStartIndexAsc	' 현재 페이지의 시작번호 (정순 : 1,2,3,4,5)

	Private Sub Class_Initialize()
		' 생성자
		' 접속 커넥션을 저장한다
		DefaultConnString = "Provider=SQLOLEDB.1;Password=akdrh123!@#;Persist Security Info=True;User ID=mangogame;Initial Catalog=mangogame;Data Source=."
		Set	DefaultConnection = Nothing
		DefaultConnType = adCmdText
		DefaultTransStatus = false
		
		ParamCollection = Array()
		ParamCounter = 0
		DefaultSQLLog = false
	End Sub
	  
	'########################################################
	' 커넥션을 변경할경우나 현제 켜넥션을 받아올때 사용한다.
	'########################################################
	Public Function DBConnection(strParam)
		DefaultConnString = strParam
	End Function

	Public Function SetConnType(strParam)
		'adCmdStoredProc	: 프로시저를 이용할 경우
		'adCmdText			: SQL 쿼리를 이용할 경우
		DefaultConnType = strParam
	End Function

	Public Function SetTransStatus(strParam)
		DefaultTransStatus = strParam
	End Function

	Public Property Let SetSQLLog(strParam)
		DefaultSQLLog = strParam
	End Property


	'########################################################
	' DB서버와 커넥션을 연결한다.
	' DefaultTransStatus 값이 true 일경우 트랜잭션을 실행 한다.
	'########################################################
	Public Sub DBOpen()
		If DefaultConnection is Nothing Then
			Set DefaultConnection = CreateObject("ADODB.Connection")
			DefaultConnection.Open DefaultConnString
			if DefaultTransStatus then DefaultConnection.BeginTrans
		End If
	End Sub

	'########################################################
	' DB서버와 커넥션을 종료 한다.
	'########################################################
	Public Sub DBClose()
		if (Not DefaultConnection is Nothing) Then 
			' 만약 트랜잭션중에 비정상 종료일경우 롤백시킨다.
			if DefaultTransStatus then RollbackTrans
			if (DefaultConnection.State = adStateOpen) Then DefaultConnection.Close
			Set DefaultConnection = Nothing
		End if
	End Sub

	'########################################################
	' 활성화된 트랜잭션을 커밋한다.
	'########################################################
	Public Sub CommitTrans()
		If Not DefaultConnection Is Nothing Then
			DefaultConnection.CommitTrans
			DBClose
		End If
	End Sub
	
	'########################################################
	' 활성화된 트랜잭션을 롤백한다.
	'########################################################
	Public Sub RollbackTrans()
		If Not DefaultConnection Is Nothing Then
			DefaultConnection.RollbackTrans
			DBClose
		End If
	End Sub

	'########################################################
    ' 배열로 매개변수를 만든다.
	' 	PName : 매개변수의 이름 , @en_type
	' 	PType : 데이터 타입으로 DataTypeEnum 값 중 하나 ** (제일 아래 주석 참고)
	' 	PDirection : 매개변수의 종류로 ParameterDirectionEnum 값 중 하나 (추가시 : adParamInput) ** 아래 참고
	' 	PSize : 매개변수의 최대 길이(문자열 매개변수는 지정 필요)
	' 	PValue : 매개변수의 값
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

	' 사용불가 태그사용 저장시에 체크
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
    'Array로 넘겨오는 파라메터를 Parsing 하여 Parameter 객체를
    '생성하여 Command 객체에 추가한다.
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
    ' SQL Query를 실행하고, RecordSet을 반환한다.
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
    ' SQL 업데이트용 
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
	' 페이징을 원할경우 사용하는 변수
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
	
		'strOrderBy 구문의 처리
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
		' 전체 레코드 카운트를 계산한다.
		SQL = "Select Count(*)"
		SQL = SQL & " From " & strFrom
		Set CntRS = RSOpen(SQL & SQLWhere)
		
		' 전체 데이터의 갯수를 계산한다.
		CntTotalRecord = 0
		if not CntRS.eof then CntTotalRecord = CntRS(0)
		if IsNull(CntTotalRecord) or CntTotalRecord = "" then CntTotalRecord = 0
		
		' 전체 페이지수를 계산한다.
		CntTotalPage = 0
		if CntTotalRecord >= IntPageLine Then CntTotalPage = fix(CntTotalRecord / IntPageLine)
		if CntTotalRecord mod IntPageLine Then CntTotalPage = CntTotalPage + 1

		' 현재 불러올 페이지의 레코드 수를 계산한다. (짜투리 라인포함)
		Load_page = IntPageLine
		if Cint(IntPageList) >= CntTotalPage Then Load_page = CInt(CntTotalRecord mod IntPageLine)
		if Load_page = 0 Then Load_page = IntPageLine
		
		' 쿼리를 제작한다.
		SQL = "Select *"
		SQL = SQL & " From (Select Top " & Load_page & " * From ("
			SQL = SQL & "Select Top " & (IntPageLine * IntPageList) 
			SQL = SQL & " " & strItem
			SQL = SQL & " From " & strFrom
			SQL = SQL & SQLWhere						' 검색 조건식
			SQL = SQL & strOrderBy1
			SQL = SQL & ") A"
		SQL = SQL & strOrderBy2
		SQL = SQL & ") B"
		SQL = SQL & strOrderBy3

		DefaultStartIndexDesc = CntTotalRecord - (IntPageList - 1) * IntPageLine
		DefaultStartIndexAsc = (IntPageList - 1) * IntPageLine + 1

		Set RSPaging = RSOpen(SQL)
	End Function

	' 페이징을 출력해주는 함수	
	Public Function PrintPaging()
'		PrintPaging = Print_Paging(DefaultPageList, CntTotalPage, 10, "<img src=""/images/btn_back.gif"" width=""34"" height=""18"" align=""absmiddle"">", "<img src=""/images/btn_next.gif"" width=""34"" height=""18"" align=""absmiddle"">", "<strong>[id]</strong>", "[id]", "&nbsp;")
		PrintPaging = Print_Paging(DefaultPageList, CntTotalPage, 10, "[이전 10개]", "[다음 10개]", "<strong>[id]</strong>", "[id]", "&nbsp;")
	End Function

	' 페이징의 인덱스를 얻는다 (역순)
	Public Property Get GetIndexDesc()
		GetIndexDesc = DefaultStartIndexDesc
	End Property

	' 페이징의 인덱스를 얻는다 (정순)
	Public Property Get GetIndexAsc()
		GetIndexAsc = DefaultStartIndexAsc
	End Property

	' 전체 레코드갯수를 얻는다.
	Public Property Get GetTotalRecord()
		GetTotalRecord = CntTotalRecord
	End Property

	' 전체 페이지의 갯수를 얻는다.
	Public Property Get GetTotalPage()
		GetTotalPage = CntTotalPage
	End Property

	' 바이트 체크해주는 함수
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
				strCut = Mid(strText, i, 1)	'	일단 1만큼 잘라서 strRes에 저장한다.
				char = Asc(strCut)		'	아스키 코드값 읽어오기
				char = Left(char, 1)
				if char = "-" then			'	"-"이면 2바이트 문자임
					strByte = strByte + 2
				else
					strByte = strByte + 1
				end if
			next		
		end if
		Txt2Byte = strByte
	End Function


	Private Sub Class_Terminate()
		' 소멸자
		DBClose
	End Sub

End Class
 
'###########################################  
'사용법
'SQL = " Select Top 10 *"
'SQL = SQL & " From movie_temp_client"
'SQL = SQL & " Where mtc_id = ?"
'SQL = SQL & " And mtc_device_id Like ?"
'SQL = SQL & " Order By mtc_idx Asc"
'
'Set DBConn = new XTclsDbConn			' 클래스 선언
'Call DBConn.MakeParam("@id", adVarChar, adParamInput, 20, id)				' 파라메터 입력 (mtc_id = [?]) 부분
'Call DBConn.MakeParam("@device_id", adVarChar, adParamInput, 20, "%DE4F%")	' 파라메터입력 (mtc_device_id Like [?]) 부분
'Set Rs = DBConn.RSOpen(SQL)												' 레코드셋 받아오기 
'DBConn.DbClose																' DB Close			
'Set DBConn = nothing														' 클래스 종료
'
'###########################################  
' 매개변수 : ParameterDirectionEnum 
'adParamInput		 	1 기정치입니다.파라미터가 입력 파라미터인 것을 나타냅니다.
'adParamInputOutput 	3 파라미터가 입출력 파라미터인 것을 나타냅니다.
'adParamOutput 			2 파라미터가 출력 파라미터인 것을 나타냅니다.
'adParamReturnValue	 	4 파라미터가 반환값인 것을 나타냅니다
'adParamUnknown 		0 파라미터의 사용 방법이 불명한 것을 나타냅니다.
'###########################################  
' 데이터 타입 : DataTypeEnum 값
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