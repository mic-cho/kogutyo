<!--#include virtual="/inc/header.asp" -->
<title>::망고게임::</title>
<%
if len(login_mem_id) = 0 then Call MovePage("","CLOSE","로그인후 이용해 주십시요")
Sql = "Select Top 1 * From game_avata_log Where gal_idx = ?"
Set DBConn = new XTclsDbConn
Call DBConn.AddParam("idx", idx)
Set Rs = DBConn.RSOpen(SQL)
Set DBConn = Nothing
if not RS.eof then 
	RSCnt = RS.Fields.Count    '필드의 갯수
	for i = 0 to RSCnt - 1
		obj_name = RS.fields(i).name
		Execute(obj_name & " = RS(" & i & ")")
	Next
else
	Call MovePage("","CLOSE","DB오류입니다.")
End if

Sql = "Select Top 1 * From game_avata Where ga_idx = ?"
Set DBConn = new XTclsDbConn
Call DBConn.AddParam("ga_idx", ga_idx)
Set Rs = DBConn.RSOpen(SQL)
Set DBConn = Nothing

if not RS.eof then 
	RSCnt = RS.Fields.Count    '필드의 갯수
	for i = 0 to RSCnt - 1
		obj_name = RS.fields(i).name
		Execute(obj_name & " = RS(" & i & ")")
	Next
else
	Call MovePage("","CLOSE","DB 에러입니다.")
End if

%>
<link rel="stylesheet" type="text/css" href="/pop/css/pop.css">
<link rel="stylesheet" type="text/css" href="/shop/css/shop.css">

<!-- import for easytabs -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/js/easytabs/jquery.hashchange.min.js" type="text/javascript"></script>
<script src="/js/easytabs/jquery.easytabs.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready( function() {
	$('#tab_container').easytabs();
});
</script>

</head>

<body>
<h1 class="blind">망고게임 게임샵</h1>
<div id="pop_wrap">
	<div id="pop_header">
		<h2>구매 완료</h2>
		<a href="javascript:window.close()">닫기</a>
	</div>

	<div id="pop_container">
		<div id="pop_content">

			<ul class="mygoods">
				<li><img src="<%=gal_img_url%>" title="아이템"></li>
				<li><strong><%=ga_name%></strong></li>
				<li><span class="price"><%=formatnumber(ga_cash,0)%>원</span></li>
				<li><%=gal_num%>개</li>
			</ul>

			<div class="section_result">
				위 상품의 구매가 완료되었습니다.<br>구입하신 상품에 대한 확인은 <a href="javascript:ready()">마이페이지</a>에서 확인하실 수 있습니다.
			</div>

			<div class="wrap_btn border">
				<a href="javascript:window.close()">확인</a>
			</div>

		</div>

	</div>

</div>
</body>
</html>