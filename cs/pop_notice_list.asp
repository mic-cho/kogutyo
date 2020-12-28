<!--#include virtual="/inc/header.asp" -->
<title>::고구려게임 공지사항::</title>

<link rel="stylesheet" type="text/css" href="/pop/css/pop.css">
<link rel="stylesheet" type="text/css" href="/cs/css/etc.css">

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
			<table class="lst_tbl_style3">
				<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">등록일</th>
					<th scope="col">조회</th>
				</tr>
				</thead>
				<tbody>
        <%

	itemSQL = "*"
	
	' 검색할 테이블
	tableSQL = "board_body"
	' 정렬 쿼리
	OrderSQL = "bb_idx Desc"
	' 한화면에 보여줄 페이징 리스트
	ViewPageCount = 20
	' 현재 페이지의 페이지 리스트 쿼리명
	PageNumberQuery = "page_list"
	
	Set DBConn = new XTclsDbConn

	' SQL 검색 쿼리
	WhereSQL = " bh_idx = 1"
	if len(s_name) >  0 then 
		WhereSQL = WhereSQL & " And bb_title like ?"
		Call DBConn.AddParam(s_type, "%" & s_name & "%")
	End if
	
	Set Rs = DBConn.RSPaging(itemSQL, tableSQL, WhereSQL, OrderSQL, ViewPageCount, PageNumberQuery)
	PrintPaging = DBConn.PrintPaging
	NowRecordNum = DBConn.GetIndexDesc
	GetTotalPage = DBConn.GetTotalPage
	DBConn.DbClose
	Set DBConn = nothing
	if not rs.Eof Then
		RSCnt = RS.Fields.Count    '필드의 갯수
		PrintNumber = NowRecordNum + 1
		Do Until rs.Eof 
			for i = 0 to RSCnt - 1
				obj_name = RS.fields(i).name
				Execute(obj_name & " = RS(" & i & ")")
			Next
			PrintNumber = PrintNumber - 1
			rs.movenext		
			p_regist = replace(mid(bb_regist,3,8),"-",".")
%>
				<tr>
					<td class="f11 fc_999"><%=PrintNumber%></td>
					<td class="title"><a href="/cs/pop_notice.asp?bb_idx=<%=bb_idx%>"><%=bb_title%></a></td>
					<td><%=p_regist%></td>
					<td class="f11 fc_666"><%=bb_readnum%></td>
				</tr>
        <%

		Loop
	End if
%>
				</tbody>
			</table>
<%=Edit_Paging("page_list",GetTotalPage)%>
			<div class="wrap_btn border">
				<a href="javascript:window.close()" class="style1_nm">닫기</a>
			</div>
        <%
Set RS = Nothing
%>		
		</div>

	</div>

</div>
</body>
</html>