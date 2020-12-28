<!--#include virtual="/inc/header.asp" -->
<title>::고구려게임 포인트 전환::</title>

<link rel="stylesheet" type="text/css" href="/pop/css/pop.css">

</head>

<body id="pop_pokermoney">

<h1 class="blind">고구려게임</h1>
<div id="pop_wrap">
	<div id="pop_header">
		<h2>포커머니 무료충전</h2>
		<a href="javascript:window.close()">닫기</a>
	</div>

	<div id="pop_container">
		<div id="pop_content">

			<!--무료충전 가능:start-->
			<div class="section_freecharge">
				<i class="fa fa-battery-1"></i>
				<div>
					<strong class="fc_2750bc">10만 골드 무료 충전하시겠습니까?</strong>
					<span>무료충전 횟수 및 무료충전 머니가 차감됩니다.<span>
					<a href="/poker/pop_freecharge_success.asp" class="btn">무료충전</a>
				</div>
			</div>
			<!--무료충전 가능:end-->
			<!--무료충전 불가능(게임기록없음):start-->
			<div class="section_freecharge" style="display:none">
				<i class="fa fa-exclamation-triangle"></i>
				<div>
					<strong>게임 기록이 없어, 무료충전 혜택 대상이 아닙니다.<br>지금 고구려 포커게임을 즐겨보세요!</strong>
				</div>
			</div>
			<!--무료충전 불가능(게임기록없음):end-->

			<!--무료충전 불가능(잔여무료충전없음):start-->
			<div class="section_freecharge" style="display:none">
				<i class="fa fa-battery-empty"></i>
				<div>
					<strong>잔여 무료충전 포커머니가 모두 소진되었습니다.<br>무료충전머니는 매일 오전 9시에 초기화 됩니다.</strong>
				</div>
			</div>
			<!--무료충전 불가능(잔여무료충전없음):end-->

			<!--무료충전 불가능(보유게임머니 충분):start-->
			<div class="section_freecharge" style="display:none">
				<i class="fa fa-exclamation-triangle"></i>
				<div>
					<strong>포커머니가 충분하여 무료충전이 불가능합니다.<br>무료충전은 보유 포커머니가 10만 골드 이하일 때 가능합니다.</strong>
				</div>
			</div>
			<!--무료충전 불가능(보유게임머니 충분):end-->

			<h3><i class="fa fa-exclamation-circle"></i>포커머니 무료충전 정보</h3>
			<div class="section_freeinfo">
				<ul>
				<li>남은 충전수 : <b class="fc_223e66">4회</b></li>
				<li>1회 충전 머니 : <b class="fc_223e66">10만 골드</b></li>
				<li>1일 충전 초기화 기준 시간 : 매일 <b class="fc_223e66">오전 9시</b>(24시간 단위)</li>
				<li>충전 조건 : <b class="fc_223e66">하수</b> 등급 이하, 머니 <b class="fc_223e66">10만 골드</b> 미만</li>
				</ul>
			</div>

			<h3><i class="fa fa-question-circle"></i>무료충전이 더 필요하시다면</h3>
			<div class="section_adpass">
				<p><img src="/common/img/pass/poker/pass1.gif" title="포커패스"></p>
				<ul>
				<li class="bgx"><b class="f12"><strong class="fc_2a696e">로티플 패스</strong>를 이용해보세요!</b></li>
				<li>패스 전용 리필 <b class="fc_2a696e">50만</b> X 일 4회</li>
				<li>무료리필과 <b>중복제공</b>!</li>
				<li class="bgx"><a href="javascript:window.close(); javascript:parent.opener.location.href='/shop/poker/pass.asp'" class="btn"><span>자세히</span></a></li>
				</ul>
			</div>

			<div class="wrap_btn border">
				<a href="javascript:window.close();">확인</a><a href="javascript:window.close()" class="style1_nm">취소</a>
			</div>
		
		</div>

	</div>

</div>
</body>
</html>