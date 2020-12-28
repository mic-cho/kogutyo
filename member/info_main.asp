<!--#include virtual="/inc/header.asp" -->
<%if len(login_mem_id) = 0 then Call MovePage("/","MOVE","로그인 후 이용해주세요")%>
<title>::내정보::</title>
<link rel="stylesheet" type="text/css" href="/member/css/member.css">

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
		<!--#include virtual="/member/inc_snb.asp" -->
		<div id="content">
			<div class="body"> 
				<!--#include virtual="/member/info.asp" -->
				<div class="body_shop">
					<div class="meminfo_div">
						<h1 class="h1_title">내정보<span class="title_coment">고객님의 기본정보, 보안, 유료서비스 정보 등을 확인하고 쉽게 변경할 수 있습니다.</span></h1>
						<div class="info_box">
							<h2>회원님의 기본정보</h2>
							<table class="tbl_style2" width="100%">
								<col width="160px"/>
								<col width="30%"/>
								<col width="160px"/>
								<col width="30%"/>
								<tr>
									<th>아이디</th>
									<td><span class="fc_FD6B00 fbo"><%=login_mem_id%></span></td>
									<th>내 캐쉬</th>
									<td><span class="fc_FD6B00 fbo f14"><%=formatnumber(login_mem_money_cash,0)%></span> 원</td>
								</tr>
								<tr>
									<th>대표닉네임</th>
									<td><div class="relative"><span class="fc_FD6B00 fbo"><%=login_mem_nick%></span><a href="javascript:ready();" class="sbtn_rht"><span>변경</span></a></div></td>
									<th>내 친구</th>
									<td><span class="fc_FD6B00 fbo f14">0</span> 명</td>
								</tr>
								<tr>
									<th>비밀번호 변경일자</th>
									<td><div class="relative"><span class="fc_FD6B00 fbo"><%=year(login_mem_date_password)%>년 <%=month(login_mem_date_password)%>월 <%=day(login_mem_date_password)%>일</span><a href="javascript:ready();" class="sbtn_rht"><span>비밀번호변경</span></a></div></td>
									<th>쪽지</th>
									<td><span class="fc_FD6B00 fbo f14">0</span> / 2</td>
								</tr>
							</table>
						</div>
						<div class="info_box">
							<h2>유료서비스 이용정보</h2>
							<table class="tbl_style2" width="100%">
								<col width="160px"/>
								<col width="30%"/>
								<col width="160px"/>
								<col width="30%"/>
								<thead>
									<tr>
										<th colspan="4">내 고구려코인</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>충전한 고구려코인</th>
										<td><span class="fc_FD6B00 fbo f18">800</span> 원 </td>
										<th>지급받은 고구려코인</th>
										<td><span class="fc_FD6B00 fbo f14">0</span> 원</td>
									</tr>
								</tbody>
								<tbody class="thead_stl">
									<tr>
										<th colspan="4">내 충전한도</th>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<th>충전하신 금액</th>
										<td><span class="fc_FD6B00 fbo f14"><%=formatnumber(login_mem_charge_money,0)%></span> 원</td>
										<th>충전가능한 금액</th>
										<td><span class="fc_FD6B00 fbo f18"><%=formatnumber(login_mem_charge_money_Max,0)%></span> 원</td>
									</tr>
								</tbody>
								<tbody class="thead_stl">
									<tr>
										<th colspan="4">기타 정보</th>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<th>회원제 / 정액제</th>
										<td><div class="relative" style="top:2px;"><span class="fc_FD6B00 fbo f14">0</span> 건<a href="javascript:ready();" class="sbtn_rht"><span>자세히</span></a></div></td>
										<th>자동결제중인 상품</th>
										<td><div class="relative" style="top:2px;"><span class="fc_FD6B00 fbo f14">1</span> 건 <a href="javascript:ready();" class="sbtn_rht"><span>자세히</span></a></div></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--#include virtual="/inc/footer.asp" -->