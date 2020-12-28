
<dl class="mem_notice">
	<dt>공지사항</dt>
<%
	Sql = "Select Top 4 * From board_body Where  bh_idx= 1 Order By bb_idx desc"
	Set DBConn = new XTclsDbConn
	Call DBConn.AddParam("bb_idx", bb_idx)
	Call DBConn.AddParam("bh_idx", BoardIndex)
	Set Rs = DBConn.RSOpen(SQL)
	Set DBConn = Nothing
	
	if not RS.eof then 
		RSCnt = RS.Fields.Count    '필드의 갯수
		do until rs.eof 
			for i = 0 to RSCnt - 1
				obj_name = RS.fields(i).name
				Execute(obj_name & " = RS(" & i & ")")
			Next
			rs.movenext
%>
	<dd><a href="javascript:popup_window('/cs/pop_notice.asp?bb_idx=<%=bb_idx%>', '공지사항', 'scrollbars=no,resizable=no,width=640,height=600,top=200,left=400')"><%=getString(bb_title,22)%></a></dd>
<%
		Loop
	End if
%>
</dl>
<dl class="member_cs">
	<dt>자주하는 질문</dt>
<%
	Sql = "Select Top 4 * From board_body Where  bh_idx= 3 Order By bb_idx desc"
	Set DBConn = new XTclsDbConn
	Call DBConn.AddParam("bb_idx", bb_idx)
	Call DBConn.AddParam("bh_idx", BoardIndex)
	Set Rs = DBConn.RSOpen(SQL)
	Set DBConn = Nothing
	
	if not RS.eof then 
		RSCnt = RS.Fields.Count    '필드의 갯수
		do until rs.eof 
			for i = 0 to RSCnt - 1
				obj_name = RS.fields(i).name
				Execute(obj_name & " = RS(" & i & ")")
			Next
			rs.movenext
%>
	<dd><a href="javascript:popup_window('/cs/pop_faq.asp?bb_idx=<%=bb_idx%>', '공지사항', 'scrollbars=no,resizable=no,width=640,height=600,top=200,left=400')"><%=getString(bb_title,22)%></a></dd>
<%
		Loop
	End if
%>
</dl>