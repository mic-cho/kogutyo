<!--#include virtual="/inc/header.asp" -->
<title>::고구려게임::</title>

<link rel="stylesheet" type="text/css" href="/join/css/join.css">

<script type="text/javascript">
var agree=false;
//동의 체크

function CheckAll(pChecked)
{
	$("#agree1").attr("checked",pChecked);
	$("#agree2").attr("checked",pChecked);

}


function ShowAuth(pType)
{
	if(!$("#agree1").attr("checked")  )
	{
		alert("이용약관에 동의하셔야 합니다.")
		return;
	}
	
	if(!$("#agree2").attr("checked") )
	{
		alert("개인정보 수집및 이용 정책에 동의 하셔야 합니다.")
		return;
	}
	MovePage("input.asp?CertType=IPIN&dupinfo=<%=tmp_ZeroString(hour(now),2) & tmp_ZeroString(minute(now),2) & tmp_ZeroString(second(now),2) %>&birthdate=19881009&realname=박재영")
	return;	
	if(pType==1)
		popup_window('/join/certifi_phone.asp', '휴대폰인증', 'scrollbars=no,resizable=no,width=430,height=554,top=200,left=400')
	else
		popup_window('/join/certifi_ipin.asp', '아이핀인증', 'scrollbars=no,resizable=no,width=427,height=528,top=200,left=400')

	
}

</script>

<!--#include virtual="/inc/top_solo.asp" -->

	<div id="container">
		<div id="content">

			<h2 class="blind">회원가입절차</h2>
			<ol class="navigation">
				<li>회원가입</li><li class="on">약관동의&본인인증</li><li>정보입력</li><li>가입완료</li>
			</ol>

			<div class="section_term">
				<h2>약관동의</h2>
				<div class="section_info">
					<span>고구려게임 이용약관 및 개인정보 수집·이용에 동의하셔야 본인확인 및 가입절차가 진행됩니다.</span>
					<p><input type="checkbox" id="agree" name="chk" onClick="CheckAll(this.checked)">고구려게임 이용약관 및 개인정보 수집·이용에 동의합니다.</p>
				</div>

				<h3><input type="checkbox" id="agree1" name="agree1">이용약관 동의(필수)</h3>
				<div class="term">
					<iframe src="term_polish.asp" frameborder="0" scrolling="auto" title="고구려게임 이용약관"></iframe>
				</div>

				<h3><input type="checkbox" id="agree2" name="agree2">개인정보 수집·이용 정책 동의(필수)</h3>
				<div class="term">
					<iframe src="term_privacy1.asp" frameborder="0" scrolling="auto" title="고구려게임 개인정보 수집·이용 동의"></iframe>
				</div>
			</div>

			<div class="section_certification">
				<h2>본인인증</h2>
				<div class="section_info">
					<span>서비스 품질 유지 및 제공을 위해 본인인증을 통한 회원가입을 진행하고 있으며, 회원가입은 무료입니다.<br>
					1일 3회 인증서비스를 무료로 제공하고 있으며, 3회 초과시 인증 서비스 이용이 제한될 수 있습니다.</span>
				</div>

				<p class="wrap_btn">
					<a href="javascript:void();" onClick="ShowAuth(1)" class="style2">휴대폰 인증</a><a  href="javascript:void();" onClick="ShowAuth(2)" class="style2">아이핀 인증</a><!--<input class="style1" value="아이핀 인증" onclick="location.href='/join/certifi_ipin.asp">-->
				</p>
			</div>
		</div>

	</div>

<!--#include virtual="/inc/footer_solo.asp" -->