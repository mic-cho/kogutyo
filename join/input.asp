<!--#include virtual="/inc/header.asp" -->
<title>::고구려게임 회원가입::</title>
<%
Select Case request.querystring("CertType")
Case "IPIN"
' 아이핀일경우
	p_jumin = request.querystring("dupinfo")
	p_birth = request.querystring("birthdate")
	p_name = request.querystring("realname")
	p_birth = left(p_birth,4) & "-" & Mid(p_birth,5,2) & "-" & Mid(p_birth,7,2)

Case "PHONE"
	p_jumin = request.querystring("di")
	p_birth = request.querystring("birthday")
	p_name = request.querystring("name")
	p_birth = left(p_birth,4) & "-" & Mid(p_birth,5,2) & "-" & Mid(p_birth,7,2)
	
Case Else
	Call MovePage("/","MOVE","잘못된 접근입니다.")
End Select

Sql = "Select Top 1 * From member_detail Where md_jumin = ?"
Set DBConn = new XTclsDbConn
Call DBConn.AddParam("p_jumin",p_jumin)
Set Rs = DBConn.RSOpen(SQL)
Set DBConn = Nothing

if not RS.eof then
	Call MovePage("","BACK","이미 가입된 회원입니다.")
End if


tmpAge = DateDiff("YYYY",p_birth,now)

if CCur(tmpAge) < 18 then Call MovePage("/","MOVE","미성년자는 회원가입이 불가능 합니다.")


%>

<link rel="stylesheet" type="text/css" href="/join/css/join.css">

<!-- import for selector -->

<script type="text/javascript">
$(document).ready( function() {
	$("select").selectbox();
});
</script>

<!--#include virtual="/inc/top_solo.asp" -->
<form action="input_ok.asp" method="post" name="frmRegist" id="frmRegist" >
<input type="hidden" name="md_name" value="<%=p_name%>">
<input type="hidden" name="md_birth" value="<%=p_birth%>">
<input type="hidden" name="md_jumin" value="<%=p_jumin%>">
	<div id="container">
		<div id="content">

			<h2 class="blind">회원가입절차</h2>
			<ol class="navigation">
				<li>회원가입</li><li>약관동의&본인인증</li><li class="on">정보입력</li><li>가입완료</li>
			</ol>

			<div class="section_input">
				<h2>회원정보입력</h2>
				<div class="section_info">
					<span>서비스의 품질 유지 및 원활한 제공을 위해 본인인증을 통한 회원가입을 진행하고 있으며, 회원가입은 무료입니다.</span>
				</div>
				<table class="tbstyle_join">
					<caption>회원 가입 정보 입력</caption>
					<tr>
						<th scope="low"><label for="id">아이디</label></th>
						<td>
							<input type="text" id="mem_id" name="mem_id" class="ipstyle_wide" onchange="CheckID(this.value)">
							<p id="ErrID" class="info">6~20자리의 영문 , 숫자, 특수문자만 사용할 수 있습니다.</p>
							<p id="ErrID_2" class="ErrID info alert" style="display:none"><i class="fa fa-exclamation-circle"></i>필수입력항목입니다. 아이디를 입력해주세요!</p>
							<p id="ErrID_3" class="ErrID info alert" style="display:none"><i class="fa fa-exclamation-circle"></i>이미 사용중인 아이디입니다. 다른 아이디를 입력해주세요!</p>
							<p id="ErrID_4" class="ErrID info ok" style="display:none"><i class="fa fa-check"></i>입력확인. 사용가능한 아이디입니다.</p>
						</td>
					</tr>
					<tr>
						<th scope="low"><label for="nick">닉네임</label></th>
						<td>
							<input type="text" id="mem_nick" name="mem_nick" class="ipstyle_wide" onchange="CheckNick(this.value)">
							<p id="ErrNick" class="info">설정한 별명은 변경할 수 없으니 신중히 입력해주세요. 아이디와 동일한 별명을 사용하시면 아이디 도용 피해의 위험에 노출될 수 있으니 다르게 만들어주세요.</p>
						</td>
					</tr>
					<tr>
						<th scope="low"><label for="pw1">비밀번호</label></th>
						<td><input type="password" name="mem_pass" id="mem_pass" class="ipstyle_wide">
						<p id="ErrPass" class="info">4~12자리의 영문 소문자, 숫자만 사용할 수 있습니다.</p>
						</td>
					</tr>
					<tr>
						<th scope="low"><label for="pw2">비밀번호 확인</label></th>
						<td><input type="password" name="tmp_pass" id="tmp_pass" class="ipstyle_wide">
						<p id="ErrPassChk" class="info">확인을 위해 다시 한 번 입력해주세요.</p>
						</td>
					</tr>

					<tr>
						<th scope="low"><label for="phone">휴대폰 번호</label></th>
						<td>
							<select class="select_phone" name="tmp_hp_1" id="tmp_hp_1">
								<option value="010">010</option><option value="011">011</option><option value="016">016</option><option value="017">017</option><option value="019">019</option>
							</select>
							-
                <input  name="tmp_hp_2" type="text" class="ipstyle_phone" id="tmp_hp_2"  onKeyUp="$(this).val( $(this).val().replace(/[^0-9]/gi,'') )" maxlength="4">
                -
                <input name="tmp_hp_3" type="text" class="ipstyle_phone" id="tmp_hp_3"  onKeyUp="$(this).val( $(this).val().replace(/[^0-9]/gi,'') )" maxlength="4">
							<p class="info"><input type="checkbox" name="tmp_hp_sms">SMS 수신동의</p>
							<p id="ErrPhone" class="info"></p>
						</td>
					</tr>
					<tr>
						<th scope="low"><label for="email">이메일</label></th>
						<td>
							<input type="text" id="tmp_email1" name="tmp_email1" class="ipstyle_normal">@
							<input type="text" id="tmp_email2" name="tmp_email2" class="ipstyle_normal">
							<select class="select_email" onChange="tmp_email2.value = this.value">
								<option value="">직접입력</option><option>naver.com</option><option>google.com</option><option>nate.com</option><option>hanmail.com</option><option>hotmail.com</option><option>dreamwiz.com</option><option>korea.com</option><option>netian.com</option><option>chol.com</option>
							</select>
							<p class="info caaa">임시비밀번호, 서비스 공지 및 결제내역 안내메일이 발송될 수 있으므로 정확히 입력해주세요.</p>
							<p id="ErrEmail" class="info"></p>
						</td>
					</tr>
					<tr>
						<th scope="low">생년월일</th>
						<td><%=p_birth%></td>
					</tr>
					<tr>
						<th scope="low">성별</th>
						<td><input type="radio" name="mem_sex" value="1" checked> 남 <input type="radio" name="mem_sex" value="2"> 여</td>
					</tr>
					<tr>
						<th scope="low">추천인 아이디</th>
						<td><input type="text" class="ipstyle_normal" id="mem_family_id" name="mem_family_id"></td>
					</tr>
					<!--
					<tr>
						<th scope="low">자동가입방지</th>
						<td></td>
					</tr>
					-->
				</table>

				<div class="wrap_btn">
					<button type="button" class="style1 w20" onClick="Send_it()">확인</a>
				</div>


			</div>

		</div>

	</div>
