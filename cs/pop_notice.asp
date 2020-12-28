<!--#include virtual="/inc/header.asp" -->
<%
	Sql = "Select Top 1 * From board_body Where bb_idx = ? And bh_idx= 1"
	Set DBConn = new XTclsDbConn
	Call DBConn.AddParam("bb_idx", bb_idx)
	Set Rs = DBConn.RSOpen(SQL)
	Set DBConn = Nothing
	
	if not RS.eof then 
		RSCnt = RS.Fields.Count    '필드의 갯수
		for i = 0 to RSCnt - 1
			obj_name = RS.fields(i).name
			Execute(obj_name & " = RS(" & i & ")")
		Next

		if isNull(bb_readnum) then bb_readnum=  0
		bb_readnum = bb_readnum + 1

		Sql = "Update board_body Set bb_readnum = ? Where bb_idx = ?"
		Set DBConn = new XTclsDbConn
		Call DBConn.AddParam("bb_readnum", bb_readnum)
		Call DBConn.AddParam("bb_idx", bb_idx)
		Call DBConn.ExecSQL(SQL)
		Set DBConn = Nothing

		p_regist = replace(mid(bb_regist,1,10),"-",".")

	else
		Call MovePage("","CLOSE","DB 오류입니다.")
	End if
%>
<title>::고구려게임 공지사항::</title>

<link rel="stylesheet" type="text/css" href="/cs/css/etc.css">
<link rel="stylesheet" type="text/css" href="/pop/css/pop.css">

</head>

<body id="pop_notice">

<h1 class="blind">고구려게임</h1>
<div id="pop_wrap">
	<div id="pop_header">
		<h2>공지사항</h2>
		<a href="javascript:window.close()">닫기</a>
	</div>

	<div id="pop_container">
		<div id="pop_content">


			<p class="search"><input type="text" class="input" id="s_name"><a href="javascript:" class="btn_cs" onClick="MovePage('pop_notice_list.asp?s_name=' + $('#s_name').val())">검색</a></p>
			<div class="lst_tbl_style3 view">
				<div class="title"><%=bb_title%></div>
				<dl class="info"><dt>등록일 :</dt><dd><%=p_regist%></dd><dt>조회수 :</dt><dd><%=bb_readnum%></dd></dl>
				<div class="content"><%=bb_content%></div>
			</div>
			<div class="wrap_btn_board"><a href="/cs/pop_notice_list.asp" class="btn_cs">목록</a></div>

			<div class="wrap_btn border">
				<a href="javascript:window.close()" class="style1_nm">닫기</a>
			</div>
		
		</div>

	</div>

</div>
</body>
</html>