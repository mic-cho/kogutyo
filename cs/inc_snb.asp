<%
if len(login_mem_id) = 0 And login_status = false then 
	response.Clear()
	Call MovePage("/","MOVE","")
end if
%>
<div class="snb_wrap clearfix">
			<dl class="cs_snb" id="nav">
				<dt><a href="javascript:ready();">고객센터</a></dt>
				<dd><a href="javascript:ready();">도움말</a>					
				</dd>
				<dd><a href="javascript:ready();">문의하기</a>
					<ul>
						<li><a href="javascript:ready();">1:1 문의하기</a></li>
						<li><a href="javascript:ready();">내 문의내역</a></li>
					</ul>
				</dd>
				<dd><a href="javascript:ready();">신고하기</a>
					<ul>
						<li><a href="javascript:ready();">불량행위신고</a></li>
						<li><a href="javascript:ready();">계정도용 신고</a></li>
						<li><a href="javascript:ready();">게임머니 유실신고</a></li>
					</ul>
				</dd>
				<!--<dd><a href="#">보안서비스</a>
					<ul>
						<li><a href="#">지정 PC</a></li>						
						<li><a href="#">보안 SMS</a></li>
						<li><a href="#">개인암호</a></li>	
					</ul>
				</dd>-->
				<dd><a href="javascript:ready();">다운로드</a></dd>
				<dd><a href="/cs/term.asp">운영정책</a>
					<ul>
						<li><a href="/cs/term.asp">이용약관</a></li>
						<li><a href="/cs/privacy.asp">고구려게임 개인정보보호방침</a></li>
						<li><a href="javascript:ready();">유료서비스약관</a></li>
						<li><a href="javascript:ready();">이용제한 규정</a></li>
					</ul>
				</dd>
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