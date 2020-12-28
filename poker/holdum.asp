<!--#include virtual="/inc/header.asp" -->
<title>::망고홀덤::</title>

<link rel="stylesheet" type="text/css" href="/poker/css/poker.css">

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

	<div id="container" class="container_holdum">

		<div id="content">

			<div class="gamemain">
				<h2><a href="/poker/holdum.asp"><img src="/poker/img/logo_holdem.png"></a></h2>
				<!--#include virtual="/poker/menu.asp" -->
				<!--#include virtual="/poker/channel_holdum.asp" -->
				<ul class="select_game">
				<li class="holdum"><a href="/poker/holdum.asp">망고홀덤</a></li>
				<li class="baduki"><a href="/poker/baduki.asp">망고바둑이</a></li>
				</ul>
				<div class="channel">
					<ul>
					<li class="free"><a href="javascript:ready();">(연습)자유<span>제한없음</span><i>입장</i></a></li>
					<li class="c1_1"><a href="javascript:ready();">점5천방1<span>5천~1억미만</span><i>입장</i></a></li>
					<li class="c1_2"><a href="javascript:ready();">점5천방2<span>5천~1억미만</span><i>입장</i></a></li>
					<li class="c2_1"><a href="javascript:ready();">점1만방1<span>1억~10억미만</span><i>입장</i></a></li>
					<li class="c2_2"><a href="javascript:ready();">점1천방2<span>1억~10억미만</span><i>입장</i></a></a></li>
					<li class="c4"><a href="javascript:ready();" class="off">점2만방<span>1억~100억미만</span><i>입장불가</i></a></a></li>
					<li class="c5"><a href="javascript:ready();">무제한<span>제한없음</span><i>입장</i></a></a></li>
					</ul>
				</div>
				<p class="banner"><a href="/event/index.asp"><img src="/poker/img/banner_cash.png" title="망고게임 포커 매일매일 5,000캐쉬 이벤트" alt="망고게임 포커 매일 5,000 이벤트"></a></p>
			</div>

			<div class="body">
				<!--#include virtual="/poker/info.asp" -->
				<div class="body_shop">
					<!--#include virtual="/poker/best.asp" -->
					<!--#include virtual="/common/shop.asp" -->
				</div>
			</div>

			<div class="license"><p><img src="/poker/img/license_holdum.gif"></p></div>
		</div>
	</div>

<!--#include virtual="/inc/footer.asp" -->