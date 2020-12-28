<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8" xml:lang="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="망고소프트,MangoSoft,아케이드게임,온라인게임,모바일게임,게임포털,보드게임,코인게임">
<meta name="robots" content="index,follow" />
<link rel="shortcut icon" type="image/x-icon" href="/common/img/favicon.ico" />

<title>::망고게임::</title>

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
	<div id="header">
		<div>
			<h1><a href="/">망고게임</a></h1>
			<ul class="gnb service">
			<li><a href="#gamemap"><i class="fa fa-chevron-circle-down"></i>전체게임보기</a></li>
			<li><a href="javascript:ready();"><i class="fa fa-gift"></i>이벤트</a></li>
			</ul>
			<ul class="gnb member">
			<li><a href="/member/info_main.asp">내정보</a></li>
			<li><a href="javascript:popup_window('/shop/pop_charge.asp', '망고게임 캐쉬 충전', 'scrollbars=no,resizable=no,width=500,height=720,top=200,left=400')">캐쉬충전</a></li>
			<li><a href="/shop/poker/main.asp">망고게임샵</a></li>
			<li><a href="javascript:ready();">고객센터</a></li>
			<li><a href="/">로그아웃</a></li>
			</ul>
		</div>
	</div>

	<div id="container">
		<div class="topbanner">
			<h2 class="blind">망고게임 이벤트</h2>
			<ul class="bxslider">
			<li><a href="javascript:ready();"><img src="/index/img/top_banner_open.jpg" alt="" title=""><strong>망고게임 그랜드 오픈!</strong><span>회원가입시 무조건 1,000캐쉬!</span></a></li>
			<li><a href="/poker/holdum.asp"><img src="/index/img/top_banner_free.jpg" alt="" title=""><strong>홀덤 무한 채널 오픈</strong><span>무제한 포커 서비스!</span></a></li>
			<li><a href="/poker/holdum.asp"><img src="/index/img/top_banner_baduki.jpg" alt="" title=""><strong>망고 홀덤</strong><span>게임 서비스 오픈</span></a></li>
			<li><a href="/gostop/matgo.asp"><img src="/index/img/top_banner_matgo.jpg" alt="" title=""><strong>망고 맞고</strong><span>게임 서비스 오픈</span></a></li>
			<li><a href="https://play.google.com/store/apps/details?id=com.cjenm.sknights" target="_blank"><img src="/index/img/top_banner_seven.jpg" alt="" title=""><strong>세븐나이츠</strong><span>채널링 서비스 개시</span></a></li>
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
					<h2>PC 게임</h2>
					<ul>
					<li><a href="http://ma.cloudgame.co.kr/" target="_blank"><img src="/index/img/game_online2.jpg" alt="마계전설" title=""><strong>마계전설</strong><span>동화 같은 정통 판타지 RPG!<br>다양한 클래스로 즐겨보세요!</span><p><i class="icon_c">채널링</i></p></a></li>
					<li><a href="http://nal.game.naver.com/" target="_blank"><img src="/index/img/game_online3.jpg" alt="날" title=""><strong>날</strong><span>압도적인 액션! 강렬한 쾌감!<br>남자라면 진짜 액션!</span><p><i class="icon_c">채널링</i><i class="icon_n">신규</i></p></a></li>
					<li><a href="/poker/holdum.asp"><img src="/index/img/game_online5.jpg" alt="망고홀덤" title=""><strong>망고홀덤</strong><span>세계인이 사랑하는 포커!<br>망고 텍사스 홀덤!</span><p><i class="icon_n">CBT</i></p></a></li>
					<li><a href="/poker/baduki.asp"><img src="/index/img/game_online6.jpg" alt="망고바둑이" title=""><strong>망고바둑이</strong><span>블러핑의 진수!<br>한국인의 국민 포커, 바둑이!</span><p><i class="icon_h">인기</i></p></a></li>
					<li><a href="/gostop/matgo.asp"><img src="/index/img/game_online8.jpg" alt="뉴맞고" title=""><strong>망고맞고</strong><span>단순하고 재밌다!<br>둘이서 치는 신나는 맞고!</span><p><i class="icon_h">인기</i></p></a></li>
					<li><a href="/gostop/dori.asp"><img src="/index/img/game_online9.jpg" alt="도리짓고" title=""><strong>망고도리짓고</strong><span>타짜들의 짜릿한 승부!<br>손맛을 안다면, 망고 도리짓고!</span><p><i class="icon_cb">CBT</i></p></a></li>
					<li><a href="/gostop/sutda.asp"><img src="/index/img/game_online10.jpg" alt="섯다" title=""><strong>망고섯다</strong><span>신개념 섯다!<br>망고 섯다에서 느껴보세요!</span><p><i class="icon_cb">CBT</i></p></a></li>
					</ul>
				</div>
				<div class="section_mobile">
					<h2>모바일 게임</h2>
					<ul>
					<li><a href="https://play.google.com/store/apps/details?id=com.nhnent.SKCOH" target="_blank" title="새창"><img src="/index/img/game_mobile1.jpg" alt="브레이브 헌터" title=""><strong>브레이브 헌터</strong>시뮬RPG</a></li>
					<li><a href="https://play.google.com/store/apps/details?id=com.cjenm.sknights" target="_blank" title="새창"><img src="/index/img/game_mobile2.jpg" alt="세븐나이츠" title=""><strong>세븐나이츠</strong>전략시뮬</a></li>
					<li><a href="https://play.google.com/store/apps/details?id=com.netmarble.rav" target="_blank" title="새창"><img src="/index/img/game_mobile3.jpg" alt="레이븐" title=""><strong>레이븐</strong>액션RPG</a></li>
					<li><a href="https://play.google.com/store/apps/details?id=com.cjenm.ModooMarbleKakao" target="_blank" title="새창"><img src="/index/img/game_mobile4.jpg" alt="모두의마블" title=""><strong>모두의마블</strong>아케이드</a></li>
					</ul>
					<div class="rank">
						<h2>모바일 게임 인기 순위</h2>
						<div>
							<img src="/index/img/mobile_rank.jpg" alt="" title="">
							<!--<div class="blockclick"></div>
							<iframe src="http://www.hungryapp.co.kr/" allowtransparency="true">
							</iframe>-->
						</div>
					</div>
				</div>
				<div class="section_info">
					<div class="event">
						<h2><a href="javascript:ready();">이벤트 파크</a></h2>
						<ul>
						<li><a href="javascript:ready();"><img src="/index/img/banner_open.jpg" alt="망고게임 그랜드 오픈" title="신규 회원 가입시 1000p 100% 지급"></a></li>
						<li><a href="javascript:ready();"><img src="/index/img/banner_poker.jpg" alt="망고게임 무제한 포커 채널 오픈" title="판수 제한도, 머니 제한도 없는 무제한 포커 채널 서비스 오픈!"></a></li>
						</ul>
					</div>
					<div class="cs">
						<h2>망고게임 고객센터</h2>
						<ul>
						<li class="cs"><a href="/cs">망고게임 고객센터</a></li>
						<li class="security"><a href="#">내 보안은 내가 지켜요</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="content_flash">
				<div id="tab_container" class="">
					<ul class="etabs">
					<li class="tab"><a href="#tab_list"><h2>인기 플래시 게임</h2></a></li>
					<li class="tab"><a href="#tab_recomm"><h2>추천 게임</h2></a></li>
					</ul>
					<div id="tab_list" class="list">
						<h3>액션&어드벤처</h3>
						<ul>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=3134&open_url=http%3A%2F%2Fimg.gameangel.com%2Fflash%2Fgame_file%2FFMAlchemist.html&link_type=iframe&play_type=&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1010000000000&ThisDirName=game_flash&win_big=&made_in_corp=1557" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/1143015018_v12.jpg" alt="강철의 연금술사" title="새창">강철의 연금술사</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=11345&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1010000000000&ThisDirName=game_flash&win_big=&made_in_corp=932&data_url=/game88&file_name=ar0870.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar0870.jpg" alt="메이플플래시 0.74" title="새창">메이플플래시 0.74</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=16962&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1010000000000&ThisDirName=game_flash&win_big=&made_in_corp=683&data_url=/game109&file_name=ar2945.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/aq9668.jpg" alt="나루토GG" title="새창">나루토GG</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=28960&open_url=http%3A%2F%2Fuploads.ungrounded.net%2F659000%2F659004_pokemon-campaign.swf&link_type=url&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1030000000000&ThisDirName=game_flash&win_big=&made_in_corp=14" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/1434420827_poke320L.jpg" alt="포켓몬 캠핑" title="새창">포켓몬 캠핑</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=12338&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1070000000000&ThisDirName=game_flash&win_big=&made_in_corp=530&data_url=/game92&file_name=ar1244.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar1244.jpg" alt="소닉 RPG 에피소드7" title="새창">소닉 RPG 에피소드7</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=13093&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1070000000000&ThisDirName=game_flash&win_big=&made_in_corp=497&data_url=/game94&file_name=ar1465.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar1465.jpg" alt="스쿠비두 고스트 파이어리츠" title="새창">스쿠비두 고스트 파이어리츠</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=9987&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1070000000000&ThisDirName=game_flash&win_big=&made_in_corp=913&data_url=/game80&file_name=ar0070.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar0070.jpg" alt="메이플스토리 신목조망" title="새창">메이플스토리 신목조망</a></li>
						</ul>
						<h3>대전격투</h3>
						<ul>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=1485&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1010000000000&ThisDirName=game_flash&win_big=&made_in_corp=2&data_url=/game21&file_name=d03.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/thum_d03.jpg" alt="킹오브파이터즈" title="새창">킹오브파이터즈</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgme_paly.proc.php?uid=11249&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1020000000000&ThisDirName=game_flash&win_big=&made_in_corp=683&data_url=/game88&file_name=ar0802.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar0802.jpg" alt="메탈슬러그 리믹스" title="">메탈슬러그 리믹스 </a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=28314&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1010000000000&ThisDirName=game_flash&win_big=&made_in_corp=1710&data_url=/game204&file_name=as2428.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/as2428.jpg" alt="드래곤볼 피어스 파이팅" title="새창">슈퍼마리오 크리에이터</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=29278&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1010000000000&ThisDirName=game_flash&win_big=&made_in_corp=1465&data_url=/game238&file_name=as5862.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/as5862.jpg" alt="포켓몬 배틀 아레나" title="새창">포켓몬 배틀 아레나</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=935&open_url=http%3A%2F%2Fimg.gameangel.com%2Fflash%2Fgame_file%2FInuYasha.html&link_type=iframe&play_type=&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1010000000000&ThisDirName=game_flash&win_big=&made_in_corp=2" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/inuyasha.jpg" alt="이누야샤" title="새창">이누야샤</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=20369&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1010000000000&ThisDirName=game_flash&win_big=&made_in_corp=918&data_url=/game126&file_name=ar4670.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar2141.jpg" alt="스트리트 파이터2 챔피온십" title="새창">스트리트 파이터2</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=29278&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1010000000000&ThisDirName=game_flash&win_big=&made_in_corp=1465&data_url=/game238&file_name=as5862.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar4670.jpg" alt="쇼다운" title="새창">쇼다운</a></li>
						</ul>
						<h3>사천성&보드</h3>
						<ul>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=17603&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1060000000000&ThisDirName=game_flash&win_big=&made_in_corp=768&data_url=/game111&file_name=ar3105.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar3105.jpg" alt="와우 커넥트 2" title="새창">와우 커넥트 2</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=26899&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=1&play_skin=&corp_id=&cid=1060000000000&ThisDirName=game_flash&win_big=ok&made_in_corp=701&data_url=/game178&file_name=ar9836.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar9836.jpg" alt="졸리 종" title="새창">졸리 종</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=9966&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1060000000000&ThisDirName=game_flash&win_big=&made_in_corp=742&data_url=/game80&file_name=ar0049.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar0049.jpg" alt="거버너 오브 포커" title="새창">거버너 오브 포커</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=29359&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1060000000000&ThisDirName=game_flash&win_big=&made_in_corp=14&data_url=/game241&file_name=as6101.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/as6101.jpg" alt="카드 마작" title="새창">카드 마작</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=2226&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1060000000000&ThisDirName=game_flash&win_big=&made_in_corp=86&data_url=/game31&file_name=n47.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/n47.jpg" alt="몬스터 마작" title="새창">몬스터 마작</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=21781&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1030000000000&ThisDirName=game_flash&win_big=&made_in_corp=1557&data_url=/game136&file_name=ar5633.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/as6101.jpg" alt="봄 잇4" title="새창">봄 잇4</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=12162&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1030000000000&ThisDirName=game_flash&win_big=&made_in_corp=14&data_url=/game91&file_name=ar1178.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar1178.jpg" alt="마리오 어드벤처2" title="새창">마리오 어드벤처2</a></li>
						</ul>
						<h3>크러쉬&퍼즐</h3>
						<ul>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=27083&open_url=&lㅇnk_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=1&play_skin=&corp_id=&cid=1060000000000&ThisDirName=game_flash&win_big=ok&made_in_corp=2&data_url=/game181&file_name=as0158.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/thum_as0158.jpg" alt="캔디 크러쉬 사가" title="새창">캔디 크러쉬 사가</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=27657&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=1&play_skin=&corp_id=&cid=1060000000000&ThisDirName=game_flash&win_big=ok&made_in_corp=2064&data_url=/game194&file_name=as1436.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/thum_as1436.jpg" alt="픽셀 크러시 매니아" title="새창">픽셀 크러시 매니아</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=15470&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1060000000000&ThisDirName=game_flash&win_big=&made_in_corp=698&data_url=/game103&file_name=ar2351.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar2351.jpg" alt="정글매직" title="새창">정글매직</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=22015&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1060000000000&ThisDirName=game_flash&win_big=&made_in_corp=679&data_url=/game138&file_name=ar5811.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar5811.jpg" alt="아이소볼 X1" title="새창">아이소볼 X1</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=23426&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1060000000000&ThisDirName=game_flash&win_big=&made_in_corp=833&data_url=/game146&file_name=ar6688.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar6688.jpg" alt="스네일 밥2" title="새창">스네일 밥2</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=2329&open_url=&link_type=direct&play_type=dcr&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1060000000000&ThisDirName=game_flash&win_big=&made_in_corp=2&data_url=/game32&file_name=o43.dcr" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar2351.jpg" alt="슬릭 볼" title="새창">슬릭 볼</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=12438&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1080000000000&ThisDirName=game_flash&win_big=&made_in_corp=14&data_url=/game92&file_name=ar1272.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar1272.jpg" alt="슈퍼마리오 크리에이터" title="새창">슈퍼마리오 크리에이터</a></li>
						</ul>
						<h3>버블슈터&슈팅</h3>
						<ul>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=20484&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1020000000000&ThisDirName=game_flash&win_big=&made_in_corp=1390&data_url=/game100&file_name=ar2000.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar4739.jpg" alt="앵그리 버드" title="새창">앵그리 버드</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=3287&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1060000000000&ThisDirName=game_flash&win_big=&made_in_corp=2&data_url=/game41&file_name=x59.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/x59.jpg" alt="버블 슈터" title="새창">버블 슈터</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=22866&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1070000000000&ThisDirName=game_flash&win_big=ok&made_in_corp=1442&data_url=/game143&file_name=ar6366.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar6366.jpg" alt="스폰지 밥 버블 버스터" title="새창">스폰지 밥 버블 버스터</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=14526&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1020000000000&ThisDirName=game_flash&win_big=&made_in_corp=683&data_url=/game100&file_name=ar2042.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar2042.jpg" alt="메이플 시그너스 기사단" title="새창">메이플 시그너스 기사단</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=12115&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1020000000000&ThisDirName=game_flash&win_big=&made_in_corp=471&data_url=/game91&file_name=ar1154.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar1154.jpg" alt="메탈슬러그 브루탈2" title="새창">메탈슬러그 브루탈2</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=29144&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1020000000000&ThisDirName=game_flash&win_big=&made_in_corp=1793&data_url=/game235&file_name=as5522.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/as5522.jpg" alt="스카이 트립" title="새창">스카이 트립</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=10863&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1020000000000&ThisDirName=game_flash&win_big=&made_in_corp=1557&data_url=/game86&file_name=ar0615.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar0615.jpg" alt="디노 블리츠" title="새창">디노 블리츠</a></li>
						</ul>
						<h3>두뇌&전략</h3>
						<ul>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=23356&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1100000000000&ThisDirName=game_flash&win_big=&made_in_corp=14&data_url=/game146&file_name=ar6648.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar6648.jpg" alt="마인크래프트 타워디펜스" title="새창">마인크래프트 타워디펜스</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=7830&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1100000000000&ThisDirName=game_flash&win_big=&made_in_corp=639&data_url=/game68&file_name=aq8896.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar3139.jpg" alt="전쟁시대" title="새창">전쟁시대</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=4907&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1100000000000&ThisDirName=game_flash&win_big=&made_in_corp=1816&data_url=/game54&file_name=ai89.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ai89.jpg" alt="배틀필드 제너럴" title="새창">배틀필드 제너럴</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=29309&open_url=http%3A%2F%2Fmedia-ak.y8.com%2Fsystem%2Fcontents%2F90388%2Foriginal%2FFree_Words_July_31st_2015.swf&link_type=url&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1060000000000&ThisDirName=game_flash&win_big=&made_in_corp=1793" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/1440126653_word320L.jpg" alt="프리 워드" title="새창">프리 워드</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=11095&open_url=http%3A%2F%2Fcdn-www.arcadetown.com%2Fswf%2Ffeudalism2.swf&link_type=url&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1100000000000&ThisDirName=game_flash&win_big=&made_in_corp=93" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/gameangel_a82a3c674bb6481e6e1e5d7fbadc8.jpg" alt="퓨더리즘2" title="새창">퓨더리즘2</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=12770&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1100000000000&ThisDirName=game_flash&win_big=&made_in_corp=417&data_url=/game93&file_name=ar1374.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar1374.jpg" alt="파이날 판타지 소닉 에피소드2" title="새창">파이날 판타지 소닉 에피소드2</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=4260&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1100000000000&ThisDirName=game_flash&win_big=&made_in_corp=30&data_url=/game50&file_name=ag05.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ag05.jpg" alt="신의 놀이터1" title="새창">신의 놀이터1</a></li>
						</ul>
						<p id="toggle" onclick="toggleflash();">전체보기</p>
					</div>
					<div id="tab_recomm" class="list">
						<h3>포커</h3>
						<ul>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=3134&open_url=http%3A%2F%2Fimg.gameangel.com%2Fflash%2Fgame_file%2FFMAlchemist.html&link_type=iframe&play_type=&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1010000000000&ThisDirName=game_flash&win_big=&made_in_corp=1557" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/1143015018_v12.jpg" alt="강철의 연금술사" title="새창">강철의 연금술사</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=11345&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1010000000000&ThisDirName=game_flash&win_big=&made_in_corp=932&data_url=/game88&file_name=ar0870.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar0870.jpg" alt="메이플플래시 0.74" title="새창">메이플플래시 0.74</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=16962&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1010000000000&ThisDirName=game_flash&win_big=&made_in_corp=683&data_url=/game109&file_name=ar2945.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/aq9668.jpg" alt="나루토GG" title="새창">나루토GG</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=28960&open_url=http%3A%2F%2Fuploads.ungrounded.net%2F659000%2F659004_pokemon-campaign.swf&link_type=url&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1030000000000&ThisDirName=game_flash&win_big=&made_in_corp=14" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/1434420827_poke320L.jpg" alt="포켓몬 캠핑" title="새창">포켓몬 캠핑</a></li>
						</ul>
						<h3>고스톱</h3>
						<ul>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=3134&open_url=http%3A%2F%2Fimg.gameangel.com%2Fflash%2Fgame_file%2FFMAlchemist.html&link_type=iframe&play_type=&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1010000000000&ThisDirName=game_flash&win_big=&made_in_corp=1557" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/1143015018_v12.jpg" alt="강철의 연금술사" title="새창">강철의 연금술사</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=11345&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1010000000000&ThisDirName=game_flash&win_big=&made_in_corp=932&data_url=/game88&file_name=ar0870.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/ar0870.jpg" alt="메이플플래시 0.74" title="새창">메이플플래시 0.74</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=16962&open_url=&link_type=direct&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1010000000000&ThisDirName=game_flash&win_big=&made_in_corp=683&data_url=/game109&file_name=ar2945.swf" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/aq9668.jpg" alt="나루토GG" title="새창">나루토GG</a></li>
						<li><a href="http://fg.gameangel.com/System/gameangel/flashgame_paly.proc.php?uid=28960&open_url=http%3A%2F%2Fuploads.ungrounded.net%2F659000%2F659004_pokemon-campaign.swf&link_type=url&play_type=swf&cgroup=game_flash&cookie_value=&Width=&Height=&play_skin=&corp_id=&cid=1030000000000&ThisDirName=game_flash&win_big=&made_in_corp=14" target="_blank" title="새창"><img src="http://img.gameangel.com/@files/capture/game_flash/true/1434420827_poke320L.jpg" alt="포켓몬 캠핑" title="새창">포켓몬 캠핑</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="section_banner">
				<a href="javascript:ready();"><img src="/common/img/banner/bottom_password.png" alt="지금 회원님의 비밀번호를 변경해주세요!" title="망고게임 보안 캠페인- 비밀번호만 자주 변경해주셔도 해킹 피해를 90% 이상 방지할 수 있습니다."></a>
			</div>

			<div class="notice">
				<h2>공지사항</h2>
				<p><a href="javascript:ready();">10월 삼성 신용카드 결제 할인 이벤트 안내</a></p>
				<ul>
				<li><a href="javascript:ready();">게임 시간선택제</a></li>
				<li><a href="javascript:ready();">서비스 전체보기</a></li>
				</ul>
			</div>

			<div class="section_bottom">
				<div id="gamemap" class="gamemap">
					<h2>전체 게임</h2>
					<div class="section web">
						<h3>웹게임</h3>
						<ul>						
						<li></li>
						</ul>
					</div>
					<div class="section poker">
						<h3>포커</h3>
						<ul>						
						<li><a href="/poker/baduki.asp"><img src="/index/img/sitemap_poker1.gif" alt="망고바둑이" title="로우바둑이"></a></li>
						<li><a href="javascript:ready();"><img src="/index/img/sitemap_poker2.gif" alt="망고포커" title="맞포커"></a></li>
						<li><a href="javascript:ready();"><img src="/index/img/sitemap_poker3.gif" alt="하이로우" title="하이로우"></a></li>
						<li><a href="/poker/holdum.asp"><img src="/index/img/sitemap_poker4.gif" alt="망고홀덤" title="세븐포커"></a></li>
						</ul>
					</div>
					<div class="section gostop">
						<h3>고스톱</h3>
						<ul>						
						<li><a href="/gostop/dori.asp"><img src="/index/img/sitemap_gostop1.gif" alt="망고도리짓고" title="고스톱"></a></li>
						<li><a href="/gostop/sutda.asp"><img src="/index/img/sitemap_gostop2.gif" alt="망고섯다" title="섯다"></a></li>
						<li><a href="/gostop/matgo.asp"><img src="/index/img/sitemap_gostop3.gif" alt="망고맞고" title="맞고"></a></li>
						</ul>
					</div>
					<div class="section board">
						<h3>보드/캐주얼</h3>
						<ul>						
						<li><a href="javascript:ready();"><img src="/index/img/sitemap_board1.gif" alt="사천성" title="사천성"></a></li>
						<li><a href="javascript:ready();"><img src="/index/img/sitemap_board2.gif" alt="윷놀이" title="윷놀이"></a></li>
						<li><a href="javascript:ready();"><img src="/index/img/sitemap_board3.gif" alt="당구플러스" title="당구플러스"></a></li>
						<li><a href="javascript:ready();"><img src="/index/img/sitemap_board4.gif" alt="가로세로퍼즐" title="가로세로퍼즐"></a></li>
						</ul>
					</div>
					<div class="section mobile">
						<h3>모바일</h3>
						<ul>						
						<li></li>
						</ul>
					</div>
					<p><img src="/index/img/sitemap_icon.gif" alt="n:신규게임,h:인기게임,b:오픈베타,r:오픈예정" title="게임 정보 안내"></p>
				</div>
				<div class="company">
					<h2>망고소프트<a href="http://mango-soft.kr/" target="_blank" title="새창" class="more">바로가기</a></h2>
					<p class="blind">
						<b>즐거움의 가치를 아는 사람들!</b>
						아케이드 게임 개발, 온라인 게임 개발, 모바일 게임 개발 - 망고소프트
					</p>
					<p class="inquiry">
						<a href="http://mango-soft.kr/#contact" target="_blank" title="새창">게임제휴&사업문의</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<div id="footer">
		<h4 class="logo">망고게임</h4>
		<ul class="menu">
		<li>회사소개</li>
		<li>게임제안</li>
		<li>광고/제휴문의</li>
		<li>이용약관보기</li>
		<li><strong>개인정보취급방침</strong></li>
		<li>청소년보호정책</li>
		<li>전자우편</li>
		<li><strong>사업자정보공개사이트</strong></li>
		<li>사이트맵</li>
		</ul>
		<address>
			<dl>
				<dt>상호 : </dt>
      <dd>㈜망고소프트</dd>
      <dt>대표 : </dt>
      <dd>백승용</dd>
    </dl>
    <dl>
      <dt>주소 : </dt>
      <dd>서울특별시 송파구 법원로128 SKV1 GL메트로시티 A동503호</dd>
    </dl>
    <dl>
      <dt>TEL : </dt>
      <dd>02-2038-8925</dd>
      <dt>E-Mail : </dt>
      <dd>mangosoftkr@gmail.com</dd>
      <dt>사업자등록번호 : </dt>
      <dd>113-86-88650</dd>
      <dt>통신판매업신고번호 : </dt>
      <dd>제2019-서울송파-3022호</dd>
    </dl>
    </address>
    <p class="copyright"> Copyright © MANGOSOFT All Right Reserved. </p>
    <ul class="link">
      <li>네이버카페</li>
      <li>망고소프트 YouTube</li>
		</ul>
	</div>


</div>
</body>
</html>