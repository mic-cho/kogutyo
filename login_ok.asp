<%@  codepage="65001" language="VBScript" %>
<%response.Expires = -1%>
<%
Session.CodePage = 65001
Response.ChaRset = "utf-8"
%>
<!--#include virtual="/bbs/lib/oop_member_login.asp" -->
<%
ResultLogin = CookieError
if Len(ResultLogin) > 0 then 
	if Len(go_url) > 0 then
		Call MovePage(go_url,"MOVE",ResultLogin)
	else
		server.Execute("/bbs/lib/oop_member_logout.asp")
		Call MovePage("","BACK",ResultLogin)
	end if
else
	if Len(go_url) = 0 then go_url = request("go_url")
	if Len(go_url) = 0 then go_url = request.ServerVariables("HTTP_REFERER")
	Call MovePage(go_url,"MOVE","")
End if
%>