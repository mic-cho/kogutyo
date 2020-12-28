<!-- #include virtual="/dbopen.asp"-->
<!-- #include virtual="/bbs/lib/mdl_codemake.asp"-->
<%
response.Clear()
rtnMsg = ""
rtnMsg = CheckMemberIDCheck(request("id"))
%>
SetCheckID("<%=rtnMsg%>")