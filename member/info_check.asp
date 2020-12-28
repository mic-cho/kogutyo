<!--#include virtual="/inc/header.asp" -->
<%if len(login_mem_id) = 0 then Call MovePage("/","MOVE","로그인 후 이용해주세요")%>
<title>::내정보 > 기본정보::</title>
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
<form action="info_basic.asp" method="post" name="frmAuth">
				<div class="body_shop">
					<div class="meminfo_div">
						<h1 class="h1_stitle">기본정보<span class="title_coment">회원가입시 입력하신 정보를 확인, 수정하실 수 있습니다.</span></h1>
						<div class="info_box ac">
							<h3 class="fc_FD6B00 f18 m_tb_10">비밀번호를 입력해 주세요</h3>
							<p class="brd_btm_solid lh16">개인정보를 안전하게 보호하기 위하여 비밀번호를 다시 한번 확인합니다.<br/>
								비밀번호는 타인에게 노출되지 않도록 주의해 주세요!</p>
							<ul class="basic_chk_form clearfix">
								<li><span class="m_r_20">아이디</span><span class="fc_009916"><%=login_mem_id%></span></li>
								<li><span class="m_r_20">비밀번호</span><span>
									<input name="tmpPass" type="password" class="input_txt">
									</span></li>
							</ul>
						</div>
						<div class="ac"><a href="javascript:" onclick="frmAuth.submit()" class="blue_btn">확인</a></div>
					</div>
				</div>
</form>
			</div>
		</div>
	</div>
	<!--#include virtual="/inc/footer.asp" -->