
<div class="body_info m_t_10">
	<div class="wrap">
		<div class="section_info">
			<p class="name"><strong><%=login_mem_id%>님</strong><a href="/member/info_main.asp" class="btn">내정보</a><a href="/logout.asp" class="btn c999">로그아웃</a></p>
			<div class="info_game">				
				<ul class="my_data">
					<li>
						<dl>
							<dt>망고코인</dt>
							<dd><span class="inblck f12"><%=formatnumber(login_mem_money_cash,0)%></span> 원<a href="/member/my_account.asp" class="sbtn fr"><span>결제내역</span></a></dd>
						</dl>
					</li>					
					<li>
						<dl>
							<dt>문의하신 내용</dt>
							<dd><span class="fl inblck">답변 <span class="inblck fc_f00 fbo f12">0</span> / 질문 <span class="inblck f12">0</span></span><a href="javascript:ready();" class="sbtn fr"><span>내역보기</span></a></dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>신고하신 내용</dt>
							<dd><span class="fc_f00 fbo fl">접수중</span><a href="javascript:ready();" class="sbtn fr"><span>신고취소</span></a></dd>
						</dl>
					</li>
					<li>접속 IP 정보 : 115.90.90.174</li>				
				</ul>
			</div>
			<div class="ac m_t_10"><a href="/cs/my_inquiry_list.asp"><img src="/cs/img/btn_go_center.gif" width="121" height="24" /></a> <a href="/cs/inquiry.asp"><img src="/cs/img/btn_go_question.gif" width="121" height="24" /></a></div>
			<!--<ul class="info_use">
				<li class="lose">
					<dl>
						<dt>1일 손실머니</dt>
						<dd>80,800골드<a href="javascript:ready();" class="btn wide">자세히</a></dd>
					</dl>
				</li>
				<li class="item">
					<dl>
						<dt>보유아이템</dt>
						<dd>2개<a href="javascript:ready();" class="btn wide">자세히</a></dd>
					</dl>
				</li>
				패스 없음 <li class="pass"><dl><dt>사용패스</dt><dd><span>없음</span><a href="#" class="btn wide">구매하기</a></dd></li>
				<li class="pass silver">
					<dl>
						<dt>사용패스</dt>
						<dd><span>실버패스</span><a href="javascript:ready();" class="btn wide">연장하기</a></dd>
					</dl>
				</li>
			</ul>-->
		</div>
		<!--#include virtual="/member/cs_member.asp"--> 
		<p class="ac"><img src="/cs/img/info_oper.gif" width="245" height="249" /></p>
	</div>
</div>
