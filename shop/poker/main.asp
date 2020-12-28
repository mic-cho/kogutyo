<!--#include virtual="/inc/header.asp" -->
<title>::망고포커몰::</title>
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

<!--#include virtual="/inc/top.asp" -->
	
	<div id="container" class="container_pokershop">
		<div class="shop_header">
			<h2><a href="/shop/poker/main.asp">포커몰</a></h2>
			<ul class="menu">
				<li class="avatar"><a href="/shop/poker/avatar.asp">포커아바타</a></li>
				<li class="pass"><a href="/shop/poker/pass.asp">포커패스</a></li>
				<li class="item"><a href="/shop/poker/item.asp">포커아이템</a></li>
				<li class="free"><a href="/shop/poker/free.asp">무료포커충전소</a></li>
			</ul>
			<p class="banner"><a href="javascript:ready();"><img src="/poker/img/banner_cash.png" title="망고게임 포커 매일매일 5,000캐쉬 이벤트" alt="망고게임 포커 매일 5,000 이벤트"></a></p>
		</div>
		<div id="content">
			<div class="body"> 
				<!--#include virtual="/poker/info.asp" -->
				<div id="shopmain" class="body_shop">
					<div class="section_avatar">
						<h3>포커머니가 필요하시다면?</h3>
						<div id="tab_container">
							<ul class="etabs">
								<li class="tab"><a href="#tab_avatar1">5천 아바타</a></li>
								<li class="tab"><a href="#tab_avatar2">1억 아바타</a></li>
								<li class="tab"><a href="#tab_avatar3">5억 아바타</a></li>
							</ul>
							<div id="tab_avatar1" class="tab_avatar">
								<ul>
<%
	SQL = "Select Top 3 * From game_avata Where ga_type in (0,1) And ga_gamemoney = 50000000 Order By NewID()"
	Set DBConn = new XTclsDbConn
	Set Rs = DBConn.RSOpen(SQL)
	Set DBConn = nothing
	
	if not rs.eof then
		RSCnt = RS.Fields.Count    '필드의 갯수
		PrintNumber = NowRecordNum + 1
		Do Until rs.Eof 
			for i = 0 to RSCnt - 1
				obj_name = RS.fields(i).name
				Execute(obj_name & " = RS(" & i & ")")
			Next
			rs.movenext
%>
									<li>
										<p class="avatar"><a href="#"><img src="<%=ga_img_url%>" title="아바타"></a></p>
										<p class="info"><strong><%=ga_name%></strong><span class="poker"><%=ga_money_text%></span><span class="cash"><%=formatnumber(ga_cash,0)%>캐쉬</span></p>
										<a href="javascript:void();" onClick="javascript:PopBuyAvata(<%=ga_idx%>)" class="btn">구매</a></li>
<%
		Loop
	End if
%>
								</ul>
							</div>
							<div id="tab_avatar2" class="tab_avatar">
								<ul>
<%
	SQL = "Select Top 3 * From game_avata Where ga_type in (0,1) And ga_gamemoney = 100000000 Order By NewID()"
	Set DBConn = new XTclsDbConn
	Set Rs = DBConn.RSOpen(SQL)
	Set DBConn = nothing
	
	if not rs.eof then
		RSCnt = RS.Fields.Count    '필드의 갯수
		PrintNumber = NowRecordNum + 1
		Do Until rs.Eof 
			for i = 0 to RSCnt - 1
				obj_name = RS.fields(i).name
				Execute(obj_name & " = RS(" & i & ")")
			Next
			rs.movenext
%>
									<li>
										<p class="avatar"><a href="#"><img src="<%=ga_img_url%>" title="아바타"></a></p>
										<p class="info"><strong><%=ga_name%></strong><span class="poker"><%=ga_money_text%></span><span class="cash"><%=formatnumber(ga_cash,0)%>캐쉬</span></p>
										<a href="javascript:void();" onClick="javascript:PopBuyAvata(<%=ga_idx%>)" class="btn">구매</a></li>
<%
		Loop
	End if
%>
								</ul>
							</div>
							<div id="tab_avatar3" class="tab_avatar">
								<ul>
<%
	SQL = "Select Top 3 * From game_avata Where ga_type in (0,1) And ga_gamemoney = 200000000 Order By NewID()"
	Set DBConn = new XTclsDbConn
	Set Rs = DBConn.RSOpen(SQL)
	Set DBConn = nothing
	
	if not rs.eof then
		RSCnt = RS.Fields.Count    '필드의 갯수
		PrintNumber = NowRecordNum + 1
		Do Until rs.Eof 
			for i = 0 to RSCnt - 1
				obj_name = RS.fields(i).name
				Execute(obj_name & " = RS(" & i & ")")
			Next
			rs.movenext
