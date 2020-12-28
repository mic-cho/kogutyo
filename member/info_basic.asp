<!--#include virtual="/inc/header.asp" -->
<!-- #include virtual="/bbs/class/cls_encrypt.asp"-->
<%
if len(login_mem_id) = 0 then Call MovePage("/","MOVE","로그인 후 이용해주세요")
tmpPass = request.Form("tmpPass")
Set XTEncrypt = new XTclsEncrypt
tmpPass = XTEncrypt.SHA256(tmpPass)
mem_hp = Base64decode(login_mem_hp)
mem_email = Base64decode(login_mem_email)

Set XTEncrypt = nothing


if tmpPass <> login_mem_pass then Call MovePage("","BACK","비밀번호가 일치하지 않습니다.")

%>
<title>::내정보 > 기본정보 관리::</title>
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
						<h1 class="h1_stitle">기본정보<span class="title_coment">회원가입시 입력하신 정보를 확인, 수정하실 수 있습니다.</span></h1>
						<div class="info_box">
							<h2>회원님의 기본정보</h2>
							<table class="tbl_style2" width="100%">
								<col width="160px"/>
								<col width=""/>
								<tr>
									<th>아이디</th>
									<td><span class="fc_FD6B00 fbo"><%=login_mem_id%></span> (가입일:<%=year(login_mem_regist)%>년<%=month(login_mem_regist)%>월<%=day(login_mem_regist)%>일) &nbsp;&nbsp;<a href="javascript:ready();" class="sbtn"><span>내 아이디 모두보기</span></a></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><span class="fc_FD6B00 fbo"><%=login_md_name%></span> <a href="javascript:ready();" class="sbtn"><span>이름변경</span></a> &nbsp;&nbsp;개명으로 이름이 변경된 경우 이름변경을 클릭해주세요</td>
								</tr>
								<tr>
									<th>성별/생년월일</th>
									<td>남 / <%=year(login_md_birth)%>년<%=month(login_md_birth)%>월<%=day(login_md_birth)%>일</td>
								</tr>
								<tr>
									<th>별명</th>
									<td><%=login_mem_nick%></td>
								</tr>
								<tr>
									<th>휴대폰</th>
									<td><%=mem_hp%></td>
								</tr>
								<tr>
									<th>이메일주소</th>
									<td><%=mem_email%>
										<input type="checkbox" name="emsagree" id="emsagree" value="Y" >
										<label for="emsagree" class="i_label"><b>홍보성 이메일 수신동의</b></label>
										
										<!-- 이메일 도움말 레이어 -->
										
										<p class="f11 dotum lh12 m_t_10">이메일 수정 시 확인메일이 발송됩니다.<br>
											비밀번호 분실 시 위 이메일로 비밀번호를 재발급 받으실 수 있으므로 정확히 입력해 주세요.</p></td>
								</tr>
								<tr>
									<th>비밀번호 찾기 관리</th>
									<td><input type="checkbox" name="shut" value="N" id="shut"  class="input_chk first">
										<label for="shut" class="i_label">휴대폰 연락처로 찾기 차단</label>
										&nbsp;
										<input type="checkbox" name="shut2" value="N" id="shut2"  class="input_chk">
										<label for="shut2" class="i_label">이메일 인증 찾기 차단</label>
										&nbsp;
										<input type="checkbox" name="shut3" value="N" id="shut3"  class="input_chk">
										<label for="shut3" class="i_label">아이핀 인증 찾기 차단</label></td>
								</tr>
								<tr>
									<th>주소</th>
									<td><div class="item"><span>157 - 010</span>&nbsp; <a href="javascript:addrSearchNew();" class="sbtn"><span>변경</span></a><br>
											<span id="addr_txt">서울 강서구 화곡동 중앙하이츠3동606호</span> </div></td>
								</tr>
							</table>
							<div class="ac"><a href="/member/info_basic.asp" class="blue_btn">저장</a>&nbsp; <a href="/member/info_basic.asp" class="gray_btn">취소</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--#include virtual="/inc/footer.asp" -->