<%response.Expires = -1%>
<%response.Charset="KS_C_5601-1987"%>
<!--#include virtual="/bbs/class/cls_dbconnect.asp" -->
<!-- #include virtual="/bbs/lib/mdl_codemake.asp"-->
<%
id = request("id")
p_rtn = "false"
m_str = CheckMemberIDCheck(id)

Sql = "Select Top 1 * From default_setting"
Set DBConn = new XTclsDbConn
Set Rs = DBConn.RSOpen(SQL)
Set DBConn = Nothing

if not RS.eof then 
	RSCnt = RS.Fields.Count  
	for i = 0 to RSCnt - 1
		obj_name = RS.fields(i).name
		Execute(obj_name & " = RS(" & i & ")")
	Next
End if

if isNull(ds_dont_id_name ) then ds_dont_id_name= ""
tmpArr = split(ds_dont_id_name,",")
for i = lbound(tmpArr) to ubound(tmpArr)
	tmpArr(i) = trim(tmpArr(i))
	if instr(id,tmpArr(i)) > 0 then
		m_str = "ID에 금칙어가 포함되어있습니다."
		exit for
	end if
next

if len(m_str) = 0 then
		m_str = "사용 가능한 ID 입니다."
		p_rtn = "true"
end if


%>
alert("<%=m_str%>");
CheckID= <%=p_rtn%>;
