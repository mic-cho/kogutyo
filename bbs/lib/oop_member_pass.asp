<!--#include virtual="/bbs/class/cls_dbconnect.asp" -->
<!--#include virtual="/bbs/lib/mdl_codemake.asp" -->
<%
id = request("id")
pass = request("pass")
response.Write(id  & "<br>" & pass)
m_Str = CheckMemberPasswordCheck(id,pass)
if m_str = "" then m_str = "��밡���� ��й�ȣ �Դϴ�."
%>
<script language="JavaScript">
alert("<%=m_str%>");
</script>