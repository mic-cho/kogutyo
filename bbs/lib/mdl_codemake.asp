<%
'################################################################################
'### 코드를 생성, ID 비밀번호 무결성 체크 함수 모음
'################################################################################
' 회원의 ID 무결성 체크하는 함수
Public Function CheckMemberIDCheck(ByVal tmp_id)
	Dim ChkMinWord : ChkMinWord = 4					' 최저 단어수
	Dim ChkMaxWord : ChkMaxWord = 20				' 최대 단어수
	Dim ChkFirstEngWord : ChkFirstEngWord = true	' 시작단어 영문만
	Dim UseEng : UseEng = true						' 영어사용여부
	Dim UseNum : UseNum = true						' 숫자사용여부
	Dim UseKor : UseKor = false						' 한글사용여부
	Dim UseEtc : UseEtc = false						' 특수문자사용여부
	Dim tmpIDLoop_i
	Dim tmpString
	Dim strCut
	Dim ErrMsg : ErrMsg = ""

	if Len(tmp_id) < ChkMinWord And Len(ErrMsg) = 0 then ErrMsg = "최저 " & ChkMinWord & "글자 이상이어야 합니다."
	if Len(tmp_id) > ChkMaxWord And Len(ErrMsg) = 0 then ErrMsg = "최대 " & ChkMaxWord & "글자 까지입니다."

	for tmpIDLoop_i = 1 to Len(tmp_id)
		if Len(ErrMsg) > 0 Then Exit For	' 에러 발생시 종료
		strCut = Mid(tmp_id, tmpIDLoop_i, 1)	'	일단 1만큼 잘라서 strCut에 저장한다.
		strCut = LCase(strCut)		'	일단 소문자로 만든다.
		strCut = Asc(strCut)		'	아스키 코드값 읽어오기
		strWord = Left(trim(strCut), 1)
		' 첫단어 영문 사용여부 체크
		if tmpIDLoop_i = 1 And ChkFirstEngWord  then
			if strCut < 97 And  122 < strCut then ErrMsg = "첫단어는 영문으로 시작해야 합니다."	
		End if	
		' 영문 사용 여부 처리
		if Not UseEng And (97 <= strCut And  strCut <= 122 ) then ErrMsg = "영문은 사용할수 없습니다."	
		' 숫자 사용 여부 처리
		if Not UseNum And (48 <= strCut And  strCut <= 57 ) then ErrMsg = "숫자는 사용할수 없습니다."	
		' 특수문자 체크
		if Not UseEtc And not (97 <= strCut And  strCut <= 122 ) And not (48 <= strCut And  strCut <= 57 ) then ErrMsg = "한글/특수문자는 사용할수 없습니다."
		' 2바이트 문자 체크
		if Not UseKor And Trim(strWord) = "-" then ErrMsg = "한글 ID는 사용할수 없습니다."
	next		

	tmpString = "Select Top 1 * From member_db Where mem_id = ?"
	Set MemDBConn = new XTclsDbConn			' 클래스 선언
	Call MemDBConn.AddParam("mem_id",tmp_id)
	Set CodeRS = MemDBConn.RSOpen(tmpString)
	Set MemDBConn = new XTclsDbConn			' 클래스 선언
	if not CodeRS.eof then ErrMsg = "이미 등록된 ID 입니다. 사용이 불가능 합니다."
	Set CodeRs = nothing
	
	CheckMemberIDCheck = ErrMsg
End Function

