<!--#include virtual="/inc/header.asp" -->
<title>::고객센터 - 1:1문의하기::</title>
<link rel="stylesheet" type="text/css" href="/cs/css/cs.css">
</head>
<body>
<%
Select Case trim(s_type)
Case "2"
	p_type = "계정도용신고"
	p_header = "<h1 class=""h1_stitle"">계정도용신고<span class=""title_coment"">계정 유출 및 도용의심 발생시 신고해 주세요. </span></h1>"
Case "3"
	p_type = "게임머니유실신고"
	p_header = "<h1 class=""h1_stitle"">게임머니 유실신고<span class=""title_coment"">게임머니가 유실되거나 망고코인 충전이 안될경우 신고해 주세요. </span></h1>"
Case else
	p_type = "불량행위신고"
	p_header = "<h1 class=""h1_stitle"">불량행위신고<span class=""title_coment"">유해게시물(음란ㆍ불법 정보) 또는 욕설, 도배, 광고 등을 하는 이용자 발견 시 신고해 주세요. </span></h1>"
end Select

%>
<!--#include virtual="/inc/top.asp" -->
	<div id="container" class="container_info"> 
		<!--#include virtual="/cs/inc_snb.asp" -->
		<div id="content">
			<div class="body"> 
				<!--#include virtual="/cs/info.asp" -->
				<div class="body_cs">
					<div class="cs_div">
						<%=p_header%>
						<div class="ar m_t_10"> <span class="ico chk"></span>체크된 항목은 필수입력항목입니다.</div>
						
					  <table class="tbl_style4">
					  <form name="frmQNA" method="post" action="declara_ok.asp">
<input name="bb_01" type="hidden" id="bb_01" value="<%=p_type%>">
<input name="bb_19" type="hidden" id="bb_19" value="">
<input name="bb_20" type="hidden" id="bb_20" value="">
							<tr>
								<th scope="row">이름</th>
								<td><%=login_md_name%></td>
							</tr>
							<tr>
								<th scope="row"><span class="ico chk"></span>제목</th>
								<td><input name="bb_title" type="text" class="ipstyle_wide" id="bb_title"></td>
							</tr>
							<tr>
								<th scope="row"><span class="ico chk"></span>내용</th>
								<td><textarea name="bb_content" class="ipstyle_text" id="bb_content">아래 내용을 자세히 입력해주셔야 빠른 처리가 가능합니다.
· 신고일자 : 
· 신고자 아이디 : 
· 신고대상 아이디 : 
· 내용 : </textarea></td>
							</tr>
							<tr>
								<th scope="row">이메일 답변동의</th>
								<td><input type="text" id="tmp_email1" name="tmp_email1"  class="ipstyle_normal">
									@
									<input type="text" id="tmp_email2" name="tmp_email2"  class="ipstyle_normal">
									<select class="select_email" onChange="tmp_email2.value=this.value">
										<option value="">직접입력</option>
										<option>naver.com</option>
										<option>google.com</option>
										<option>nate.com</option>
										<option>hanmail.com</option>
										<option>hotmail.com</option>
										<option>dreamwiz.com</option>
										<option>korea.com</option>
										<option>netian.com</option>
										<option>chol.com</option>
									</select></td>
							</tr>
							<tr>
								<th scope="row" class="bgimgx">휴대폰 수신동의</th>
								<td><select class="select_phone" name="tmp_tel_1" id="tmp_tel_1">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
									</select>
									-
									<input name="tmp_tel_2" type="text" class="ipstyle_phone" id="tmp_tel_2" onKeyUp="" maxlength="">
									-
									<input name="tmp_tel_3" type="text" class="ipstyle_phone" id="tmp_tel_3" onKeyUp="" maxlength="">
									<p class="m_t_5">
										<input type="checkbox" name="tmp_tel_check" id="tmp_tel_check" value="Y">
										답변 등록 시 SMS 알림에 대한 수신동의</p></td>
							</tr>
					  </form>
<form name="frmAttach" target="frmUpload" action="<%=DefUploadDir%>" method="post" enctype="multipart/form-data">
							<tr>
								<th scope="row" class="bgimgx">첨부파일</th>
								<td><input type="text" id="fileName" class="file_input_textbox" readonly="readonly" size="54">
									<div class="file_input_div">
										<input type="button" value="파일찾기" class="file_input_button" />
										<input type="file" class="file_input_hidden" name="upload" onchange="javascript: document.getElementById('fileName').value = this.value" /><a href="javascript:" onClick="frmAttach.submit();fileName.value='';" class="btn file_add_btn"><span>파일추가</span></a>
										</div>
									<p class="m_tb_5">파일 찾기 후 파일추가를 클릭해 주셔야 첨부파일이 등록됩니다. </p>
									<select name="myAttach" id="myAttach" size="4" multiple class="select">
                  </select>
									<a href="javascript:" onClick="DeleteAttach()" class="btn"><span>파일삭제</span></a></td>
							</tr>
</form>
							<tr>
								<th scope="row" class="bgimgx"><span class="ico chk"></span>망고게임 아이디</th>
								<td><%=login_mem_id%></td>
							</tr>
							<tr>
								<th scope="row"><span class="ico chk"></span>개인정보 이용동의</th>
								<td><p class="agree">망고소프트㈜에서는 고객상담을 목적으로 ‘ID, 회원번호, 이메일, 휴대폰번호, 
										PC사양정보 및 본문내용에 작성하여 주신 개인정보’를 수집하며, 수집한 개인정보는 
										전자상거래 등에서의 소비자보호에 관한 법률에 의거하여 3년간 보관 후 파기합니다.
										고객님께서는 개인정보보호법에 따라 개인정보 수집동의를 거부할 권리가 있으며, 
										거부 시에는 고객상담이 어렵습니다.</p>
									<p class="m_t_5">
										<input type="checkbox" name="tmp_private_check" id="tmp_private_check">
										개인정보 수집/이용에 동의합니다.</p></td>
							</tr>
						</table>
						<div class="wrap_btn"><a href="javascript:" onClick="send_it()" class="darkgray_btn">작 성</a> <a href="#" class="gray_btn">취 소</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<iframe id="frmUpload" name="frmUpload" style="display:none"></iframe>
<script language="JavaScript" type="text/JavaScript">
function SetImage(pUrl)
{
	var tmpArr = $("#fileName").val()
	tmpArr = tmpArr.split("\\")
	var fileName = tmpArr[tmpArr.length-1]
	$('#myAttach').append($('<option>', {
		value: pUrl,
		text: fileName
	}));
}
function DeleteAttach()
{
	$('option:selected', $('#myAttach')).remove();
}
function send_it()
{
	f = document.frmQNA;
	if (ErrMsg("bb_title","제목을 입력해 주십시요") == false) return;
	if (ErrMsg("bb_content","내용을 입력해 주십시요") == false) return;
	if($("#tmp_private_check").is(":checked") == false)
	{
		alert("개인정보 수집/이용에 동의 하셔야합니다.")
		return;
	}

	var obj = GetObj("myAttach")
	var objValue = ""
	var objText = ""
	for(i=0;i< obj.length;i++)
	{
		objValue += obj[i].value + "||"
		objText += obj[i].text + "||"
	}

	$("#bb_19").val(objValue)
	$("#bb_20").val(objText)

	if(confirm('불량행위 신고를 작성하시겠습니까?'))
		f.submit();
}





</script>

<!--#include virtual="/inc/footer.asp" -->