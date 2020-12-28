<%
' 바이트 체크해주는 함수
Public Function LenByte(strText)
	Dim strLen, strByte, strCut, strRes, char, i
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
	LenByte = strByte
End Function

' 바이트 체크해주는 함수
Public Function SendMail(mail_to,mail_from,mail_title,byVal mail_content)
'	fromMail = "보내는사람<snd@xxx.co.kr>"
'	toMail   = "받는사람이름<rcv@xxx.co.kr>"
'	title    = "메일제목"
'	msgBody  = "메일내용"
	if Len(mail_to) = 0 then exit Function
	if Len(mail_from) = 0 then exit Function

	Set MailFSO = new XTclsFSO						' 클래스 선언
	OrgMail = MailFSO.Read_File("/mail/mail.asp")		' 폴더 생성
	Set MailFSO = nothing							' 클래스 종료
	
	OrgMail = replace(OrgMail,"""/","""http://www.sunjinedu.co.kr/")
	mail_content = replace(OrgMail,"[CONTENT]",mail_content)

	Set myMail=server.CreateObject("CDO.Message")
	Set iConf = myMail.Configuration
	With iConf.Fields
		.Item("http://schemas.microsoft.com/cdo/configuration/sendusing")       =1
		.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")      ="localhost"
		.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")  =25
		.Update
	End with
	myMail.From = mail_from
	myMail.To   = mail_to
	myMail.Subject = mail_title
	'myMail.textBody = msgBody 'msgbody가 텍스트메일인경우
	myMail.htmlBody = mail_content
	myMail.Send
	
	set myMail = nothing


End Function

%>