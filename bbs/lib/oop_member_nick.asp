<%response.Expires = -1%>
<%response.Charset="KS_C_5601-1987"%>
<!--#include virtual="/bbs/class/cls_dbconnect.asp" -->
<!-- #include virtual="/bbs/lib/mdl_codemake.asp"-->
<%
id = request("id")
p_rtn = "false"

if len(id) > 1 and len(id) <= 20 then
	SQL = "Select Top 1 mem_pass From member Where mem_nick = ?"
	' DB에 접속한다.
	Set DBConn = new XTclsDbConn			' 클래스 선언
	Call DBConn.MakeParam("@mem_id", adVarChar, adParamInput, 20, id )				' 파라메터 입력 (mtc_id = [?]) 부분
	Set RS = DBConn.RSOpen(SQL)												' 레코드셋 받아오기 
	if rs.Eof or rs.Bof Then
		' 데이터가 없다면
		m_str = "사용 가능한 별명입니다."
		p_rtn = "true"
	else
		m_str = "이미 등록 되어있는 별명 입니다."
	end if
	Set RS = Nothing
	Set DBConn = nothing														' 클래스 종료

else
	m_str = "ID는 1 ~ 20 글자 사이입니다."
end if

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

tmpArr = split(ds_dont_id_name,",")
for i = lbound(tmpArr) to ubound(tmpArr)
	tmpArr(i) = trim(tmpArr(i))
	if instr(id,tmpArr(i)) > 0 then
		m_str = "닉네임에 금칙어가 포함되어있습니다."
		p_rtn = "false"
		exit for
	end if
next

%>
alert("<%=m_str%>");
CheckNick = <%=p_rtn%>;
