<!--#include virtual="/m/header.asp" -->
	<nav>
	<ul class="topmenu">
	<li class="on"><a href="/m/index.asp#mlist">모바일게임</a></li>
	<li><a href="/m/index.asp#plist">PC게임</a></li>
	</ul>
	</nav>

</div>

<!-- JS for SNS Share -->
<script src="/m/js/snsshare.js"></script>

<!-- DOCUMENT for jquery slider -->
<link rel="stylesheet" href="/m/js/flexslider.css" type="text/css" media="screen" />

<!-- FlexSlider -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="/m/js/libs/jquery-1.7.min.js">\x3C/script>')</script>

<script defer src="/m/js/jquery.flexslider.js"></script>

<script type="text/javascript">
$(function(){
  SyntaxHighlighter.all();
});
$(window).load(function(){
  $('.flexslider').flexslider({
	animation: "slide",
	itemWidth: 290,
	itemMargin: 5,
	maxItems: 2,
	start: function(slider){
	  $('body').removeClass('loading');
	}
  });
});
</script>

<!-- check for mobile divice -->
<script type="text/javascript">

$(document).ready(function($) {
	var isTouchDevice = 'ontouchstart' in window || navigator.msMaxTouchPoints;

	if (isTouchDevice) {
		$('.os').show();
	}
});

</script>

</header>


<hr />

<div id="ct">

<h1 class="blind">망고게임 모바일 다운로드페이지</h1>

	<div class="gameview">
		<div class="info">
			<p class="icon"><a href="/m/download.html"><img src="/m/img/icon_sample1.png" title="망고게임 섯다" alt="망고게임 섯다 다운로드"></a></p>
			<ul>
				<li><b>망고섯다</b><img src="/m/img/icon_new.gif" title="신규" alt="신규 게임"></li>
				<li class="genre">고스톱</li>
				<li>고수들의 뜨거운 전쟁!</br>망고섯다로 화끈한 손맛을 느껴보세요!</li>
				<li class="os"><span class="os_and">안드로이드</span><span class="os_ios">IOS</span></li>
			</ul>
		</div>

		<p class="download">
			<span class="gp_on"><a href="/m/download.asp" >구글플레이</a></span><span class="as_on"><a href="/m/download.asp">앱스토어</a></span>
		</p>

		<div class="sshot">

			<div class="flexslider">
				<ul class="slides">
				<li><img src="/m/img/gameview_ss1.jpg" title="샘플1" /></li>
				<li><img src="/m/img/gameview_ss2.jpg" title="샘플2" /></li>
				</ul>
			</div>

		</div>

		<div class="sns">

			<ul class="snsshare">
				<li class="kakao"><a href="javascript:void();" onclick="javascript:sendsns('kakaotalk','http://abc-7m.com/m/download.asp','고수들의 짜릿한 손맛! 망고섯다 모바일')"></a><span>카카오톡으로 공유하기</span></li>
				<li class="facebook"><a href="javascript:void();" onclick="javascript:sendsns('facebook','http://abc-7m.com/m/download.asp','고수들의 짜릿한 손맛! 망고섯다 모바일')"></a><span>페이스북으로 공유하기</span></li>
				<li class="twitter"><a href="javascript:void();" onclick="javascript:sendsns('twitter','http://abc-7m.com/m/download.asp','고수들의 짜릿한 손맛! 망고섯다 모바일')"></a><span>트위터로 공유하기</span></li>
			</ul>
		</div>

	</div>

</div>

<!--#include virtual="/m/footer.asp" -->