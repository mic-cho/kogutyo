<%response.Expires = -1%>
<%response.Charset="KS_C_5601-1987"%>
<!--#include virtual="/bbs/class/cls_dbconnect.asp" -->
<!-- #include virtual="/bbs/lib/mdl_codemake.asp"-->
<%
id = request("id")
p_rtn = "false"

if len(id) > 1 and len(id) <= 20 then
	SQL = "Select Top 1 mem_pass From member Where mem_nick = ?"
	' DB�� �����Ѵ�.
	Set DBConn = new XTclsDbConn			' Ŭ���� ����
	Call DBConn.MakeParam("@mem_id", adVarChar, adParamInput, 20, id )				' �Ķ���� �Է� (mtc_id = [?]) �κ�
	Set RS = DBConn.RSOpen(SQL)												' ���ڵ�� �޾ƿ��� 
	if rs.Eof or rs.Bof Then
		' �����Ͱ� ���ٸ�
		m_str = "��� ������ �����Դϴ�."
		p_rtn = "true"
	else
		m_str = "�̹� ��� �Ǿ��ִ� ���� �Դϴ�."
	end if
	Set RS = Nothing
	Set DBConn = nothing														' Ŭ���� ����

else
	m_str = "ID�� 1 ~ 20 ���� �����Դϴ�."
end if

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

tmpArr = split(ds_dont_id_name,",")
for i = lbound(tmpArr) to ubound(tmpArr)
	tmpArr(i) = trim(tmpArr(i))
	if instr(id,tmpArr(i)) > 0 then
		m_str = "�г��ӿ� ��Ģ� ���ԵǾ��ֽ��ϴ�."
		p_rtn = "false"
		exit for
	end if
next

%>
alert("<%=m_str%>");
CheckNick = <%=p_rtn%>;
