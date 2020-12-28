<!--#include virtual="/inc/header.asp" -->
<title>::망고게임::</title>

<link rel="stylesheet" type="text/css" href="/join/css/join.css">

</head>

<body>
<h1 class="blind">망고게임 회원가입</h1>
<div id="pop_wrap">
	<div id="pop_header">
		<h2>본인인증 완료</h2>
		<a href="javascript:window.close()">닫기</a>
	</div>

	<div id="pop_container">
		<div id="pop_content">

			<!-- 이미 아이디 있는 경우:start-->
			<div style="display:none">
				<a href="javascript:popup_window('/join/pop_haveid.asp', '보유 아이디 확인', 'scrollbars=no,resizable=no,width=400,height=500,top=200,left=400')">이미 가입된 신분일 경우 UI : 별도 창에서 확인</a>
			</div>
			<!-- 이미 아이디 있는 경우:end -->

			<!-- 인증 성공:start-->
			<div style="">
				<div class="section default">
					본인인증이 완료되었습니다.<br>회원정보 입력 절차로 진행합니다.
				</div>

				<div class="wrap_btn border">
					<a href="javascript:void();" onclick="self.close() ; javascript:parent.opener.location.href='/join/input.asp'">확인</a><a href="javascript:window.close()" class="style1_nm">취소</a>
				</div>
			</div>
			<!-- 인증 성공:end -->

			<!-- 인증 실패:start-->
			<div style="display:none">
				<div class="section">
					본인인증에 실패하였습니다.<br><b>실패이유 : 이유기재</b>
				</div>

				<div class="wrap_btn border">
					<a href="javascript:void();">재인증</a><a href="javascript:window.close()" class="style1_nm">취소</a>
				</div>
			</div>
			<!-- 인증 실패:end -->


		</div>

	</div>

</div>
</body>
</html>