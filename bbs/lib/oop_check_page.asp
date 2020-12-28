<%
	Dim Referer_Page
	Referer_Page = UCASE(Request.ServerVariables("HTTP_REFERER"))
	SERVER_NAME = Request.ServerVariables("SERVER_NAME")
	if InStr(Referer_Page, UCASE(SERVER_NAME)) = 0 Then
		response.redirect("/logout.asp")
	end if
%>