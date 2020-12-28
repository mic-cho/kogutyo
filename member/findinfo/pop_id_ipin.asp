<!--#include virtual="/inc/header.asp" -->
<title>::망고게임::</title>

<link rel="stylesheet" type="text/css" href="/pop/css/pop.css">
</head>
<body id="pop_findinfo">

<h1 class="blind">망고게임 회원정보찾기</h1>
<div id="pop_wrap">
	<div id="pop_header">
		<h2>아이디 찾기</h2>
		<a href="/member/findid/pop_pw.asp">비밀번호 찾기 바로가기</a>
	</div>

	<div id="pop_container">
		<div id="pop_content">
		
			<div class="section_info">
				<ul>
				<li>아이디/비밀번호 찾기에 드는 비용은 망고게임에서 부담합니다.</li>
				<li>안정적인 서비스 품질 제공 및 개인정보 도용방지를 위해 휴대폰 본인인증은 <b>1일 3회 실패시 이용을 제한</b>하고 있사오니, 많은 양해바랍니다.</li>
				</ul>
			</div>

			<h3>아이디 검색 결과</h3>
			<div class="section_use">
				<ul>
				<li><input type="radio" onclick="javascript:location.href='pop_id.asp'"> 휴대폰</li><li><input type="radio" checked onclick="javascript:location.href='pop_id_ipin.asp'"> 아이핀</li>
				</ul>
				<p><button type="button" onclick="javascript:window.close(); javascript:popup_window('/member/findinfo/pop_ipin.asp', '아이핀인증', 'scrollbars=no,resizable=no,width=430,height=528,top=200,left=400')" class="btn">아이핀 인증</button></p>
			</div>

			<div class="wrap_btn border">
				<a href="javascript:window.close()" class="style1_nm">취소</a>
			</div>

		</div>

	</div>

</div>
</body>
</html>