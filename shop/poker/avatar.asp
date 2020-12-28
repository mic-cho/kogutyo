<!--#include virtual="/inc/header.asp" -->
<title>::망고포커몰::</title>

<link rel="stylesheet" type="text/css" href="/shop/css/shop.css">

</head>
<body>

<!--#include virtual="/inc/top.asp" -->

	<div id="container" class="container_pokershop">

		<div class="shop_header">
			<h2><a href="/shop/poker/main.asp">포커몰</a></h2>
			<ul class="menu">
			<li class="avatar"><a href="/shop/poker/avatar.asp" class="on">포커아바타</a></li>
			<li class="pass"><a href="/shop/poker/pass.asp">포커패스</a></li>
			<li class="item"><a href="/shop/poker/item.asp">포커아이템</a></li>
			<li class="free"><a href="/shop/poker/free.asp">무료포커충전소</a></li>
			</ul>
			<p class="banner"><a href="javascript:ready();"><img src="/poker/img/banner_cash.png" title="망고게임 포커 매일매일 5,000캐쉬 이벤트" alt="망고게임 포커 매일 5,000 이벤트"></a></p>
		</div>

		<div id="content">
			<div class="body">
				<!--#include virtual="/poker/info.asp" -->
				<div id="avatarmain" class="body_shop">

					<div class="section_shopinfo">
						<h3>포커아바타 안내</h3>
						<div>
							<p><strong>망고게임 포커아바타</strong>망고게임 포커게임에서 사용하는 포커머니와 알을 지급하며,<br>내 아바타를 더욱 예쁘고 다양하게 꾸밀 수 있습니다.</p>
							<ul><li><a href="javascript:ready();">내아바타룸 바로가기</a></li><li><a href="javascript:ready();">포커머니 지급방법</a></li></ul>
						</div>
					</div>

					<div class="section_avatarmain">
						<h3>포커아바타</h3>
						<span class="tip">구매하신 아바타의 확인 및 착용을 원하시면 <a href="#">내아바타룸</a>을 이용해주세요.</span>
						<div class="wrap">
							<div class="list_avatar">
								<div class="head">
									<h4>5천만 아바타</h4>
									<dl><dt>지급머니 :</dt><dd>포커머니<span class="poker">5천만</span></dd><dd><span class="point">알 5개 지급</span></dd></dl>
									<dl class="fr"><dt>결제금액 :</dt><dd><span class="cash">5,000원</span></dd><dd><a href="javascript:popup_window('/shop/pop_avatar.asp', '아바타 구매/상세보기', 'scrollbars=no,resizable=no,width=500,height=720,top=200,left=400')" class="btn">구매하기</a></dd></dl>
								</div>
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
								<li><p class="avatar"><a href="#"><img src="<%=ga_img_url%>" title="아바타"></a></p><p class="info"><strong><%=ga_name%></strong><span class="cash"><%=formatnumber(ga_cash,0)%>캐쉬</span></p><a href="javascript:void();" onClick="javascript:PopBuyAvata(<%=ga_idx%>)" class="btn">구매</a></li>
<%
		Loop
	End if
%>
							</div>
							<div class="list_avatar">
								<div class="head">
									<h4>1억 아바타</h4>
									<dl><dt>지급머니 :</dt><dd>포커머니<span class="poker">1억</span></dd><dd><span class="point">알 10개 지급</span></dd></dl>
									<dl class="fr"><dt>결제금액 :</dt><dd><span class="cash">10,000원</span></dd><dd><a href="javascript:void();" onClick="javascript:popup_window('/shop/pop_avatar.asp', '아바타 구매/상세보기', 'scrollbars=no,resizable=no,width=500,height=720,top=200,left=400')" class="btn">구매하기</a></dd></dl>
								</div>
								<ul>
<%
	SQL = "Select Top 6 * From game_avata Where ga_type in (0,1) And ga_gamemoney = 100000000 Order By NewID()"
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
								<li><p class="avatar"><a href="#"><img src="<%=ga_img_url%>" title="아바타"></a></p><p class="info"><strong><%=ga_name%></strong><span class="cash"><%=formatnumber(ga_cash,0)%>캐쉬</span></p><a href="javascript:void();" onClick="javascript:PopBuyAvata(<%=ga_idx%>)" class="btn">구매</a></li>
<%
		Loop
	End if
%>
								</ul>
							</div>
							<div class="list_avatar">
								<div class="head">
									<h4>2억 아바타</h4>
									<dl><dt>지급머니 :</dt><dd>포커머니<span class="poker">2억</span></dd><dd><span class="point">알 20개 지급</span></dd></dl>
									<dl class="fr"><dt>결제금액 :</dt><dd><span class="cash">20,000원</span></dd><dd><a href="javascript:void();" onClick="javascript:popup_window('/shop/pop_avatar.asp', '아바타 구매/상세보기', 'scrollbars=no,resizable=no,width=500,height=720,top=200,left=400')" class="btn">구매하기</a></dd></dl>
								</div>
								<ul>
<%
	SQL = "Select Top 6 * From game_avata Where ga_type in (0,1) And ga_gamemoney = 200000000 Order By NewID()"
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
								<li><p class="avatar"><a href="#"><img src="<%=ga_img_url%>" title="아바타"></a></p><p class="info"><strong><%=ga_name%></strong><span class="cash"><%=formatnumber(ga_cash,0)%>캐쉬</span></p><a href="javascript:void();" onClick="javascript:PopBuyAvata(<%=ga_idx%>)" class="btn">구매</a></li>
<%
		Loop
	End if
%>								</ul>
							</div>
						</div>
						<a href="javascript:ready();" class="more">내아바타룸 바로가기</a>
					</div>
				</div>
			</div>
		<div>

	</div>

<!--#include virtual="/inc/footer.asp" -->