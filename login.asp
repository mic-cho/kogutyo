<!--#include virtual="/inc/header.asp" -->
<title>::고구려게임 로그인::</title>

<link rel="stylesheet" type="text/css" href="/member/css/login.css">

<!--#include virtual="/inc/top_solo.asp" -->

<form id="frmLogin" name="frmLogin" action="/login_ok.asp" method="post">
	<div id="container">
		<div id="content">

			<h2 class="blind">로그인</h2>

			<div class="section_login">
				<p class="input"><input type="text" id="mem_id" name="mem_id" onKeyPress="LoginEnterCheck(frmLogin);" tabindex="1" placeholder="아이디"><input type="password" id="mem_pass" name="mem_pass" onKeyPress="LoginEnterCheck(frmLogin);" tabindex="2" placeholder="비밀번호"></p>
				<p class="btn"><button type="button" class="style1" onClick="login_ok(frmLogin)">로그인</button></p>
				<p class="id_save"><input type="checkbox" id="ChkSaveID" name="ChkSaveID">ID 기억하기</p>
				<ul>
					<li><a href="javascript:popup_window('/member/findinfo/pop_id.asp', '고구려게임 회원 아이디 찾기', 'scrollbars=no,resizable=no,width=500,height=480,top=200,left=400')">아이디 찾기</a></li>
					<li><a href="javascript:popup_window('/member/findinfo/pop_pw.asp', '고구려게임 회원 비밀번호 찾기', 'scrollbars=no,resizable=no,width=500,height=480,top=200,left=400')">비밀번호 찾기</a></li>
					<li class="join"><a href="/join/term.asp">회원가입</a></li>
				</ul>
			</div>

		</div>

	</div>

<script language="JavaScript" type="text/JavaScript">
var cookie_id = GetCookie("USERID")
if(cookie_id.length > 1)
{
	$("#mem_id").val(cookie_id)
	$("#ChkSaveID").attr("checked",true)
}
</script>
<script language="JavaScript">
function login_ok(f)
{
	
	if(!ErrMsg("mem_id","ID를 입력해 주세요")) return;
	if(!ErrMsg("mem_pass","비밀번호를를 입력해 주세요")) return;
	if($("#ChkSaveID").is(":checked") == true)
		SetCookie("USERID",$("#mem_id").val(),7)
	else
		SetCookie("USERID"," ",1)

	f.action = "/login_ok.asp"
	f.submit()
}

function LoginEnterCheck(f) 
{ 
	if(event.keyCode ==13) // 엔터키를 누르면 sendit() 호출  
		login_ok(f);
}
</script>
    <input name="go_url" type="hidden" id="go_url" value="<%=request.ServerVariables("HTTP_REFERER")%>">
  </form>
<!--#include virtual="/inc/footer_solo.asp" -->