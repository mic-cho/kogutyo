<!--#include virtual="/inc/header.asp" -->
<title>::고구려게임::</title>

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
<h1 class="blind">고구려게임 게임샵</h1>
<div id="pop_wrap">
	<div id="pop_header">
		<h2>고구려게임 캐쉬 충전하기</h2>
		<a href="javascript:window.close()">닫기</a>
	</div>

	<div id="pop_container">
		<div id="pop_content">

			<div class="payment_select">
				<h3 class="blind">결제금액 및 결제 수단 입력</h3>
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
							<ul><li><input type="radio" checked onclick="javascript:location.href='pop_charge.asp'">휴대폰</li><li><input type="radio" onclick="javascript:location.href='pop_charge_card.asp'">신용카드</li><li><input type="radio">무통장 입금<span>+10%</span></li><li><input type="radio">실시간 계좌이체<span>+10%</span></li></ul>
						</td>
					</tr>
				</table>
			</div>
			<!-- 핸드폰:start -->
			<div id="" class="payment_input">
				<strong>최종 결제 금액 : 10,000원</strong>
				<div>
					<span class="info">결제하실 휴대폰 번호를 입력하시고 확인버튼을 눌러주세요</span>
					<dl>
					<dt>휴대폰번호</dt><dd><select><option>010</option><option>011</option><option>016</option><option>017</option><option>019</option></select>-<input type="text">-<input type="text"><a href="javascript:ready();" class="btn">확인</a></dd>
					</dl>
					<!-- 휴대폰번호 입력 후 표시:start--> 
					<dl style="display:none"><dt>인증번호</dt><dd><input type="text" class="input"><a href="javascript:ready();" class="btn">확인</a></dd></dl>
					<!-- 휴대폰번호 입력 후 표시:end -->

				</div>
			</div>
			<!-- 핸드폰:end --> 

			<!-- 신용카드:start -->
			<div id="" class="payment_input" style="display:none">
				<strong>최종 결제 금액 : 10,000원</strong>
				<div>
					충전하시려면 아래 <b>확인</b> 버튼을 클릭해주세요
				</div>
			</div>
			<!-- 핸드폰:end --> 

			<div class="payment_term">
				<h3>결제정보 수집동의</h3>
				<div class="term"><img src="/shop/img/pop_term.gif" alt="결제정보 수집 및 제공 내용"></div>
				<ul class="info">
				<li>결제금액은 다음달 요금 고지서에 "소액결제" 항목으로 합산 청구됩니다.</li>
				</ul>
				<ul class="agree">
				<li><input type="checkbox">결제정보 수집 및 제공 동의하기<span><a href="javascript:ready();">상세보기</a></span></li>
				<li><input type="checkbox">모빌리언스 약관 동의하기</li>
				<li><input type="checkbox"><b>위 상품의 구매조건을 확인했고, 결제진행에 동의합니다.</b></li>
				</ul>
			</div>

			<div class="wrap_btn border">
				<a href="pop_charge_complete.asp">확인</a><a href="javascript:void();" onClick="javascript:window.close()" class="style1_nm">취소</a>
			</div>

		</div>

	</div>

</div>
</body>
</html>