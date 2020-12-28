<div id="wrap">
	<a href="#content" class="skip">본문바로가기</a>
	<div id="header" class="header">
		<div>
			<h1><a href="/"><img src="/common/img/logo.png"></a></h1>
<%
if len(login_mem_id) > 0 then
%>
			<ul class="gnb">
			<li><a href="javascript:viewgame();">전체게임보기</a></li>
			<li><a href="javascript:popup_window('/shop/pop_charge.asp', '망고게임 캐쉬 충전', 'scrollbars=no,resizable=no,width=500,height=720,top=200,left=400')">캐쉬충전</a></li>
			<li><a href="javascript:ready();">이벤트</a></li>
			<li><a href="javascript:ready();">고객센터</a></li>
			<li class="btn"><a href="/logout.asp"><img src="/common/img/btn/gnb_logout.gif" alt="로그아웃" title="로그아웃"></a></li>
			</ul>
<%
else
%>
			<ul class="gnb">
			<li><a href="javascript:viewgame();"></i>전체게임보기</a></li>
			<li><a href="javascript:ready();">이벤트</a></li>
			<li><a href="/join/">회원가입</a></li>
			<li><a href="javascript:ready();">고객센터</a></li>
			<li class="btn"><a href="/login.asp"><img src="/common/img/btn/gnb_login.gif" alt="로그인" title="로그인"></a></li>
			</ul>
<%
end if
%>
		</div>
		<p class="banner"><a href="javascript:ready();"><img src="/common/img/banner/header-poker.png"></a></p>
		<!--#include virtual="/inc/viewgame.asp"-->
	</div>