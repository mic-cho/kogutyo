<!--#include virtual="/inc/header.asp" -->
<title>::망고고스톱샵::</title>
<link rel="stylesheet" type="text/css" href="/cs/css/cs.css">

<!-- import for easytabs -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/js/easytabs/jquery.hashchange.min.js" type="text/javascript"></script>
<script src="/js/easytabs/jquery.easytabs.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready( function() {
	$('#tab_container').easytabs();
});
</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
</head>
<body>
<!--#include virtual="/inc/top.asp" -->
	<div id="container" class="container_info"> 
		<!--#include virtual="/cs/inc_snb.asp" -->
		<div id="content">
			<div class="body"> 
				<!--#include virtual="/cs/info.asp" -->
				<div class="body_shop">
					<div class="cs_main_box">
						<ul class="quick_menu">
							<li>
								<dl class="quick_lnk_dl quick_illst1">
									<dt>회원정보</dt>
									<dd><a href="#">회원가입</a></dd>
									<dd><a href="#">비밀번호 찾기</a></dd>
									<dd><a href="#">내 정보변경</a></dd>
									<dd><a href="#">OTP</a></dd>
								</dl>
							</li>
							<li>
								<dl class="quick_lnk_dl quick_illst2">
									<dt>게임이용</dt>
									<dd><a href="#">맞고 이용안내</a></dd>
									<dd><a href="#">게임접속 문의</a></dd>
									<dd><a href="#">게임 이용문의</a></dd>
									<dd><a href="#">PC사양정보 확인</a></dd>
								</dl>
							</li>
							<li>
								<dl class="quick_lnk_dl quick_illst3">
									<dt>불량이용신고</dt>
									<dd><a href="#">불량행위 신고</a></dd>
									<dd><a href="#">계정도용 신고</a></dd>
									<dd><a href="#">게임머니 유실신고</a></dd>
									<dd><a href="#">아이디정지</a></dd>
								</dl>
							</li>
							<li>
								<dl class="quick_lnk_dl quick_illst4">
									<dt>결제/구매</dt>
									<dd><a href="#">결제내역확인</a></dd>
									<dd><a href="#">결제도용</a></dd>
									<dd><a href="#">결제 환불/취소</a></dd>
									<dd><a href="#">결제/캐쉬 문의</a></dd>
								</dl>
							</li>
						</ul>
					</div>
					<div class="srch_box">
						<dl>
							<dt><img src="/cs/img/title_srch.png" width="117" height="23"></dt>
							<dd>
								<select class="SelectBasic type2" id="">
									<option value="">통합검색</option>
									<option>고스톱 </option>
									<option>포커 </option>
									<option>보드/캐주얼 </option>
									<option>RPG </option>
									<option>FPS/TPS/AOS </option>
									<option>스포츠/아케이드 </option>
									<option>웹게임 </option>
									<option>개인정보 </option>
									<option>피망캐쉬 </option>
									<option>유료서비스 </option>
									<option>신고하기 </option>
									<option>서비스 </option>
									<option>보안서비스 </option>
								</select>
							</dd>
							<dd>
								<input type="text" size="60" placeholder="검색어를 입력해주세요">
							</dd>
							<dd><img src="/cs/img/btn_srch.png" width="85" height="34"></dd>
						</dl>
						<ul class="srch_keyword">
							<li class="fbo">인기검색어 : </li>
							<li><a href="#">로그인</a></li>
							<li><a href="#">비밀번호</a></li>
							<li><a href="#">패스회원</a></li>
							<li><a href="#">게임실행</a></li>
							<li><a href="#">회원가입</a></li>
						</ul>
					</div>
					<h2>서비스별 도움말 바로가기</h2>
					<table class="tbl_style3" width="100%">
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
						<thead>
							<tr>
								<th>회원정보</th>
								<th>설치/실행</th>
								<th>유료/결제</th>
								<th>신고/이용제한</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><ul class="cs_quick_lst">
										<li><a href="#">비밀번호 분실</a> </li>
										<li><a href="#">로그인문제해결</a> </li>
										<li><a href="#">아이핀 인증</a> </li>
										<li><a href="#">한게임 회원탈퇴</a> </li>
										<li><a href="#">보안 서비스</a> </li>
									</ul></td>
								<td><ul class="cs_quick_lst">
										<li><a href="#">ActiveX 오류 </a> </li>
										<li><a href="#">자동사양체크</a> </li>
										<li><a href="#">망고게임 설치/제거 </a> </li>
										<li><a href="#">에러메시지</a> </li>
										<li><a href="#">윈도우7 호환성오류</a> </li>
									</ul></td>
								<td><ul class="cs_quick_lst">
										<li><a href="#">망고코인 충전(구매)한도</a> </li>
										<li><a href="#">아이템 청약철회</a> </li>
										<li><a href="#">Plus회원제 변경/해지</a> </li>
										<li><a href="#">망고코인 충전</a> </li>
										<li><a href="#">망고코인 환불</a> </li>
									</ul></td>
								<td><ul class="cs_quick_lst">
										<li><a href="#">명의/결제정보 도용신고</a> </li>
										<li><a href="#">게임별 이용제한 규정</a> </li>
										<li><a href="#">아이디 이용제한 해제요청</a> </li>
										<li><a href="#">게임머니유실 신고방법</a> </li>
										<li><a href="#">아이디 계정도용 신고방법</a> </li>
									</ul></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!--#include virtual="/inc/footer.asp" -->