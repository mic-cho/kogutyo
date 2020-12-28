<!--#include virtual="/m/header.asp" -->
		<nav>
			<ul class="topmenu">
				<li><a href="/m/index.asp#mlist">모바일게임</a></li>
				<li><a href="/m/index.asp#plist">PC게임</a></li>
			</ul>
		</nav>
	</div>
</header>
<hr />
<div id="ct">
	<div class="mw_login open">
		<div class="bg"></div>
		<div id="login" class="g_login"> <a href="#login_anchor" title="로그인 레이어 닫기" class="close">X</a>
			<form action="" id="g_login" class="g_login">
				<fieldset>
					<legend>Login</legend>
					<div class="item">
						<label for="uid" class="i_label">ID</label>
						<input name="" type="text" value="" id="uid" class="i_text uid">
					</div>
					<div class="item">
						<label for="upw" class="i_label">PASSWORD</label>
						<input name="" type="password" value="" id="upw" class="i_text upw">
					</div>
					<p class="keeping">
						<input name="" type="checkbox" value="" id="keepid" class="i_check">
						<label for="keepid">로그인 유지</label>
					</p>
					<p class="warning">브라우저를 닫더라도 로그인이 계속 유지될 수 있습니다. 로그인 유지 기능을 사용할 경우 다음 접속부터는 로그인을 하실 필요가 없습니다. 단, 게임방, 학교 등 공공장소에서 이용 시 개인정보가 유출될 수 있으니 꼭 로그아웃을 해주세요.</p>
					<span class="btn_login">
					<input name="" type="submit" value="로그인">
					</span>
					<ul class="help">
						<li class="first"><a href="#">아이디/비밀번호 찾기</a></li>
						<li><a href="#">회원 가입</a></li>
						<li><a href="#o_login" class="o_anchor">Open ID</a></li>
					</ul>
				</fieldset>
			</form>
			<form action="" id="o_login" class="o_login">
				<fieldset>
					<legend>Open ID Login</legend>
					<div class="item">
						<label for="oid" class="i_label">Open ID</label>
						<input name="" type="text" value="" id="oid" class="i_text oid">
					</div>
					<span class="btn_login">
					<input name="" type="submit" value="로그인">
					</span>
					<p class="help"><a href="#g_login" class="g_anchor">일반 아이디 로그인</a></p>
				</fieldset>
			</form>
			<a href="#login_anchor" title="로그인 레이어 닫기" class="close">X</a> </div>
	</div>
</div>
<div id="code_origin2">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
jQuery(function($){
	var loginWindow = $('.mw_login');
	var login = $('#login');
	var uid = $('.i_text.uid');
	var upw = $('.i_text.upw');
	var oid = $('.i_text.oid');
	
	// Show Hide
	$('.login_trigger').click(function(){
		loginWindow.addClass('open');
	});
	$('#login .close').click(function(){
		loginWindow.removeClass('open');
	});
	// o_login
	$('.o_anchor').click(function(){
		login.removeClass('g_login');
		login.addClass('o_login');
	});
	// g_login
	$('.g_anchor').click(function(){
		login.removeClass('o_login');
		login.addClass('g_login');
	});
	// Warning
	$('#keepid').change(function(){
		if($('#keepid[checked]')){
			$('.warning').toggleClass('open');
		};
	});
	// Input Clear
	var i_text = $('.item>.i_label').next('.i_text');
	$('.item>.i_label').css('position','absolute');
	i_text
		.focus(function(){
			$(this).prev('.i_label').css('visibility','hidden');
		})
		.blur(function(){
			if($(this).val() == ''){
				$(this).prev('.i_label').css('visibility','visible');
			} else {
				$(this).prev('.i_label').css('visibility','hidden');
			}
		})
		.change(function(){
			if($(this).val() == ''){
				$(this).prev('.i_label').css('visibility','visible');
			} else {
				$(this).prev('.i_label').css('visibility','hidden');
			}
		})
		.blur();
	// Validation
	$('#login>.g_login input[type=submit]').click(function(){
		if(uid.val() == '' && upw.val() == ''){
			alert('ID와 PASSWORD를 입력하세요!');
			return false;
		}
		else if(uid.val() == ''){
			alert('ID를 입력하세요!');
			return false;
		}
		else if(upw.val() == ''){
			alert('PASSWORD를 입력하세요!');
			return false;
		}
	});
	$('#login>.o_login input[type=submit]').click(function(){
		if(oid.val() == ''){
			alert('Open ID를 입력하세요!');
			return false;
		}
	});
	// ESC Event
	$(document).keydown(function(event){
		if(event.keyCode != 27) return true;
		if (loginWindow.hasClass('open')) {
			loginWindow.removeClass('open');
		}
		return false;
	});
	// Hide Window
	loginWindow.find('>.bg').mousedown(function(event){
		loginWindow.removeClass('open');
		return false;
	});
});
</script>
</div>
<!--#include virtual="/m/footer.asp" -->