<%
' ����Ʈ üũ���ִ� �Լ�
Public Function LenByte(strText)
	Dim strLen, strByte, strCut, strRes, char, i
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
	LenByte = strByte
End Function

' ����Ʈ üũ���ִ� �Լ�
Public Function SendMail(mail_to,mail_from,mail_title,byVal mail_content)
'	fromMail = "�����»��<snd@xxx.co.kr>"
'	toMail   = "�޴»���̸�<rcv@xxx.co.kr>"
'	title    = "��������"
'	msgBody  = "���ϳ���"
	if Len(mail_to) = 0 then exit Function
	if Len(mail_from) = 0 then exit Function

	Set MailFSO = new XTclsFSO						' Ŭ���� ����
	OrgMail = MailFSO.Read_File("/mail/mail.asp")		' ���� ����
	Set MailFSO = nothing							' Ŭ���� ����
	
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
	'myMail.textBody = msgBody 'msgbody�� �ؽ�Ʈ�����ΰ��
	myMail.htmlBody = mail_content
	myMail.Send
	
	set myMail = nothing


End Function

%>