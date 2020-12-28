
<div class="section_notice">
	<dl>
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
</div>
<dl class="section_cs">
	<dt>고구려게임 고객센터</dt>
	<dd class="cs"><a href="javascript:ready();">고구려게임 고객센터</a></dd>
	<dd class="security"><a href="javascript:ready();">내 보안은 내가 지켜요</a></dd>
</dl>
<dl class="section_security">
	<dt>보안서비스</dt>
	<dd><a href="javascript:ready()"><img src="/common/img/info_cs_otp.jpg" title="고구려게임 OTP 보안 설정 바로가기" alt="고구려게임 OTP 보안 설정"></a></dd>
</dl>
