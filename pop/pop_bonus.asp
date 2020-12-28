<!--#include virtual="/inc/header.asp" -->
<title>::고구려게임 포인트 전환::</title>

<link rel="stylesheet" type="text/css" href="/pop/css/pop.css">

</head>

<body id="pop_pokermoney">

<h1 class="blind">고구려게임</h1>
<div id="pop_wrap">
	<div id="pop_header">
		<h2>보너스 알 게임머니로 전환하기</h2>
		<a href="javascript:window.close()">닫기</a>
	</div>

	<div id="pop_container">
		<div id="pop_content">

			<!--전환할 보너스 알 선택:start-->
			<div class="section_bonus">

				<table class="tbstyle5">
					<thead>
					<caption>보너스 알로 게임머니 전환하기</caption>
					<tr>
						<th cols="row">보유한 알</th>
						<th cols="row">포커 머니로 전환</th>
						<th cols="row">고스톱 머니로 전환</th>
					</tr>
					</thead>
					<tbody>
					<tr class="on">
						<td>50알</td>
						<td><span class="pokerm">50만골드</span><input type="radio"></td>
						<td><span class="gostopm">50만냥</span><input type="radio"></td>
					</tr>
					<tr class="on">
						<td>100알</td>
						<td><span class="pokerm">200만골드</span><input type="radio"></td>
						<td><span class="gostopm">200만냥</span><input type="radio"></td>
					</tr>
					<tr>
						<td>150알</td>
						<td><span class="pokerm">300만골드</span><input type="radio"></td>
						<td><span class="gostopm">300만냥</span><input type="radio"></td>
					</tr>
					<tr>
						<td>200알</td>
						<td><span class="pokerm">450만골드</span><input type="radio"></td>
						<td><span class="gostopm">450만냥</span><input type="radio"></td>
					</tr>
					</tbody>
				</table>

				<div>
					<a href="/poker/pop_freecharge_success.asp" class="btn">무료충전</a>
				</div>
			</div>

			<!--전환할 보너스 알 선택:end-->

			<!-- 전환완료(성공):start -->
			<div class="section_bonus" style="display:none">
				<i class="fa fa-battery-1"></i>
				<div>
					<strong class="fc_2750bc">10만 골드로 전환되었습니다.</strong>
				</div>
			</div>
			<!-- 전환완료(성공):end -->

			<h3><i class="fa fa-exclamation-circle"></i>보너스 알 전환 안내</h3>
			<div class="section_freeinfo">
				<ul>
				<li>보유한 알 : <b class="fc_005230">10개</b></li>
				<li>유효기간 만료 예정 알 : <b>0개</b></li>
				<li>보너스 알 유효기간 : 보너스 알이 적립된 달부터 <b>6개월까지</b>(24시간 단위)</li>
				</ul>
			</div>

			<h3><i class="fa fa-question-circle"></i>보너스 알이 더 필요하시다면</h3>
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