' 회원의 ID 무결성 체크하는 함수
Public Function CheckMemberNickCheck(ByVal tmp_id)
	Dim ChkMinWord : ChkMinWord = 2					' 최저 단어수
	Dim ChkMaxWord : ChkMaxWord = 20				' 최대 단어수
	Dim ChkFirstEngWord : ChkFirstEngWord = true	' 시작단어 영문만
	Dim UseEng : UseEng = true						' 영어사용여부
	Dim UseNum : UseNum = true						' 숫자사용여부
	Dim UseKor : UseKor = true						' 한글사용여부
	Dim UseEtc : UseEtc = true						' 특수문자사용여부
	Dim tmpIDLoop_i
	Dim tmpString
	Dim strCut
	Dim ErrMsg : ErrMsg = ""

	if Len(tmp_id) < ChkMinWord And Len(ErrMsg) = 0 then ErrMsg = "최저 " & ChkMinWord & "글자 이상이어야 합니다."
	if Len(tmp_id) > ChkMaxWord And Len(ErrMsg) = 0 then ErrMsg = "최대 " & ChkMaxWord & "글자 까지입니다."

	for tmpIDLoop_i = 1 to Len(tmp_id)
		if Len(ErrMsg) > 0 Then Exit For	' 에러 발생시 종료
		strCut = Mid(tmp_id, tmpIDLoop_i, 1)	'	일단 1만큼 잘라서 strCut에 저장한다.
		strCut = LCase(strCut)		'	일단 소문자로 만든다.
		strCut = Asc(strCut)		'	아스키 코드값 읽어오기
		strWord = Left(trim(strCut), 1)
		' 첫단어 영문 사용여부 체크
		if tmpIDLoop_i = 1 And ChkFirstEngWord  then
			if strCut < 97 And  122 < strCut then ErrMsg = "첫단어는 영문으로 시작해야 합니다."	
		End if	
		' 영문 사용 여부 처리
		if Not UseEng And (97 <= strCut And  strCut <= 122 ) then ErrMsg = "영문은 사용할수 없습니다."	
		' 숫자 사용 여부 처리
		if Not UseNum And (48 <= strCut And  strCut <= 57 ) then ErrMsg = "숫자는 사용할수 없습니다."	
		' 특수문자 체크
		if Not UseEtc And not (97 <= strCut And  strCut <= 122 ) And not (48 <= strCut And  strCut <= 57 ) then ErrMsg = "한글/특수문자는 사용할수 없습니다."
		' 2바이트 문자 체크
		if Not UseKor And Trim(strWord) = "-" then ErrMsg = "한글 ID는 사용할수 없습니다."
	next		

	tmpString = "Select Top 1 * From member_db Where mem_nick = ?"
	Set MemDBConn = new XTclsDbConn			' 클래스 선언
	Call MemDBConn.AddParam("mem_id",tmp_id)
	Set CodeRS = MemDBConn.RSOpen(tmpString)
	Set MemDBConn = new XTclsDbConn			' 클래스 선언
	if not CodeRS.eof then ErrMsg = "이미 등록된 닉네임 입니다. 사용이 불가능 합니다."
	Set CodeRs = nothing
	
	CheckMemberNickCheck = ErrMsg
End Function

' 회원의 비밀번호 무결성 체크하는 함수
Public Function CheckMemberPasswordCheck(ByVal tmp_id, ByVal tmp_pass)
	Dim ChkMinWord : ChkMinWord = 6				' 최저 단어수
	Dim ChkMaxWord : ChkMaxWord = 20				' 최대 단어수
	Dim ConSetCount : ConSetCount = 2			' 최저 조건수  (영,숫자,특수, 한글)
