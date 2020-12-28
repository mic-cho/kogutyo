<!--#include virtual="/bbs/lib/defGlobal.asp" -->
<!--#include virtual="/bbs/class/cls_dbupdater.asp" -->
<%
response.Clear()

Sql = "Select Top 1 * From default_setting"
Set DBConn = new XTclsDbConn			' 클래스 선언
Set Rs = DBConn.RSOpen(SQL)												' 레코드셋 받아오기 
Set DBConn = Nothing

if not RS.eof then 
	RSCnt = RS.Fields.Count    '필드의 갯수
	for i = 0 to RSCnt - 1
		obj_name = RS.fields(i).name
		Execute(obj_name & " = RS(" & i & ")")
	Next
End if


FUNCTION SendMesg(url)
    Dim RStr
    Dim xmlHttp

    SET xmlHttp = Server.CreateObject("Microsoft.XMLHTTP")
    xmlHttp.open "GET", url, False
    xmlHttp.setRequestHeader "Content-Type","text/xml"
    xmlHttp.setRequestHeader "Accept-Language","ko"
    xmlHttp.send

    if xmlHttp.status = 200 then
        RStr = xmlHttp.responseText
    Else
        RStr = "get_fail"
    End if

    SET xmlHttp = Nothing

    SendMesg = RStr
END FUNCTION




' SMS 보내는 모듈 <------------- 이거 사용
' strDest_org =  010-1234-5678$$010-2345-6987
' strData_org = 내용1$$내용2$$내용3
' $$로 구분한다.
Sub SendSMS(strDest_org ,strData_org )


	Dim userid           ' 문자나라 아이디
	Dim passwd           ' 문자나라 비밀번호
	Dim hpSender         ' 보내는분 핸드폰번호
	Dim hpReceiver       ' 받는분의 핸드폰번호
	Dim adminPhone       ' 비상시 메시지를 받으실 관리자 핸드폰번호
	Dim hpMesg           ' 메시지
	
	Dim url              
	Dim result
	
	userid = "jsjslala"
	passwd = "123456789"
	hpSender = "01000000000"
	hpReceiver = strDest_org
	adminPhone = ""
	hpMesg = Server.URLEncode(strData_org)
	
	url = "http://www.winc7788.co.kr/MSG/send/web_admin_send.htm?userid=" & userid &_
	"&passwd=" & passwd & "&sender=" & hpSender & "&receiver=" &_
	hpReceiver & "&encode=1&message=" & hpMesg
	result = SendMesg(url)
	
End Sub


tmpCode = ""
str = "1234567890"
Randomize  '랜덤초기화
For i = 1 To 6
	r = Int((10-1+1) * Rnd + 1) '15는 str의 갯수
	tmpCode = tmpCode & Mid(str,r,1)
Next


SendSMS request("hp"),  ds_admin_phone_name & vbcrlf & "인증번호 : " & tmpCode
%>	
<script language="JavaScript" type="text/JavaScript">
parent.check_hp_code = <%=tmpCode%>;
alert("인증번호를 발송하였습니다.")
</script>
