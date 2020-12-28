<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8" xml:lang="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="고구려소프트,온라인게임,모바일게임,게임포털,보드게임">
<meta name="robots" content="index,follow" />

<title>::고구려게임::</title>
<!--#include virtual="/dbopen.asp" -->

<script src="/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="/index/css/index.css">

<!-- import for bxslider -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/js/bxslider/jquery.bxslider.min.js"></script>
<link href="/js/bxslider/jquery.bxslider.css" rel="stylesheet" />

<!-- import for easytabs -->
<script src="/js/easytabs/jquery.hashchange.min.js" type="text/javascript"></script>
<script src="/js/easytabs/jquery.easytabs.min.js" type="text/javascript"></script>

<!-- import for mainvisual rolling -->
<script type="text/javascript" src="/js/bgcircle/background.cycle.js"></script>

<script type="text/javascript">

$(document).ready( function() {
	$('#tab_container').easytabs();

	$("body").backgroundCycle({
		imageUrls: [
			'/index/img/visual1.jpg',
			'/index/img/visual2.jpg'
		],
		fadeSpeed: 2000,
		duration: 5000,
		backgroundSize: SCALING_MODE_NONE
	});
});

var slip_state = 0;
function toggleflash()
{
	if(slip_state==0) 
	slip_state=1;
	else slip_state=0;
 
	if(slip_state==0)
	{
	$("#tab_container").attr("class", "");
	$("#toggle").attr("class", "toggle");
	$("#toggle").html("<a onclick='toggle_flash();'>전체보기</a>");
	}
	else{
	$("#tab_container").attr("class", "wide");
	$("#toggle").attr("class", "toggle_wide");
	$("#toggle").html("<a onclick='toggle_flash();'>접기</a>");
	}
}
 

</script>

</head>
<body>
<div id="wrap">
	<a href="#content" class="skip">본문바로가기</a>
<%if len(login_mem_idx) = 0 then%>
	<div id="header">
		<div>
			<h1><a href="/"><img src="/index/img/logo.png"></a></h1>
			<ul class="gnb service">
			<li><a href="#gamemap"><i class="fa fa-chevron-circle-down"></i>전체게임보기</a></li>
			<li><a href="javascript:ready();"><i class="fa fa-gift"></i>이벤트</a></li>
			<li><a href="javascript:ready();">고구려VIP서비스</a></li>
			</ul>
			<ul class="gnb member">
			<li><a href="/join/">회원가입</a></li>
			<li><a href="javascript:ready();">고객센터</a></li>
			<li><a href="/login.asp">로그인</a></li>
			</ul>
		</div>
	</div>
<%else%>
	<div id="header">
		<div>
			<h1><a href="/">고구려게임</a></h1>
			<ul class="gnb service">
			<li><a href="javascript:ready();"><i class="fa fa-gift"></i>이벤트</a></li>
			<li><a href="javascript:ready();">고구려VIP서비스</a></li>
			</ul>
			<ul class="gnb member">
			<li><a href="/member/info_main.asp">내정보</a></li>
			<li><a href="javascript:PopChargeCash()">캐쉬충전</a></li>
			<li><a href="/shop/poker/main.asp">고구려게임샵</a></li>
			<li><a href="javascript:ready();">고객센터</a></li>
			<li><a href="/logout.asp">로그아웃</a></li>
			</ul>
		</div>
	</div>
<%end if%>
	<div id="container">
		
    <div class="topbanner"> 
      <h2 class="blind">게임 이벤트</h2>
      <ul class="bxslider">
        <li><a href="/poker/fours.asp"><img src="/index/img/top_banner_fours.jpg" alt="" title=""><strong>사계절 바둑이 
          </strong><span>게임 서비스 오픈</span></a></li>
        <li><a href="/poker/baduki.asp"><img src="/index/img/top_banner_game0.jpg" alt="" title=""><strong>고구려 
          바둑이</strong><span>게임 서비스 오픈</span></a></li>
        <li><a href="/gostop/matgo.asp"><img src="/index/img/top_banner_matgo.jpg" alt="" title=""><strong>고구려 
          맞고</strong><span>모바일 서비스 오픈</span></a></li>
        <li><a href="/poker/holdum.asp"><img src="/index/img/top_banner_holdum.jpg" alt="" title=""><strong>고구려 
          홀덤</strong><span>모바일 서비스 오픈</span></a></li>
        <li><a href="javascript:ready();"><img src="/index/img/top_banner_slot.jpg" alt="" title=""><strong>고구려 
          슬롯</strong><span>모바일 서비스 오픈</span></a></li>
      </ul>
    </div>