'	Dim ConGetCount : ConGetCount = Array(0,0,0,0,0)	' 현재 만족한 조건수
	Dim ConGetCount 								' 현재 만족한 조건수

	Dim ArrSetCount : ArrSetCount = 3			' 최저 연속된 문자수 (자리수 이상 검색)
	Dim ArrGetCount : ConGetCount= 0				' 현재 연속된 문자수

	Dim UseEng : UseEng = true						' 영어사용여부
	Dim UseNum : UseNum = true						' 숫자사용여부
	Dim UseKor : UseKor = false						' 한글사용여부
	Dim UseEtc : UseEtc = true						' 특수문자사용여부

	Dim tmpIDLoop_i
	Dim tmpString
	Dim strCut
	Dim ErrMsg : ErrMsg = ""

	ConGetCount = Array(0,0,0,0,0)

	'###############################################################################################
	' 비밀번호 문자열 길이 체크
	'###############################################################################################
	if Len(tmp_pass) < ChkMinWord And Len(ErrMsg) = 0 then ErrMsg = "최저 " & ChkMinWord & "글자 이상이어야 합니다."
	if Len(tmp_pass) > ChkMaxWord And Len(ErrMsg) = 0 then ErrMsg = "최대 " & ChkMinWord & "글자 까지입니다."

	'###############################################################################################
	' 계정명 동일여부  체크
	'###############################################################################################
	if tmp_id = tmp_pass And Len(ErrMsg) = 0 then ErrMsg = "ID와 비밀번호가 동일해서는 안됩니다."

	'###############################################################################################
	' 개인신상정보 비슷한 비밀번호 체크
	'###############################################################################################

	for tmpIDLoop_i = 1 to Len(tmp_pass)
		if Len(ErrMsg) > 0 Then Exit For	' 에러 발생시 종료
		strCut = Mid(tmp_pass, tmpIDLoop_i, 1)	'	일단 1만큼 잘라서 strCut에 저장한다.
		strCut = LCase(strCut)		'	일단 소문자로 만든다.
		strCut = Asc(strCut)		'	아스키 코드값 읽어오기
		strWord = Left(trim(strCut), 1)
		
		'###############################################################################################
		' 사용불가 문자 체크 시작
		' 영문 사용 여부 처리
		if Not UseEng And (97 <= strCut And  strCut <= 122 ) then ErrMsg = "영문은 사용할수 없습니다."	
		' 숫자 사용 여부 처리
		if Not UseNum And (48 <= strCut And  strCut <= 57 ) then ErrMsg = "숫자는 사용할수 없습니다."	
		' 특수문자 체크
		if Not UseEtc And not (97 <= strCut And  strCut <= 122 ) And not (48 <= strCut And  strCut <= 57 ) then ErrMsg = "특수문자는 사용할수 없습니다."
		' 2바이트 문자 체크
		if Not UseKor And Trim(strWord) = "-" then ErrMsg = "한글 ID는 사용할수 없습니다."
		' 사용불가 문자 체크 완료
		'###############################################################################################
		
		'###############################################################################################
		' 문자 조합 체크
		' 사용불가 문자 체크 시작
		if UseEng And (97 <= strCut And  strCut <= 122 ) then ConGetCount(1) = 1
		' 숫자 사용 여부 처리
		if UseNum And (48 <= strCut And  strCut <= 57 ) then ConGetCount(2) = 1
		' 특수문자 체크
		if UseEtc And not (97 <= strCut And  strCut <= 122 ) And not (48 <= strCut And  strCut <= 57 ) then ConGetCount(3) = 1
		' 2바이트 문자 체크
		if UseKor And Trim(strWord) = "-" then  ConGetCount(4) = 1
		' 문자 조합 체크
		'###############################################################################################


		'###############################################################################################
		' 문자나 숫자의 연속성 체크
		' 동일 숫자 체크, 연속문자 체크
		'###############################################################################################
		tmpString = array("","","")
		if tmpIDLoop_i > 2 And Len(ErrMsg) = 0 then
			
			tmpString(0) = Mid(tmp_pass, tmpIDLoop_i - 2, 1)
			tmpString(1) = Mid(tmp_pass, tmpIDLoop_i - 1, 1)
			tmpString(2) = Mid(tmp_pass, tmpIDLoop_i , 1)
			
			' 셋이 모두 동일 하다면 오류
			if tmpString(0) = tmpString(1) And tmpString(0) = tmpString(2) Then ErrMsg = "동일한 문자가 3회이상 연속될 수 없습니다."
			if Asc(tmpString(0)) + 1 = Asc(tmpString(1)) And Asc(tmpString(1)) + 1 = Asc(tmpString(2)) Then ErrMsg = "연속된 문자가 3회이상 연속될 수 없습니다."
			if Asc(tmpString(0)) - 1 = Asc(tmpString(1)) And Asc(tmpString(1)) - 1 = Asc(tmpString(2)) Then ErrMsg = "연속된 문자가 3회이상 연속될 수 없습니다."

		end if

	next


	'###############################################################################################
	' 문자 조합 체크
	if Len(ErrMsg) = 0 then
		for tmpIDLoop_i = 1 to 4
			ConGetCount(0) = ConGetCount(0) + ConGetCount(tmpIDLoop_i)
		next
		if ConGetCount(0) < ConSetCount then ErrMsg = "영문,숫자,특수 문자의 조합이 최저 " & ConSetCount & "개 이상이어야 합니다."
	End if
	' 문자 조합 체크
	'###############################################################################################

	CheckMemberPasswordCheck = ErrMsg
End Function

%>