<!--#include virtual="/inc/header.asp" -->
<title>::망고섯다::</title>
<link rel="stylesheet" type="text/css" href="/gostop/css/gostop.css">

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
	
	<div id="container" class="container_dori">
		<div id="content">
			<div class="gamemain">
				<h2><a href="/gostop/sutda.asp">망고도리짓고<span>타짜들의 짜릿한 승부!</span></a></h2>
				<!--#include virtual="/gostop/menu.asp" -->
				<!--#include virtual="/gostop/channel_dori.asp" -->
				<ul class="select_game">
					<li class="matgo"><a href="/gostop/matgo.asp">망고맞고</a></li>
					<li class="sutda"><a href="/gostop/sutda.asp">망고섯다</a></li>
					<li class="dori"><a href="/gostop/dori.asp">망고도리짓고</a></li>
				</ul>
				<div class="channel">
					<ul>
					<li class="free"><a href="javascript:ready();">(일반)자유<span>제한없음</span><i>입장</i></a></li>
					<li class="c1_1"><a href="javascript:ready();">점5천방1<span>5천~1억미만</span><i>입장</i></a></li>
					<li class="c1_2"><a href="javascript:ready();">점5천방2<span>5천~1억미만</span><i>입장</i></a></li>
					<li class="c2_1"><a href="javascript:ready();">점1만방1<span>1억~10억미만</span><i>입장</i></a></li>
					<li class="c2_2"><a href="javascript:ready();">점1천방2<span>1억~10억미만</span><i>입장</i></a></a></li>
					<li class="c4"><a href="javascript:ready();" class="off">점2만방<span>1억~100억미만</span><i>입장불가</i></a></a></li>
					<li class="robot"><a href="javascript:ready();">(연습)연습로봇<span>제한없음</span><i>입장</i></a></a></li>
					</ul>
				</div>
				<p class="banner"><a href="/event/index.asp"><img src="/poker/img/banner_cash.png" title="망고게임 포커 매일매일 5,000캐쉬 이벤트" alt="망고게임 포커 매일 5,000 이벤트"></a></p>
			</div>
			<div class="body"> 
				<!--#include virtual="/gostop/info.asp" -->
				<div class="body_shop"> 
					<!--#include virtual="/gostop/best.asp" --> 
					<!--#include virtual="/common/shop.asp" --> 
				</div>
			</div>
			<div class="license">
				<p><img src="/gostop/img/license_sutda.gif"></p>
			</div>
		</div>
	</div>
	
	<!--#include virtual="/inc/footer.asp" -->