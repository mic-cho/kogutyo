<!--#include virtual="/inc/header.asp" -->
<title>::망고게임::</title>

<link rel="stylesheet" type="text/css" href="/pop/css/pop.css">
</head>
<body id="pop_findinfo">

<h1 class="blind">망고게임 회원정보찾기</h1>
<div id="pop_wrap">
	<div id="pop_header">
		<h2>비밀번호 찾기</h2>
		<a href="/member/findid/pop_id.asp">아이디 찾기 바로가기</a>
	</div>

	<div id="pop_container">
		<div id="pop_content">
		
			<div class="section_info">
				<ul>
				<li>새 비밀번호 입력 후 창이 닫기면 로그인 하시길 바랍니다.</li>
				</ul>
			</div>

			<h3>새 비밀번호 입력</h3>
			<div class="section_pw">
				<table>
				<caption>새 비밀번호 입력</caption>
					<tr>
						<th scope="row"><label for="newpw1">새 비밀번호</label></th>
						<td><input type="text" id="newpw1" class="ipstyle_normal"></td>
					</tr>
					<tr>
						<th scope="row"><label for="newpw2">새 비밀번호 확인</label></th>
						<td><input type="text" id="nwepw2" class="ipstyle_normal"><span class="info">8자리 형식 (예: 19920815)</span></td>
					</tr>
				</table>
			</div>

			<div class="wrap_btn border">
				<a href="javascript:window.close(); javascript:parent.opener.location.href='/join/input.asp'">확인</a><a href="javascript:window.close()" class="style1_nm">취소</a>
			</div>

		</div>

	</div>

</div>
</body>
</html>