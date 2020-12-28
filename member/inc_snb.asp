<div class="snb_wrap clearfix">
			<dl class="meminfo_snb" id="nav">
				<dt><a href="/member/info_main.asp">내정보</a></dt>
				<dd><a href="/member/info_check.asp">내정보관리</a>
					<ul>
						<li><a href="/member/info_check.asp">기본정보</a></li>
						<li><a href="javascript:popup_window('/member/findinfo/pop_change_pass.asp', '망고게임 회원 아이디 찾기', 'scrollbars=no,resizable=no,width=500,height=480,top=200,left=400')">비밀번호 변경</a></li>
						<!--<li><a href="#">내 개인정보 이용내역 현황</a></li>
						<li><a href="#">회원탈퇴</a></li>-->
					</ul>
				</dd>
				<dd><a href="/member/my_account.asp">내계좌</a>
					<ul>
						<li><a href="/member/my_account.asp">결제내역조회</a></li>
						<li><a href="/member/my_autopay.asp">자동결제내역조회</a></li>
						<!--<li><a href="#">입금정보관리</a></li>-->
					</ul>
				</dd>
				<dd><a href="/member/my_avatar.asp">내아이템</a>
					<ul>
						<li><a href="/member/my_avatar.asp">아바타옷장</a></li>
						<li><a href="/member/my_gameitem.asp">내 게임 아이템</a></li>
					</ul>
				</dd>
				<!--<dd><a href="#">내친구관리</a>
					<ul>
						<li><a href="#">친구리스트</a></li>
						<li><a href="#">친구찾기/신청</a></li>
						<li><a href="#">친구신청확인</a></li>
						<li><a href="#">차단회원</a></li>
					</ul>
				</dd>-->
				<dd><a href="/member/my_note_receive.asp">내쪽지함</a>
					<ul>
						<li><a href="/member/my_note_receive.asp">받은쪽지함</a></li>
						<li class="blind"><a href="/member/my_note_send.asp">보낸쪽지함</a></li>
						<!--<li><a href="#">영구보관함</a></li>-->
					</ul>
				</dd>
				<dd><a href="restrict.asp">내이용제한정보</a></dd>
			</dl>
		</div>
		<script type="text/javascript">
$(document).ready(function() {	
	$('#nav dd').hover(function() {
		$('ul', this).slideDown(200);
		$(this).children('a:first').addClass("hov");
	}, function() {
		$('ul', this).slideUp(100);
		$(this).children('a:first').removeClass("hov");		
	});
});
</script>