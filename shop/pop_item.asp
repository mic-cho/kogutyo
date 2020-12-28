<!--#include virtual="/inc/header.asp" -->
<title>::망고게임::</title>

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
		<h2>게임아이템 구매/상세보기</h2>
		<a href="javascript:window.close()">닫기</a>
	</div>

	<div id="pop_container">
		<div id="pop_content">

			<div class="section_goods">
				<p class="item"><img src="/common/img/item/gostop/87_79_T052.gif" title="아이템"></p>
				<ul>
				<li><strong>고스톱 도우미</strong></li>
				<li class="price">
					<dl>
					<dt>결제금액</dt><dd><span class="cash">10,000원</span></dd>
					<dt>구매수량</dt><dd><select><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option></select></dd>
					</dl>
				</li>
				<li>
					<dl>
					<dt>상품안내</dt><dd>고스톱 전용 아이템<b>게임 중 족보/미션을 알려드리는 도우미 아이템</b><ul class="info"><li>게임 중 족보/미션을 알려드리는 도우미 아이템</li><li>30일 내에 총 7회 사용 가능</li><li>(유효기간 만료 시 잔여횟수 사용 불가)</li></ul></dd>
					<dt>유효기간</dt><dd><span class="info">구매일로부터 1년</span><a href="javascript:ready();" class="btn3">청약철회 안내</a></dd>
					</dl>
				</li>
				</ul>
			</div>

			<h3>최종 결제금액</h3>
			<!-- 보유한 망고캐쉬 결제:start -->
			<div id="tab_container" class="section_payment">
				<ul class="etabs">
				<li class="tab"><a href="#tab_cash">망고캐쉬</a></li>
				<li class="tab"><a href="#tab_pay">바로결제</a></li>
				</ul>
				<div id="tab_cash" class="tab_payment">
					<dl>
					<dt class="cash">보유캐쉬</dt><dd>0</dd>
					<dt>상품금액</dt><dd class="goods_price">10,000</dd>
					</dl>
					<p>최종 결제 금액 : <strong>10,000원</strong></p>
					<div class="wrap_btn"><a href="/shop/pop_complete.asp"><i class="fa fa-check"></i>망고캐쉬로 구매하기</a></div>
				</div>
				<div id="tab_pay" class="tab_payment">
					<p>최종 결제 금액 : <strong>10,000원</strong></p>
					<div class="wrap_btn"><a href="/shop/pop_charge.asp"><i class="fa fa-check"></i>바로 결제하기</a></div>
				</div>
				<a href="javascript:ready();" class="btn3">월 구매한도 조회</a>
			</div>
			<!-- 보유한 망고캐쉬 결제:end -->

			<div class="wrap_btn">
				<a href="javascript:void();" onClick="javascript:window.close()" class="style1_nm">취소</a>
			</div>

		</div>

	</div>

</div>
</body>
</html>