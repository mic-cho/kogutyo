<!--#include virtual="/bbs/lib/defGlobal.asp" -->
<!--#include virtual="/bbs/class/cls_dbupdater.asp" -->
<%
response.Clear()

Sql = "Select Top 1 * From default_setting"
Set DBConn = new XTclsDbConn			' Ŭ���� ����
Set Rs = DBConn.RSOpen(SQL)												' ���ڵ�� �޾ƿ��� 
Set DBConn = Nothing

if not RS.eof then 
	RSCnt = RS.Fields.Count    '�ʵ��� ����
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




' SMS ������ ��� <------------- �̰� ���
' strDest_org =  010-1234-5678$$010-2345-6987
' strData_org = ����1$$����2$$����3
' $$�� �����Ѵ�.
Sub SendSMS(strDest_org ,strData_org )


	Dim userid           ' ���ڳ��� ���̵�
	Dim passwd           ' ���ڳ��� ��й�ȣ
	Dim hpSender         ' �����º� �ڵ�����ȣ
	Dim hpReceiver       ' �޴º��� �ڵ�����ȣ
	Dim adminPhone       ' ���� �޽����� ������ ������ �ڵ�����ȣ
	Dim hpMesg           ' �޽���
	
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
Randomize  '�����ʱ�ȭ
For i = 1 To 6
	r = Int((10-1+1) * Rnd + 1) '15�� str�� ����
	tmpCode = tmpCode & Mid(str,r,1)
Next


SendSMS request("hp"),  ds_admin_phone_name & vbcrlf & "������ȣ : " & tmpCode
%>	
<script language="JavaScript" type="text/JavaScript">
parent.check_hp_code = <%=tmpCode%>;
alert("������ȣ�� �߼��Ͽ����ϴ�.")
</script>