</form>
<script language="JavaScript" type="text/JavaScript">
var Check_ID_Info = false;
var Check_Nick_Info = false;

function ShowErrMsg(objID,pErrType,pMsg)
{
	var pStr
	var pClass
	if(pErrType==1)
	{
		pStr = '<i class="fa fa-check"></i>'
		pClass = "info ok"
	}
	else if(pErrType==2)
	{
		pStr = '<i class="fa fa-exclamation-circle"></i>'	
		pClass = "info alert"
	}
	else
	{
		pStr = ''
		pClass = "info"
	}
	$("#" + objID).html(pStr + pMsg)
	$("#" + objID).attr("class",pClass)

}

function CheckID(tmpID)
{
	if(tmpID=="")
	{
		ShowErrMsg("ErrID",2,"필수입력항목입니다. 아이디를 입력해주세요!")
		return;
	}
	Check_ID_Info = false;
	tmpID = escape(tmpID)
	Fn_LoadAjax("check_id.asp?id=" + tmpID)
}
function SetCheckID(rtnMsg)
{
	if(rtnMsg!="")
	{
		ShowErrMsg("ErrID",2,rtnMsg)
		return;
	}
	ShowErrMsg("ErrID",1,"입력확인. 사용가능한 아이디입니다.")
	Check_ID_Info = true;
}
function CheckNick(tmpNick)
{
	if(tmpNick=="")
	{
		ShowErrMsg("ErrNick",2,"필수입력항목입니다. 아이디를 입력해주세요!")
		return;
	}
	Check_Nick_Info = false;

	tmpNick = escape(tmpNick)
	Fn_LoadAjax("check_nick.asp?nick=" + tmpNick)
}
function SetCheckNick(rtnMsg)
{
	$(".ErrNick").hide()
	if(rtnMsg!="")
	{
		ShowErrMsg("ErrNick",2,rtnMsg)
		return;
	}
	ShowErrMsg("ErrNick",1,"입력확인. 사용가능한 아이디입니다.")
	Check_Nick_Info = true;
}

function CheckValue(ObjName,ErrObj,ErrMsg)
{
	if($("#" + ObjName).val()=="")
	{
		ShowErrMsg(ErrObj,2,ErrMsg)
		return false;
	}
	ShowErrMsg(ErrObj,1,"입력확인!")
	return true
}


function Send_it()
{
	if(!Check_ID_Info ) return;
	if(!Check_Nick_Info ) return;
	if(!CheckValue("mem_pass","ErrPass","필수입력항목입니다. 비밀번호를 입력해주세요!")) return;
	if(!CheckValue("tmp_pass","ErrPassChk","필수입력항목입니다. 비밀번호 확인을 입력해주세요!")) return;
	if($("#mem_pass").val() != $("#tmp_pass").val() )
	{
		ShowErrMsg("ErrPassChk",2,"비밀번호 확인이 일치하지 않습니다.")
		return;
	}
	if(!CheckValue("tmp_hp_2","ErrPhone","필수입력항목입니다. 휴대폰번호를 입력해주세요!")) return;
	if(!CheckValue("tmp_hp_3","ErrPhone","필수입력항목입니다. 휴대폰번호를 입력해주세요!")) return;
	if(!CheckValue("tmp_email1","ErrEmail","필수입력항목입니다. 이메일 주소를 입력해주세요!")) return;
	if(!CheckValue("tmp_email2","ErrEmail","필수입력항목입니다. 이메일 주소를 입력해주세요!")) return;
	
	if(confirm("회원가입을 진행하시겠습니까?"))
		$("#frmRegist").submit()
}


</script>

<!--#include virtual="/inc/footer_solo.asp" -->