<script type="text/javascript">
$('.bxslider').bxSlider({
  minSlides:4,
  maxSlides:4,
  slideWidth:273,
  slideMargin:0
});
</script>

		
    <div id="content"> 
      <div class="content_service"> 
        <div class="section_online"> 
			<h2>고구려 VIP</h2>

			<ul class="vip">
				<li>
					<p><img src="/common/img/pass/vip1.png"></p>
					<div>
						<strong>VIP plus+ 블루 회원제</strong>
						<p>출금통장 <b>최대 7억 골드!</b></p>
						<p>마일리지 <b>기본 적립율 X2배!</b></p>
						<p>무료충전 <b>1,000만 골드!</b></p>
						<button type="button" onclick="javascript:ready();">가입하기</button>
					</div>
				</li>
				<li>
					<p><img src="/common/img/pass/vip2.png"></p>
					<div>
						<strong>VIP plus+ 퍼플 회원제</strong>
						<p>출금통장 <b>최대 22억 골드!</b></p>
						<p>마일리지 <b>기본 적립율 X3배!</b></p>
						<p>무료충전 <b>3,000만 골드!</b></p>
						<button type="button" onclick="javascript:ready();">가입하기</button>
					</div>
				</li>
				<li>
					<p><img src="/common/img/pass/vip3.png"></p>
					<div>
						<strong>VIP plus+ 골드 회원제</strong>
						<p>출금통장 <b>최대 50억 골드!</b></p>
						<p>마일리지 <b>기본 적립율 X3배!</b></p>
						<p>무료충전 <b>8,000만 골드!</b></p>
						<button type="button" onclick="javascript:ready();">가입하기</button>
					</div>
				</li>
			</ul>

          <h2>PC 게임</h2>
          <ul class="list">
            <li><a href="/poker/fours.asp"><img src="/index/img/game_online14.jpg" alt="사계절바둑이" title=""><strong>사계절바둑이</strong><span>가볍게! 즐겁게!<br>
              사계절바둑이!</span> 
              <p><img src="/common/img/icon/icon-r.gif"></p>
              </a></li>
            <li><a href="/poker/baduki.asp"><img src="/index/img/game_online11.jpg" alt="고구려바둑이" title=""><strong>고구려바둑이</strong><span>한국인이 좋아하는 바둑이<br>
              고구려 바둑이!</span> 
              <p><img src="/common/img/icon/icon-r.gif"></p>
              </a></li>
            <li><a href="javascript:ready();"><img src="/index/img/game_online2.jpg" alt="고구려포커" title=""><strong>고구려포커</strong><span>짜릿한 잭팟의 묘미!<br>
              고구려 포커와 함께 하세요!</span> 
               <p><img src="/common/img/icon/icon-n.gif"><img src="/common/img/icon/icon-h.gif"></p>
             </a></li>
            <li><a href="/gostop/matgo.asp"><img src="/index/img/game_online3.jpg" alt="고구려맞고" title=""><strong>고구려맞고</strong><span>기본에 충실한 맞고! 
              가볍게 즐겨보세요!</span> 
               <p><img src="/common/img/icon/icon-n.gif"><img src="/common/img/icon/icon-h.gif"></p>
              </a></li>
            <li><a href="/poker/holdum.asp"><img src="/index/img/game_online5.jpg" alt="고구려홀덤" title=""><strong>고구려홀덤</strong><span>세계인이 
              사랑하는 포커!<br>
              고구려에서 즐겨보세요!</span> 
              <p><img src="/common/img/icon/icon-n.gif"><img src="/common/img/icon/icon-h.gif"></p>
              </a></li>
            <li><a href="javascript:ready();"><img src="/index/img/game_online6.jpg" alt="망고슬롯" title=""><strong>고구려슬롯</strong><span>리얼 카지노 슬롯을<br>
              내 집에서 편하게!</span> 
              <p><img src="/common/img/icon/icon-n.gif"><img src="/common/img/icon/icon-h.gif"></p>
              </a></li>
            <li><a href="javascript:ready();"><img src="/index/img/game_online9.jpg" alt="도리짓고" title=""><strong>고구려섯다</strong><span>타짜들의 
              짜릿한 승부!<br>
              손맛을 안다면, 고구려 섯다!</span> 
              <p><img src="/common/img/icon/icon-r.gif"></p>
              </a></li>
            <li><a href="javascript:ready();"><img src="/index/img/game_online13.jpg" alt="고구려바카라" title=""><strong>고구려바카라</strong><span>퇴근 후 가볍게 바카라 한판<br>
              어떠세요?</span> 
              <p><img src="/common/img/icon/icon-r.gif"></p>
              </a></li>
            <li><a href="javascript:ready();"><img src="/index/img/game_online12.jpg" alt="고구려3인고스톱" title=""><strong>고구려3인고스톱</strong><span>친구, 연인, 가족과 함께<br>
              고구려 3인 고스톱!</span> 
              <p><img src="/common/img/icon/icon-r.gif"></p>
              </a></li>                    
          </ul>
        </div>
        <div class="section_mobile"> 
          <h2>모바일 게임</h2>
          <ul>
            <li><a href="#" target="_blank" title="새창"><img src="/index/img/game_mobile1.jpg" alt="" title=""><strong>고구려포커 
              </strong>포커</a></li>
            <li><a href="#" target="_blank" title="새창"><img src="/index/img/game_mobile2.jpg" alt="" title=""><strong>고구려맞고</strong>고스톱</a></li>
            <li><a href="#" target="_blank" title="새창"><img src="/index/img/game_mobile3.jpg" alt="" title=""><strong>고구려홀덤</strong>포커</a></li>
            <li><a href="#" target="_blank" title="새창"><img src="/index/img/game_mobile4.jpg" alt="" title=""><strong>고구려슬롯</strong>아케이드</a></li>
          </ul>
          <div class="rank"> 
            <h2>이벤트</h2>
            <div>
              <img src="/common/img/banner/right-banner-vip.jpg"> 
            </div>
            <div class="last">
              <img src="/common/img/banner/right-banner-password.png"> 
            </div>            
          </div>
        </div>
      </div>
      
      <div class="content_left">
        <div class="content_recommend">
          <h3>추천게임</h3>
          <ul class="list">
            <li>
              <a href="/poker/fours.asp"><img src="/index/img/recom-game7.jpg" alt="사계절바둑이" title="">
              <div><strong>사계절바둑이</strong><span><img src="/common/img/icon/icon-n.gif"><img src="/common/img/icon/icon-h.gif"></span></div></a>
            </li>
            <li>
              <a href="/poker/baduki.asp"><img src="/index/img/recom-game6.jpg" alt="고구려바둑이" title="">
              <div><strong>고구려바둑이</strong><span><img src="/common/img/icon/icon-n.gif"><img src="/common/img/icon/icon-h.gif"></span></div></a>
            </li>
            <li>
              <a href="#"><img src="/index/img/recom-game1.jpg" alt="고구려포커" title="">
              <div><strong>고구려포커</strong><span><img src="/common/img/icon/icon-n.gif"><img src="/common/img/icon/icon-h.gif"></span></div></a>
            </li>
            <li>
              <a href="/gostop/matgo.asp"><img src="/index/img/recom-game5.jpg" alt="고구려맞고" title="">
              <div><strong>고구려맞고</strong><span><img src="/common/img/icon/icon-n.gif"><img src="/common/img/icon/icon-h.gif"></span></div></a>
            </li>
            <li><a href="/poker/holdum.asp"><img src="/index/img/recom-game3.jpg" alt="고구려홀덤" title="">
              <div><strong>고구려홀덤</strong><span><img src="/common/img/icon/icon-n.gif"><img src="/common/img/icon/icon-h.gif"></span></div></a>
            </li>
            <li><a href="#"><img src="/index/img/recom-game4.jpg" alt="고구려슬롯" title="">
              <div><strong>고구려슬롯</strong><span><img src="/common/img/icon/icon-n.gif"><img src="/common/img/icon/icon-h.gif"></span></div></a>
            </li>
          </ul>
        </div>
      </div>

      <div class="section_bottom"> 
        <div id="gamemap" class="gamemap"> 
          <h2>전체 게임</h2>
          <div class="section poker"> 
            <h3>포커</h3>
            
            <ul>
              <li><a href="/poker/fours.asp">사계절바둑이<p><img src="/common/img/icon/icon-h.gif"></p></a></li>
              <li><a href="/poker/baduki.asp">고구려바둑이<p><img src="/common/img/icon/icon-h.gif"></p></a></li>
              <li><a href="/poker/holdum.asp">고구려홀덤<p><img src="/common/img/icon/icon-n.gif"></p></a></li>
              <li><a href="javascript:ready();">고구려바카라<p><img src="/common/img/icon/icon-r.gif"></p></a></li>
              <li><a href="javascript:ready();">고구려블랙잭<p><img src="/common/img/icon/icon-r.gif"></p></a></li>
              <li><a href="javascript:ready();">고구려맞포커<p><img src="/common/img/icon/icon-r.gif"></p></a></li>
            </ul>
          </div>
          <div class="section gostop"> 
            <h3>고스톱</h3>
            <ul>
              <li><a href="/gostop/matgo.asp">고구려맞고<p><img src="/common/img/icon/icon-n.gif"></p></a></li>
              <li><a href="javascript:ready();">고구려3인고스톱<p><img src="/common/img/icon/icon-r.gif"></p></a></li>
              <li><a href="javascript:ready();">고구려섯다<p><img src="/common/img/icon/icon-r.gif"></p></a></li>
            </ul>
          </div>
          <div class="section mobile-app"> 
            <h3>모바일</h3>
            <ul>
              <li><a href="javascript:ready();">고구려포커<p><img src="/common/img/icon/icon-n.gif"><img src="/common/img/icon/icon-h.gif"></p></a></li>
              <li><a href="javascript:ready();">고구려맞고<p><img src="/common/img/icon/icon-n.gif"><img src="/common/img/icon/icon-h.gif"></p></a></li>
              <li><a href="javascript:ready();">고구려홀덤<p><img src="/common/img/icon/icon-n.gif"><img src="/common/img/icon/icon-h.gif"></p></a></li>
              <li><a href="javascript:ready();">고구려슬롯<p><img src="/common/img/icon/icon-n.gif"><img src="/common/img/icon/icon-h.gif"></p></a></li>
            </ul>
          </div>
          <p><img src="/index/img/sitemap_icon.gif" alt="n:신규게임,h:인기게임,b:오픈베타,r:오픈예정" title="게임 정보 안내"></p>
        </div>
        <div class="company"> 
          <h2>고구려 기업소개</h2>
          <p>
           <img src="/index/img/company.png">
          </p>
        </div>
      </div>
    </div>
  </div>

	
  <div id="footer"> 
    <h4 class="logo"><img src="/common/img/footer-logo.png"></h4>
    <ul class="menu">
      <li><a href="javascript:ready();">회사소개</a></li>
      <!--<li><a href="javascript:ready();">게임제안</a></li>
      <li><a href="javascript:ready();">광고/제휴문의</a></li>-->
      <li><a href="/cs/term.asp">사이트이용약관</a></li>
      <li><a href="/cs/privacy.asp">개인정보취급방침</a></li>
	  <li><a href="javascript:ready();">유료서비스이용약관</a></li>
	  <li><a href="javascript:ready();">1:1문의</a></li>
      <li><a href="javascript:ready();">사이트맵</a></li>
    </ul>
    <address>
    <dl>
      <dt>상호 : </dt>
      <dd>고구려</dd>
    </dl>
    <dl>
      <dt>주소 : </dt>
      <dd>서울특별시 강남구 역삼동 논현로 72길, 16 초원빌딩 4층</dd>
    </dl>
    <dl>
      <dt>TEL : </dt>
      <dd>02-2038-8925</dd>
      <dt>사업자등록번호 : </dt>
      <dd>113-86-88650</dd>
      <dt>통신판매업신고번호 : </dt>
      <dd>제2019-서울강남-3022호</dd>
    </dl>
    </address>
    <p class="copyright">Copyright © 고구려 All Right Reserved.</p>
  </div>


</div>
</body>
</html>