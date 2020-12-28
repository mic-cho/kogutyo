<!--#include virtual="/inc/header.asp" -->
<%if len(login_mem_id) = 0 then Call MovePage("","CLOSE","로그인 후 이용해주세요")%>
<title>::비밀번호 변경::</title>
<link rel="stylesheet" type="text/css" href="/pop/css/pop.css">
</head>
<body id="pop_findinfo">
<h1 class="blind">망고게임 비밀번호 변경</h1>
<div id="pop_wrap">
	<div id="pop_header">
		<h2>비밀번호 변경</h2>
	</div>
	<div id="pop_container">
		<div id="pop_chg_pass">
			<h3 class="pop_h3_title brd_btm_solid"><span class="arrow_bulet"></span>변경하실 비밀번호를 입력하세요</h3>
			<div class="change_pass">
<form action="pop_change_pass_ok.asp" method="post" name="frmAuth">
				<table class="pop_tbl" style="width:320px;">
					<col width="130px;"/>
					<col width=""/>
					<tr>
						<th><span class="chek_bulet"></span>기존 비밀번호</th>
						<td><label for="textfield"></label>
							<input type="password" name="OldPass" id="OldPass"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><span class="f11 lh10">임시 비밀번호를 받으신 경우 기존 비밀번호 입력란에 임시 비밀번호를 입력해 주세요. </span></td>
					</tr>
					<tr>
						<th><span class="chek_bulet"></span>새 비밀번호</th>
						<td><label for="textfield2"></label>
							<input type="password" name="NewPass" id="NewPass"></td>
					</tr>
					<tr>
						<th><span class="chek_bulet"></span>새 비밀번호 확인</th>
						<td><label for="textfield3"></label>
							<input type="password" name="ChkPass" id="ChkPass"></td>
					</tr>
				</table>
</form>
				<ul class="change_pass_comnt">
					<li>6자리 - 15자리의 영문자, 숫자, 특수문자 조합으로 만들어주세요 </li>
					<li>아이디, 연속된 숫자는 비밀번호로 사용하실 수 없습니다. </li>
				</ul>
			</div>
			<div class="wrap_btn"><a href="javascript:" onclick="send_it()" class="blue_btn">확인</a> <a href="javascript:window.close()" class="style1_nm">취소</a> </div>
		</div>
	</div>
</div>
</body>
<script language="JavaScript" type="text/JavaScript">
function send_it()
{
	f = document.frmAuth;
	if (ErrMsg("OldPass","기존 비밀번호를 입력해 주십시요") == false) return;
	if (ErrMsg("NewPass","변경할 비밀번호를 입력해 주십시요",6) == false) return;
	if (ErrMsg("ChkPass","확인 비밀번호를 입력해 주십시요",6) == false) return;
	if( $("#NewPass").val() != $("#ChkPass").val() )
	{
		alert("비밀번호 확인이 일치하지 않습니다.")
		return;
	}
	f.submit();
}
</script>

</html>