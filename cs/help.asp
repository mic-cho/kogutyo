<!--#include virtual="/inc/header.asp" -->
<title>::망고고스톱샵::</title>
<link rel="stylesheet" type="text/css" href="/cs/css/cs.css">

<!-- import for easytabs -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/js/easytabs/jquery.hashchange.min.js" type="text/javascript"></script>
<script src="/js/easytabs/jquery.easytabs.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready( function() {
	$('#tab_container').easytabs();
});
</script>
<script type="text/javascript">
function showDiv(id) {
       var e = document.getElementById(id);
       if(e.style.display == 'block')
          e.style.display = 'none';
       else
          e.style.display = 'block';
    }

</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
</head>
<body>
<!--#include virtual="/inc/top.asp" -->
	<div id="container" class="container_info"> 
		<!--#include virtual="/cs/inc_snb.asp" -->
		<div id="content">
			<div class="body"> 
				<!--#include virtual="/cs/info.asp" -->
				<div class="body_shop">
					<div class="cs_div">
						<h1 class="h1_stitle">도움말<span class="title_coment">도움말을 카테고리별러 검색하실 수 있습니다.</span></h1>
						<div class="srch_box">
							<dl>
								<dt><img src="/cs/img/title_srch.png" width="117" height="23"></dt>
								<dd>
									<select class="SelectBasic type2" id="">
										<option value="">통합검색</option>
										<option>고스톱 </option>
										<option>포커 </option>
										<option>보드/캐주얼 </option>
										<option>RPG </option>
										<option>FPS/TPS/AOS </option>
										<option>스포츠/아케이드 </option>
										<option>웹게임 </option>
										<option>개인정보 </option>
										<option>피망캐쉬 </option>
										<option>유료서비스 </option>
										<option>신고하기 </option>
										<option>서비스 </option>
										<option>보안서비스 </option>
									</select>
								</dd>
								<dd>
									<input type="text" size="50" placeholder="검색어를 입력해주세요">
								</dd>
								<dd><img src="/cs/img/btn_srch.png" width="85" height="34"></dd>
							</dl>
							<ul class="srch_keyword">
								<li class="fbo">인기검색어 : </li>
								<li><a href="#">로그인</a></li>
								<li><a href="#">비밀번호</a></li>
								<li><a href="#">패스회원</a></li>
								<li><a href="#">게임실행</a></li>
								<li><a href="#">회원가입</a></li>
							</ul>
						</div>
						<h2>도움말 카테고리 선택</h2>
						<table class="help_cate_tble" width="100%">
							<col width="100px"/>
							<col width=""/>
							<tbody>
								<tr>
									<th>1단계</th>
									<td><ul class="cs_hlep_ul">
											<li><a href="#">회원정보</a></li>
											<li><a href="#">유료/결제</a></li>
											<li><a href="#">신고/이용제한</a></li>
											<li><a href="#">서비스</a></li>
											<li class="select_li"><a href="#">게임문의</a></li>
										</ul></td>
								</tr>
								<tr>
									<th>2단계</th>
									<td><ul class="cs_hlep_ul">
											<li><a href="#">포커</a></li>
											<li class="select_li"><a href="#">고스톱</a></li>
											<li><a href="#">보드/케쥬얼</a></li>
											<li><a href="#">실행/오류</a></li>
											<li><a href="#">스마트폰게임</a></li>
										</ul></td>
								</tr>
								<tr>
									<th>3단계</th>
									<td><ul class="cs_hlep_ul">
											<li><a href="#">신맞고/맞고</a></li>
											<li class="select_li"><a href="#">섯다</a></li>
											<li><a href="#">고스톱</a></li>
											<li><a href="#">더블맞고</a></li>
											<li><a href="#">신맞고토너먼트</a></li>
										</ul></td>
								</tr>
							</tbody>
						</table>
						<div class="help_path">게임문의 > 고스톱 > <span>섯다</span></div>
						<table class="tbl_style2" width="100%" style="margin-top:0px;">
							<thead>
								<tr>
									<th>질문</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><a href="javascript:void()" onClick="showDiv('answer_div1')">[섯다] 게임은 어떤 게임인가요?</a>
										<div id="answer_div1">
											<p>섯다는 총 20장의 화투 패를 이용하여 2장 또는 3장으로 거기에 해당하는 족보의 순위로 승패를 겨루는 비교적 간단한 게임방식을 가지고 있습니다. </p>
											<p>매판마다 순간적인 판단, 재치가 요구되는 박진감 넘치는 게임이며 해당하는 족보의 순위로 승패를 겨루는 비교적 간단한 게임방식을 가지고 있습니다. </p>
											<p>지역마다 규칙에 대한 차이가 많아서 기본적이며 공통적인 규칙만 적용하였습니다.</p>
											<a href="#">☞ 게임방법 자세히 보기</a></div></td>
								</tr>
								<tr>
									<td><a href="javascript:void()" onClick="showDiv('answer_div2')">[섯다] 게임은 어떻게 하는거예요? </a>
										<div id="answer_div2">
											<p>섯다는 총 20장의 화투 패를 이용하여 2장 또는 3장으로 거기에 해당하는 족보의 순위로 승패를 겨루는 비교적 간단한 게임방식을 가지고 있습니다. </p>
											<p>매판마다 순간적인 판단, 재치가 요구되는 박진감 넘치는 게임이며 해당하는 족보의 순위로 승패를 겨루는 비교적 간단한 게임방식을 가지고 있습니다. </p>
											<p>지역마다 규칙에 대한 차이가 많아서 기본적이며 공통적인 규칙만 적용하였습니다.</p>
											<a href="#">☞ 게임방법 자세히 보기</a></div></td>
								</tr>
								<tr>
									<td>[섯다] 게임종류에는 어떤게 있나요? </td>
								</tr>
								<tr>
									<td>[섯다] 배팅방법은 어떻게 되나요? </td>
								</tr>
								<tr>
									<td>[섯다] 2장섯다와 3장섯다의 차이는 무엇인가요? </td>
								</tr>
								<tr>
									<td>[섯다] 섯다의 족보는 무엇인가요? </td>
								</tr>
								<tr>
									<td>[섯다] 망고게임 섯다 이용안내 </td>
								</tr>
								<tr>
									<td>[섯다] 섯다 족보 중 암행어사와 망통의 승자는? </td>
								</tr>
								<tr>
									<td>[섯다] 섯다 족보 중 망통과 땡잡이의 승리자는? </td>
								</tr>
							</tbody>
						</table>
						<div class="paginate"> <a href="#" class="pre_end">처음</a> <a href="#" class="pre">이전</a> <a href="#">1</a> <strong>2</strong> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a> <a href="#">8</a> <a href="#">9</a> <a href="#">10</a> <a href="#" class="next">다음</a> <a href="#" class="next_end">끝</a> </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--#include virtual="/inc/footer.asp" -->