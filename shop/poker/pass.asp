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
			<li class="pass"><a href="/shop/poker/pass.asp" class="on">포커패스</a></li>
			<li class="item"><a href="/shop/poker/item.asp">포커아이템</a></li>
			<li class="free"><a href="/shop/poker/free.asp">무료포커충전소</a></li>
			</ul>
			<p class="banner"><a href="javascript:ready();"><img src="/poker/img/banner_cash.png" title="망고게임 포커 매일매일 5,000캐쉬 이벤트" alt="망고게임 포커 매일 5,000 이벤트"></a></p>
		</div>

		<div id="content">
			<div class="body">
				<!--#include virtual="/poker/info.asp" -->
				<div id="passmain" class="body_shop">

					<div class="section_shopinfo">
						<h3>포커패스 안내</h3>
						<div>
							<p><strong>망고게임 포커패스란?</strong>망고게임 포커게임 마니아인 회원님께 안성맞춤!<br>포커머니, 포인트, 전용옵션, 아이템 제공 및 무료충전 추가지급 등의 다양한 혜택을 드립니다!</p>
							<ul><li><a href="javascript:ready();">내게임패스룸 바로가기</a></li></ul>
							<p class="btn"><a href="javascript:ready();">포커패스 전체 비교하기</a></p>
						</div>
					</div>

					<div class="section_passmain">
						<h3>포커마니아라면! 포커패스</h3>
						<span class="tip">구매하신 포커패스 잔여기간 확인을 원하시면 <a href="javascript:ready();">내게임패스룸</a>을 이용해주세요.</span>
						<div class="wrap">
							<ul class="tab"><li><a href="javascript:ready();"><img src="/shop/img/poker/passmain_tab.jpg" title="포커패스 서브메뉴"></a></li></ul>
							<p class="passreview"><img src="/shop/img/poker/passmain_gold.jpg" title="포커 골드패스"></p>
							<p class="passinfo"><img src="/shop/img/poker/passmain_gold_info.gif" title="포커 골드패스"></p>
						</div>
					</div>
				</div>
			</div>
		<div>

	</div>

<!--#include virtual="/inc/footer.asp" -->