%>
									<li>
										<p class="avatar"><a href="#"><img src="<%=ga_img_url%>" title="아바타"></a></p>
										<p class="info"><strong><%=ga_name%></strong><span class="poker"><%=ga_money_text%></span><span class="cash"><%=formatnumber(ga_cash,0)%>캐쉬</span></p>
										<a href="javascript:void();" onClick="javascript:PopBuyAvata(<%=ga_idx%>)" class="btn">구매</a></li>
<%
		Loop
	End if
%>
								</ul>
							</div>
						</div>
						<a href="/shop/poker/avatar.asp" class="more">더보기</a> </div>
					<div class="section_item">
						<h3>필승! 포커 아이템</h3>
						<ul>
							<li>
								<p class="item"><a href="#"><img src="/common/img/item/poker/87_79_T24.gif" title="아이템"></a></p>
								<div class="info"><strong>슈퍼 방장</strong><span class="cash">1,000원</span>
									<ul>
										<li>방 만들기 옵션을 내 맘대로!</li>
									</ul>
								</div>
								<a href="javascript:void();" onClick="javascript:popup_window('/shop/pop_item.asp', '아이템 구매/상세보기', 'scrollbars=no,resizable=no,width=500,height=720,top=200,left=400')" class="btn">구매</a></li>
							<li>
								<p class="item"><a href="#"><img src="/common/img/item/poker/87_79_T275.gif" title="아이템"></a></p>
								<div class="info"><strong>버린 카드 보기</strong><span class="cash">500원</span>
									<ul>
										<li>망고바둑이 교체카드 노출</li>
										<li>노출/비노출 옵션 선택 가능</li>
									</ul>
								</div>
								<a href="javascript:void();" onClick="javascript:popup_window('/shop/pop_item.asp', '아이템 구매/상세보기', 'scrollbars=no,resizable=no,width=500,height=720,top=200,left=400')" class="btn">구매</a></li>
							<li>
								<p class="item"><a href="#"><img src="/common/img/item/poker/87_79_C01.gif" title="아이템"></a></p>
								<div class="info"><strong>찬스</strong><span class="cash">10,000원</span>
									<ul>
										<li>이기면 찬스 성공X2!</li>
										<li>잃은 머니를 즉시 복구</li>
									</ul>
								</div>
								<a href="javascript:void();" onClick="javascript:popup_window('/shop/pop_item.asp', '아이템 구매/상세보기', 'scrollbars=no,resizable=no,width=500,height=720,top=200,left=400')" class="btn">구매</a></li>
						</ul>
						<a href="/shop/poker/item.asp" class="more">더보기</a> </div>
					<div class="section_pass">
						<h3>포커 매니아라면! 포커 패스</h3>
						<a href="/shop/poker/pass.asp"><img src="/shop/img/poker/pass_gold.jpg" title="골드패스"></a> <a href="/shop/poker/pass.asp" class="more">더보기</a>
						<div class="pass_avatar">
							<ul>
<%
	SQL = "Select Top 6 * From game_avata Where ga_type in (0,1) And ga_gamemoney = 50000000 Order By NewID()"
	Set DBConn = new XTclsDbConn
	Set Rs = DBConn.RSOpen(SQL)
	Set DBConn = nothing
	
	if not rs.eof then
		RSCnt = RS.Fields.Count    '필드의 갯수
		PrintNumber = NowRecordNum + 1
		Do Until rs.Eof 
			for i = 0 to RSCnt - 1
				obj_name = RS.fields(i).name
				Execute(obj_name & " = RS(" & i & ")")
			Next
			rs.movenext
%>
								<li>
									<p class="avatar"><a href="#"><img src="<%=ga_img_url%>" title="아바타"></a></p>
									<p class="info"><strong><%=ga_name%></strong><span class="poker"><%=ga_money_text%></span><span class="cash"><%=formatnumber(ga_cash,0)%>캐쉬</span></p>
									<a href="javascript:void();" onClick="javascript:PopBuyAvata(<%=ga_idx%>)" class="btn">구매</a></li>
<%
		Loop
	End if
%>
							</ul>
						</div>
					</div>
					<!--#include virtual="/common/event.asp" --> 
				</div>
			</div>
		</div>
	</div>
	
	<!--#include virtual="/inc/footer.asp" -->