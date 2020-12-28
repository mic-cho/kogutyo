<!--#include virtual="/inc/header.asp" -->
<!--#include virtual="/bbs/lib/oop_check_page.asp" -->
<!-- #include virtual="/bbs/class/cls_encrypt.asp"-->
<%
Sql = "Select Top 1 * From member_db Where mem_session = ?"
Set DBConn = new XTclsDbConn
Call DBConn.AddParam("mem_session",session.SessionID)
Set Rs = DBConn.RSOpen(SQL)
Set DBConn = Nothing
if not rs.eof then
	RSCnt = RS.Fields.Count    '필드의 갯수
	for i = 0 to RSCnt - 1
		obj_name = RS.fields(i).name
		Execute(obj_name & " = RS(" & i & ")")
	Next
	if isNull(mem_family_id) or mem_family_id ="" then mem_family_id = "-"
else
	Call MovePage("/","MOVE","")
end if
%>
<title>::고구려게임 회원가입::</title>

<link rel="stylesheet" type="text/css" href="/join/css/join.css">

<!--#include virtual="/inc/top_solo.asp" -->

	<div id="container">
		<div id="content">

			<h2 class="blind">회원가입절차</h2>
			<ol class="navigation">
				<li>회원가입</li><li>약관동의&본인인증</li><li>정보입력</li><li class="on">가입완료</li>
			</ol>

			<div class="section_input">
				<h2>가입완료</h2>
				<div class="section_info">
					<span>환영합니다! 회원가입 절차가 완료되었습니다.<br>고구려게임 서비스 이용을 원하시면 로그인해주세요.</span>
				</div>

				<table class="tbstyle_join" caption="회원가입완료항목">
					<tbody>
					<tr>
						<th scope="low">아이디</th>
						<td><p class="input_result"><%=mem_id%></p></td>
					</tr>
					<tr>
						<th scope="low">닉네임</th>
						<td><p class="input_result"><%=mem_nick%></p></td>
					</tr>
					<tr>
						<th scope="low">휴대폰 번호</th>
						<td><p class="input_result"><%=Base64decode(mem_hp)%></p></td>
					</tr>
					<tr>
						<th scope="low">이메일</th>
						<td><p class="input_result"><%=Base64decode(mem_email)%></p></td>
					</tr>
					<tr>
						<th scope="low">추천인 아이디</th>
						<td><p class="input_result"><%=mem_family_id%></p></td>
					</tr>
					</tbody>
				</table>

				<div class="wrap_btn">
					<button type="button" class="style1 w20" onclick="location.href='/login.asp'">로그인하기</button>
					<button type="button" class="style1 w20" onclick="location.href='/'">메인으로</button>
				</div>

			</div>

		</div>

	</div>

<!--#include virtual="/inc/footer_solo.asp" -->