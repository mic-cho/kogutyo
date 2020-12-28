<!--#include virtual="/inc/header.asp" -->
<title>::고객센터 - 1:1문의하기::</title>
<link rel="stylesheet" type="text/css" href="/cs/css/cs.css">

</head>
<body>
<!--#include virtual="/inc/top.asp" -->
	<div id="container" class="container_info"> 
		<!--#include virtual="/cs/inc_snb.asp" -->
		<div id="content">
			<div class="body"> 
				<!--#include virtual="/cs/info.asp" -->
				<div class="body_cs">
					<div class="cs_div">
						<h1 class="h1_stitle">1:1문의<span class="title_coment">분류별로 문의를 하시면 신속히 답변드리도록 하겠습니다.</span></h1>
						<div class="ar m_t_10"> <span class="ico chk"></span>체크된 항목은 필수입력항목입니다.</div>
          <form name="frmQNA" method="post" action="inquiry_ok.asp" style="margin:0">
						<table class="tbl_style4">
							<tr>
								<th scope="row"><span class="ico chk"></span>분류</th>
								<td><ul class="inquiry_class">
										<li>
											<input type="radio" id="declaration" name="bb_01" value="신고" checked >
											<label for="declaration">신고</label>
										</li>
										<li>
											<input type="radio" id="mem_info" name="bb_01" value="개인정보">
											<label for="mem_info">개인정보</label>
										</li>
										<li>
											<input type="radio" id="cash" name="bb_01" value="캐쉬" >
											<label for="cash">캐쉬</label>
										</li>
										<li>
											<input type="radio" id="login" name="bb_01" value="로그인" >
											<label for="login">로그인</label>
										</li>
										<li>
											<input type="radio" id="event" name="bb_01" value="이벤트" >
											<label for="event">이벤트</label>
										</li>
										<li>
											<input type="radio" id="suggestion" name="bb_01" value="제안/사업제휴" >
											<label for="suggestion">제안/사업제휴</label>
										</li>
										<li>
											<input type="radio" id="game" name="bb_01" value="게임관련" >
											<label for="game">게임관련</label>
										</li>
										<li>
											<input type="radio" id="etc" name="bb_01" value="기타" >
											<label for="etc">기타</label>
										</li>
									</ul></td>
							</tr>
							<tr>
								<th scope="row"><span class="ico chk"></span>제목</th>
								<td><input type="text" class="ipstyle_wide" id="bb_title" name="bb_title"></td>
							</tr>
							<tr>
								<th scope="row"><span class="ico chk"></span>내용</th>
								<td><textarea class="ipstyle_text" id="bb_content" name="bb_content"></textarea></td>
							</tr>
							<tr>
								<th scope="row">이메일 답변동의</th>
								<td><input type="text" id="tmp_email1" name="tmp_email1" class="ipstyle_normal">
									@
									<input type="text" id="tmp_email2" name="tmp_email2" class="ipstyle_normal">
									<select class="select_email" onChange="tmp_email2.value=this.value">
										<option value="">직접입력</option>
										<option>naver.com</option>
										<option>google.com</option>
										<option>nate.com</option>
										<option>hanmail.com</option>
										<option>hotmail.com</option>
										<option>dreamwiz.com</option>
										<option>korea.com</option>
										<option>netian.com</option>
										<option>chol.com</option>
									</select></td>
							</tr>
							<tr>
								<th scope="row" class="bgimgx">휴대폰 수신동의</th>
								<td><select class="select_phone" name="tmp_tel_1" id="tmp_tel_1">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
									</select>
									-
									<input name="tmp_tel_2" type="text" class="ipstyle_phone" id="tmp_tel_2" onKeyUp="" maxlength="">
									-
									<input name="tmp_tel_3" type="text" class="ipstyle_phone" id="tmp_tel_3" onKeyUp="" maxlength="">
									<p class="m_t_5">
										<input type="checkbox" name="tmp_tel_check" id="tmp_tel_check" value="Y">
										답변 등록 시 SMS 알림에 대한 수신동의</p></td>
							</tr>
							<tr>
								<th scope="row" class="bgimgx"><span class="ico chk"></span>망고게임 아이디</th>
								<td><%=login_mem_id%></td>
							</tr>
							<tr>
								<th scope="row"><span class="ico chk"></span>개인정보 이용동의</th>
								<td><p class="agree">망고소프트㈜에서는 고객상담을 목적으로 ‘ID, 회원번호, 이메일, 휴대폰번호, 
										PC사양정보 및 본문내용에 작성하여 주신 개인정보’를 수집하며, 수집한 개인정보는 
										전자상거래 등에서의 소비자보호에 관한 법률에 의거하여 3년간 보관 후 파기합니다.
										고객님께서는 개인정보보호법에 따라 개인정보 수집동의를 거부할 권리가 있으며, 
										거부 시에는 고객상담이 어렵습니다.</p>
									<p class="m_t_5">
										<input type="checkbox" name="tmp_private_check" id="tmp_private_check">
										개인정보 수집/이용에 동의합니다.</p></td>
							</tr>
						</table>
						
          </form>
          <div class="wrap_btn"><a href="javascript:" onClick="send_it()"  class="darkgray_btn">작 성</a> <a href="#" class="gray_btn">취 소</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script language="JavaScript" type="text/JavaScript">
function send_it()
{
	f = document.frmQNA;
	if (ErrMsg("bb_title","제목을 입력해 주십시요") == false) return;
	if (ErrMsg("bb_content","내용을 입력해 주십시요") == false) return;
	if($("#tmp_private_check").is(":checked") == false)
	{
		alert("개인정보 수집/이용에 동의 하셔야합니다.")
		return;
	}
	if(confirm('1:1 문의를 작성하시겠습니까?'))
		f.submit();
}
</script>
<!--#include virtual="/inc/footer.asp" -->