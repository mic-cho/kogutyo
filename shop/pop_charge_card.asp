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
		<h2>망고게임 캐쉬 충전하기</h2>
		<a href="javascript:window.close()">닫기</a>
	</div>

	<div id="pop_container">
		<div id="pop_content">

			<div class="payment_select">
				<table summary="결제금액 및 결제수단 입력">
					<tr>
						<th scope="row">결제금액</th>
						<td>
							<ul class="f12">
							<li><input type="radio" checked><select><option>10,000</option><option>30,000</option><option>50,000</option><option>100,000</option></select>원</li>
							<li><input type="radio"><input type="text" class="input" value="직접입력" onfocus="if(this.value =='직접입력'){this.value=''}">원</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th scope="row">결제수단</th>
						<td>
							<ul><li><input type="radio" onclick="javascript:location.href='pop_charge.asp'">휴대폰</li><li><input type="radio" checked onclick="javascript:location.href='pop_charge_card.asp'">신용카드</li><li><input type="radio">무통장 입금<span>+10%</span></li><li><input type="radio">실시간 계좌이체<span>+10%</span></li></ul>
						</td>
					</tr>
				</table>
			</div>

			<div id="" class="payment_input">
				<strong>최종 결제 금액 : 10,000원</strong>
				<div>
					충전하시려면 아래 <b>확인</b> 버튼을 클릭해주세요
				</div>
			</div>

			<div class="payment_term">
				<h3>결제정보 수집동의</h3>
				<div class="term"><img src="/shop/img/pop_term.gif" alt="결제정보 수집 및 제공 내용"></div>
				<ul class="info">
				<li>해당 카드에 따라 VISA안심클릭, ISP, 일반결제로 진행됩니다.</li>
				<li>카드사에 따라 10만원 이상 결제시 공인인증서가 필요합니다.</li>
				</ul>
				<ul class="agree">
				<li><input type="checkbox">결제정보 수집 및 제공 동의하기<span><a href="javascript:ready();">[상세보기]</a></span></li>
				<li><input type="checkbox"><b>위 상품의 구매조건을 확인했고, 결제진행에 동의합니다.</b></li>
				</ul>
			</div>

			<div class="wrap_btn border">
				<a href="pop_complete.asp">확인</a><a href="javascript:void();" onClick="javascript:window.close()" class="style1_nm">취소</a>
			</div>

		</div>

	</div>

</div>
</body>
</html>