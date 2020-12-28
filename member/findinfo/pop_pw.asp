<!--#include virtual="/inc/header.asp" -->
<title>::고구려게임::</title>

<link rel="stylesheet" type="text/css" href="/pop/css/pop.css">
</head>
<body id="pop_findinfo">

<h1 class="blind">고구려게임 회원정보찾기</h1>
<div id="pop_wrap">
	<div id="pop_header">
		<h2>비밀번호 찾기</h2>
		<a href="javascript:window.close(); javascript:popup_window('/member/findinfo/pop_id.asp', '고구려게임 회원 아이디 찾기', 'scrollbars=no,resizable=no,width=500,height=480,top=200,left=400')">아이디 찾기 바로가기</a>
	</div>

	<div id="pop_container">
		<div id="pop_content">
		
			<div class="section_info">
				<ul>
				<li>아이디/비밀번호 찾기에 드는 비용은 고구려게임에서 부담합니다.</li>
				<li>안정적인 서비스 품질 제공 및 개인정보 도용방지를 위해 휴대폰 본인인증은 <b>1일 3회 실패시 이용을 제한</b>하고 있사오니, 많은 양해바랍니다.</li>
				</ul>
			</div>

			<h3>아이디 정보 입력</h3>
			<div class="section_pw">
				<table>
				<caption>아이디 정보 입력 목록</caption>
					<tr>
						<th scope="row"><label for="id">아이디</label></th>
						<td><input type="text" id="id" class="ipstyle_normal"></td>
					</tr>
					<tr>
						<th scope="row"><label for="name">이름</label></th>
						<td><input type="text" id="name" class="ipstyle_normal"></td>
					</tr>
					<tr>
						<th scope="row"><label for="birth">생년월일</label></th>
						<td><input type="text" id="birth" class="ipstyle_normal"><span class="info">8자리 형식 (예: 19920815)</span></td>
					</tr>
					<tr>
						<th scope="row"><label for="sex">성별</label></th>
						<td><input type="radio" id="male"><label for="male">남</label><input type="radio" id="female"><label for="female">여</label></td>
					</tr>
					<tr>
						<th scope="row"><label for="email">이메일</label></th>
						<td>
							<input type="text" id="email" class="ipstyle_email"> @ 
							<select><option>선택</option><option>naver.com</option><option>google.com</option><option>nate.com</option><option>hanmail.com</option><option>hotmail.com</option><option>dreamwiz.com</option><option>korea.com</option><option>netian.com</option><option>chol.com</option></select>
						</td>
					</tr>
				</table>
			</div>

			<div class="wrap_btn border">
				<a href="javascript:window.close(); javascript:popup_window('/member/findinfo/pop_pw_success.asp', '비밀번호 찾기', 'scrollbars=no,resizable=no,width=430,height=484,top=200,left=400')">확인</a><a href="javascript:window.close()" class="style1_nm">취소</a>
			</div>

		</div>

	</div>

</div>
</body>
</html>