<!--#include virtual="/inc/header.asp" -->
<title>::망고고스톱샵::</title>
<link rel="stylesheet" type="text/css" href="/member/css/member.css">

<!-- import for easytabs -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/js/easytabs/jquery.hashchange.min.js" type="text/javascript"></script>
<script src="/js/easytabs/tabcontent.js" type="text/javascript"></script>
<script src="/js/calendar.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready( function() {
	$('#tab_container').easytabs();
});
</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
</head>
<body>
<!--#include virtual="/inc/top.asp" -->
	<div id="container" class="container_info"> 
		<!--#include virtual="/member/inc_snb.asp" -->
		<div id="content">
			<div class="body"> 
				<!--#include virtual="/member/info.asp" -->
				<div class="body_shop">
					<div class="meminfo_div">
						<h1 class="h1_stitle">내이용제한정보<span class="title_coment">이용제한기준과 고객님의 현황을 확인하실 수 있습니다.</span></h1>
						<div id="tab_container" class="m_t_20">
							<ul class="restrict_tabs" persist="true">
								<li><a href="javascript:void(0);" rel="restrict_div1">
									<p>채팅/글쓰기 제한</p>
									<em>정상이용중</em> </a></li>
								<li><a href="javascript:void(0);" rel="restrict_div2">
									<p>회원정보/로그인 제한</p>
									<em>정상이용중</em> </a></li>
								<li><a href="javascript:void(0);" rel="restrict_div3">
									<p>일부게임 제한</p>
									<em>정상이용중</em> </a></li>
								<li><a href="javascript:void(0);" rel="restrict_div4">
									<p>포커류 제한</p>
									<em class="limit">이용제한중</em> </a></li>
								<li><a href="javascript:void(0);" rel="restrict_div5">
									<p>고스톱류 제한</p>
									<em>정상이용중</em> </a></li>
								<li><a href="javascript:void(0);" rel="restrict_div6">
									<p>바둑/장기 제한</p>
									<em>정상이용중</em> </a></li>
							</ul>
							<div class="restrict_tabcontents">
								<h4>제한내용</h4>
								<div id="restrict_div1" class="restrict_tabcontent">
									<ul>
										<li><span class="ico square"></span>게임 내 채팅, 쪽지, 게시판 글쓰기를 하실 수 없으며, 로그인을 비롯한 게임 이용은 가능합니다. </li>
										<li><span class="ico square"></span>최종 이용제한 일로부터 6개월 동안 추가 제한 없으면 차수 누적이 초기화됩니다. </li>
									</ul>
									<h3><span class="ico arr m_r_10"></span>이용제한기준</h3>
									<table class="lst_tbl_style2" width="100%">
										<col width="180px;"/>
										<col width=""/>
										<colgroup>
										<col width="70px;"/>
										<col width="70px;"/>
										<col width="70px;"/>
										<col width="70px;"/>
										<col width="70px;"/>
										</colgroup>
										
										<thead>
											<tr>
												<th rowspan="2">제한사유</th>
												<th rowspan="2">상세내용</th>
												<th colspan="5">이용제한내용</th>
											</tr>
											<tr>
												<th>1차</th>
												<th>2차</th>
												<th>3차</th>
												<th>4차</th>
												<th>5차</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>비매너 채팅/글쓰기</td>
												<td>욕설, 도배, 성적비하/폭언,<br>
													타인비방/인격모독, 권리침해,<br>
													반사회/비윤리적 내용,<br>
													허위사실 유포, 개인정보 유출</td>
												<td>1일 쓰기제한</td>
												<td>7일 쓰기제한</td>
												<td>1개월 쓰기제한</td>
												<td>3개월 쓰기제한</td>
												<td>6개월 쓰기제한</td>
											</tr>
											<tr>
												<td>상업성 채팅/글쓰기</td>
												<td>각종 매매 및 유도 행위</td>
												<td colspan="5">6개월 쓰기제한 </td>
											</tr>
										</tbody>
									</table>
									<h3><span class="ico arr m_r_10"></span>최근 6개월간 나의 제한내역</h3>
									<table class="lst_tbl_style2" width="100%">
										<col width="180px;"/>										
										<col width="200px;"/>
										<col width="300px;"/>
										<thead>
											<tr>
												<th>처리일</th>
												<th>서비스</th>
												<th>제한사유</th>
											</tr>
										</thead>
										<tbody class="nodata_tbody">
											<tr>
												<td colspan="3">이용제한내역이 없습니다.</td>
											</tr>
										</tbody>
										<tbody style="display:none">
											<tr>
												<td><div class="date">2015.08.08 13:26:03</div></td>
												<td>라스베가스포커</td>
												<td>비정상적인 이용</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div id="restrict_div2" class="restrict_tabcontent">
									<ul>
										<li><span class="ico square"></span>망고한게임 로그인이 제한되거나, 아이디가 삭제될 수 있습니다. (별명이 문제될 경우 초기화) </li>
										<li><span class="ico square"></span>부적합한 별명 사용이 2회 이상 확인될 경우, 별명을 수정할 수 없으며 기본 별명을 사용하셔야 합니다. </li>
									</ul>
									<h3><span class="ico arr m_r_10"></span>이용제한기준</h3>
									<table class="lst_tbl_style2" width="100%">
										<col width="130px;"/>
										<col width="300px"/>
										<colgroup>										
										<col width="160px;"/>
										<col width="160px;"/>
										</colgroup>
										
										<thead>
											<tr>
												<th rowspan="2">제한사유</th>
												<th rowspan="2">상세내용</th>
												<th colspan="2">이용제한내용</th>
											</tr>
											<tr>
												<th>1차</th>
												<th>2차</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>부적합한 별명</td>
												<td>부적합한 별명 사용</td>
												<td>별명 초기화 (수정가능)</td>
												<td>별명 초기화 (수정불가)</td>
											</tr>
											<tr>
												<td>조사</td>
												<td>이용제한행위 의심되어 상세 조사가 필요한 경우</td>
												<td colspan="2">조사완료시까지 로그인제한</td>
											</tr>
											<tr>
												<td>아이디보호</td>
												<td>로그인 도용 피해로 의심되는 경우</td>
												<td colspan="2">본인확인시까지 로그인제한</td>
											</tr>
											<tr>
												<td>개인정보/결제정보<BR>
												도용</td>
												<td>타인의 개인정보 및 결제정보 도용 행위</td>
												<td colspan="2">1년 로그인 제한 후 아이디 삭제<BR>
												(보유 아이디 전체제한 / 동일정보 가입 제한)</td>
											</tr>
											<tr>
												<td>아이디 도용/가담</td>
												<td>타인의 개인정보 또는 아이디를 이용하여<BR>
													게임머니, 게임아이템 등을 생산/획득하는<BR>
												행위 및 이에 가담하는 행위</td>
												<td colspan="2">1년 로그인 제한 후 아이디 삭제<BR>
												(보유 아이디 전체제한 / 동일정보 가입 제한)</td>
											</tr>
										</tbody>
									</table>
									<h3><span class="ico arr m_r_10"></span>최근 1년간 나의 제한내역</h3>
									<table class="lst_tbl_style2" width="100%">
										<col width="180px;"/>										
										<col width="200px;"/>
										<col width="300px;"/>
										<thead>
											<tr>
												<th>처리일</th>
												<th>서비스</th>
												<th>제한사유</th>
											</tr>
										</thead>
										<tbody class="nodata_tbody">
											<tr>
												<td colspan="3">이용제한내역이 없습니다.</td>
											</tr>
										</tbody>
										<tbody style="display:none">
											<tr>
												<td><div class="date">2015.08.08 13:26:03</div></td>
												<td>라스베가스포커</td>
												<td>비정상적인 이용</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div id="restrict_div3" class="restrict_tabcontent">
									<ul>
										<li><span class="ico square"></span>이용제한게임 : 고스톱, 포커, 바둑/장기, 사천성, 오목, 신윷놀이 </li>
										<li><span class="ico square"></span>최종 이용제한 일로부터 1년 동안 추가 제한 없으면 차수 누적이 초기화됩니다. </li>
									</ul>
									<h3><span class="ico arr m_r_10"></span>이용제한기준</h3>
									<table class="lst_tbl_style2" width="100%">
										<col width="130px;"/>
										<col width="300px"/>
										<colgroup>										
										<col width="120px;"/>
										<col width="120px;"/>
										<col width="120px;"/>
										</colgroup>
										
										<thead>
											<tr>
												<th rowspan="2">제한사유</th>
												<th rowspan="2">상세내용</th>
												<th colspan="3">이용제한내용</th>
											</tr>
											<tr>
												<th>1차</th>
												<th>2차</th>
												<th>3차</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>비정상적인 게임이용</td>
												<td>게임진행을 방해하거나 비정상적인<BR>
													방법으로 게임을 진행하여 게임머니,<BR>
												경험치 등에 영향을 주는 행위</td>
												<td colspan="3">7일 게임제한</td>
											</tr>
											<tr>
												<td rowspan="2">사기/사칭</td>
												<td>사기 시도</td>
												<td>7일 게임제한</td>
												<td>1개월 게임제한</td>
												<td>1년게임 제한</td>
											</tr>
											<tr>
												<td>사기 확인 / 운영자 사칭</td>
												<td colspan="3">1년 게임제한 (동일정보 아이디 모두 제한)</td>
											</tr>
											<tr>
												<td rowspan="2">오류/버그 악용</td>
												<td>우발/단순</td>
												<td>3개월 게임제한</td>
												<td colspan="2">1년 게임제한</td>
											</tr>
											<tr>
												<td>의도/반복</td>
												<td colspan="3">1년 게임제한 (동일정보 아이디 모두 제한)</td>
											</tr>
											<tr>
												<td>비공식프로그램 사용</td>
												<td>비공식/불법 프로그램 유포/사용 및<BR>
												데이터 조작</td>
												<td colspan="3">1년 게임제한 (동일정보 아이디 모두 제한)</td>
											</tr>
											<tr>
												<td>현금거래</td>
												<td>캐릭터, 아이템, 게임머니 등을 환전 또는<BR>
												환전 알선하거나 재매입하는 행위</td>
												<td colspan="3">1년 게임제한 (동일정보 아이디 모두 제한)</td>
											</tr>
										</tbody>
									</table>
									<h3><span class="ico arr m_r_10"></span>최근 1년간 나의 제한내역</h3>
									<table class="lst_tbl_style2" width="100%">
										<col width="180px;"/>										
										<col width="200px;"/>
										<col width="300px;"/>
										<thead>
											<tr>
												<th>처리일</th>
												<th>서비스</th>
												<th>제한사유</th>
											</tr>
										</thead>
										<tbody class="nodata_tbody">
											<tr>
												<td colspan="3">이용제한내역이 없습니다.</td>
											</tr>
										</tbody>
										<tbody style="display:none">
											<tr>
												<td><div class="date">2015.08.08 13:26:03</div></td>
												<td>라스베가스포커</td>
												<td>비정상적인 이용</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div id="restrict_div4" class="restrict_tabcontent">
									<ul>
										<li><span class="ico square"></span>2016년 08월 08일 14시 해제될 예정입니다. </li>
										<li><span class="ico square"></span>포커류 게임 이용과 유료서비스 구매 및 머니 교환/충전이 제한됩니다. </li>
										<li><span class="ico square"></span>포커류를 제외한 다른 게임은 모두 이용하실 수 있습니다. </li>
									</ul>
									<h3><span class="ico arr m_r_10"></span>이용제한기준</h3>
									<table class="lst_tbl_style2" width="100%">
										<col width="130px;"/>
										<col width="300px"/>
										<colgroup>										
										<col width="120px;"/>
										<col width="120px;"/>
										<col width="120px;"/>
										</colgroup>
										
										<thead>
											<tr>
												<th rowspan="2">제한사유</th>
												<th rowspan="2">상세내용</th>
												<th colspan="3">이용제한내용</th>
											</tr>
											<tr>
												<th>1차</th>
												<th>2차</th>
												<th>3차</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>게임중 강제종료</td>
												<td>강제로 게임을 종료/도주하는 등의<BR>
												비정상적 접속해제 행위</td>
												<td>경고<BR>
												(베팅머니 승자획득)</td>
												<td>경고<BR>
												(베팅머니 승자획득)</td>
												<td>1일 포커게임제한<BR>
												(베팅머니 승자획득)</td>
											</tr>
											<tr>
												<td>비정상적인 게임이용</td>
												<td>비정상적인 방법으로 <BR>
													게임을 진행하는 행위<BR>
													<UL>
														<LI>①최소 2명 이상이 접속지역에 관계없이 특정시간 함께 게임을 지속하며 승패에 영향을 줄 경우 (예: 짜고치기)   
														<LI>②최소 2명 이상이 방을 옮겨 다니며 여러 아이디로 번갈아 게임을 하는 경우   
														<LI>③최소 2명 이상이 정상적이지 않은 룰을 통해 게임을 지속하는 경우<BR>
															(예: 삥콜 / 전적작업)   
														<LI>④최소 2명 이상이 임의 베팅 룰에서<BR>
															게임을 지속하는 경우 </LI>
													</UL>
												다른 이용자가 비정상적 게임진행을 통해 획득한   게임머니를 받거나 제공하는 행위</td>
												<td colspan="3">1년 포커 게임제한<BR>
												(게임등급 1단계 강등 / 동일정보 아이디 모두 제한)</td>
											</tr>
											<tr>
												<td>머니매매/매매유도 행위</td>
												<td>게임머니 매매, 교환 목적의<BR>
												게임이용 및 홍보 행위</td>
												<td colspan="3">1년 포커 게임제한<BR>
												(게임등급 1단계 강등 / 동일정보 아이디 모두 제한)</td>
											</tr>
										</tbody>
									</table>
									<div class="m_tb_5 lh14 f11 fc_06f"><span class="ico i_mark"></span>게임중 강제종료는 1일동안 추가 제한 없으면 차수 누적이 초기화됩니다.</div>
									<h3><span class="ico arr m_r_10"></span>최근 1년간 나의 제한내역</h3>
									<table class="lst_tbl_style2" width="100%">
										<col width="180px;"/>										
										<col width="200px;"/>
										<col width="300px;"/>
										<thead>
											<tr>
												<th>처리일</th>
												<th>서비스</th>
												<th>제한사유</th>
											</tr>
										</thead>
										<tbody class="nodata_tbody">
											<tr>
												<td colspan="3">이용제한내역이 없습니다.</td>
											</tr>
										</tbody>
										<tbody style="display:none">
											<tr>
												<td><div class="date">2015.08.08 13:26:03</div></td>
												<td>라스베가스포커</td>
												<td>비정상적인 이용</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div id="restrict_div5" class="restrict_tabcontent">
									<ul>
										<li><span class="ico square"></span>고스톱류 게임 이용과 유료서비스 구매 및 머니 교환/충전이 제한됩니다. </li>
										<li><span class="ico square"></span>고스톱류를 제외한 다른 게임은 모두 이용하실 수 있습니다. </li>
									</ul>
									<h3><span class="ico arr m_r_10"></span>이용제한기준</h3>
									<table class="lst_tbl_style2" width="100%">
										<col width="130px;"/>
										<col width="300px"/>										
										<col width="400px;"/>
										<thead>
											<tr>
												<th>제한사유</th>
												<th>상세내용</th>
												<th>이용제한내용</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>비정상적인 게임이용</td>
												<td><ul>
													<LI>① 비정상적인 방법으로 게임을 진행하는 행위   
													<LI>② 다른 이용자가 비정상적 게임진행을 통해 획득한 게임머니를 받거나 제공하는 행위 </LI>
												</ul></td>
												<td>1년 고스톱 게임제한<BR>
												(게임등급 1단계 강등 / 동일정보 아이디 모두 제한)</td>
											</tr>
											<tr>
												<td>머니매매/매매유도 행위</td>
												<td>게임머니 매매, 교환 목적의
												게임이용 및 홍보 행위</td>
												<td>1년 고스톱게임제한<BR>
												(게임등급 1단계 강등 / 동일정보 아이디 모두 제한)</td>
											</tr>
										</tbody>
									</table>
									<h3><span class="ico arr m_r_10"></span>최근 1년간 나의 제한내역</h3>
									<table class="lst_tbl_style2" width="100%">
										<col width="180px;"/>										
										<col width="200px;"/>
										<col width="300px;"/>
										<thead>
											<tr>
												<th>처리일</th>
												<th>서비스</th>
												<th>제한사유</th>
											</tr>
										</thead>
										<tbody class="nodata_tbody">
											<tr>
												<td colspan="3">이용제한내역이 없습니다.</td>
											</tr>
										</tbody>
										<tbody style="display:none">
											<tr>
												<td><div class="date">2015.08.08 13:26:03</div></td>
												<td>라스베가스포커</td>
												<td>비정상적인 이용</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div id="restrict_div6" class="restrict_tabcontent">
									<ul>
										<li><span class="ico square"></span>바둑과 장기 게임 이용과 유료서비스 구매 및 머니 교환/충전이 제한됩니다. </li>
										<li><span class="ico square"></span>바둑과 장기 게임을 제외한 다른 게임은 모두 이용하실 수 있습니다. </li>
									</ul>
									<h3><span class="ico arr m_r_10"></span>이용제한기준</h3>
									<table class="lst_tbl_style2" width="100%">
										<col width="130px;"/>
										<col width="300px"/>
										<colgroup>										
										<col width="80px;"/>
										<col width="80px;"/>
										<col width="80px;"/>
										<col width="80px;"/>
										</colgroup>
										
										<thead>
											<tr>
												<th rowspan="2">제한사유</th>
												<th rowspan="2">상세내용</th>
												<th colspan="4">이용제한내용</th>
											</tr>
											<tr>
												<th>1차</th>
												<th>2차</th>
												<th>3차</th>
												<th>4차</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>게임진행방해</td>
												<td><ul>
													<LI>① 계가진행 중 사석이나 공배를 불량하게 지정하는 행위   
													<LI>② 특별한 사유없이 계가신청(대국이 완료된 상황)을<BR>
														지속적으로 거부하여 계가진행을 방해하는 행위   
													<LI>③ 대국이 마무리된 상황에서 고의적인 착수포기로<BR>
														시간패를 유도하는 행위   
													<LI>④ 대국 중 승패와 무관한 비정상적인 착수를 하는 경우   
													<LI>⑤ 대국진행 상황에서 고의적으로 착수를 포기하는 행위   
													<LI>⑥ 고의 기권으로 대국진행을 방해하는 행위(11수~)   
													<LI>⑦ 대국진행 상황에서 계가신청을 하여 자동계가로<BR>
														종료시키는 행위 </LI>
												</ul></td>
												<td>7일 바둑/<BR>
													장기 게임<BR>
												제한</td>
												<td>1개월 바둑/<BR>
													장기 게임<BR>
												제한</td>
												<td>1년 바둑/<BR>
													장기 게임<BR>
												제한</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>무성의대국<BR>
												(9단이상)</td>
												<td>베팅대국자 의무조항을 위배하는 경우</td>
												<td>경고</td>
												<td>7일 베팅<BR>
												대국 제한</td>
												<td>1개월 베팅<BR>
												대국 제한</td>
												<td>영구 베
												대국 제한</td>
											</tr>
											<tr>
												<td>허위급수</td>
												<td><ul>
													<LI>① 고의기권으로 실기력보다 낮게 기력을 설정하는 행위   
													<LI>② 급수재설정 아이템을 남용하여 실기력보다 낮게<BR>
														기력을 설정하는 행위   
													<LI>③ 머니를 획득할 목적으로 실기력보다 낮게 기력을<BR>
														설정하여 대국(친선, 승강)을 하는 행위   
													<LI>④ 실제 기력보다 낮게 설정하여 승률을 높이는 행위(과시용) </LI>
												</ul></td>
												<td>개월 바둑/<BR>
													장기 게임<BR>
													제한 (보유<BR>
													머니 전액<BR>
												회수)</td>
												<td colspan="3">1년 바둑/장기 게임제한<BR>
												(보유머니 전액회수)</td>
											</tr>
											<tr>
												<td>작전대국</td>
												<td><ul>
													<LI>① 대국자간의 실력이 아닌 그외 다른 방법을 통하여<BR>
														승패를 고의적으로 조작하는 행위 및 그러한 대국에서<BR>
														부당한 이득을 취하는   모든 행위   
													<LI>② 배당률을 조작하여 이득을 취하는 모든 행위 </LI>
												</ul></td>
												<td colspan="4">1년 바둑/장기 게임제한<BR>
												(보유머니 전액회수 / 동일정보 모두 제한)</td>
											</tr>
											<tr>
												<td>조작승단<BR>
												(9단이상)</td>
												<td>비정상적인 기권승으로 승급 또는 승단한 자</td>
												<td colspan="4">1년 바둑/장기 게임제한<BR>
												(보유머니 전액회수 / 동일정보 모두 제한)</td>
											</tr>
											<tr>
												<td>조작승단<BR>
												(8단이하)</td>
												<td>비정상적인 기권승으로 승급 또는 승단한 자</td>
												<td>1개월 바둑/<BR>
													장기 게임<BR>
												제한</td>
												<td>3개월 바둑/<BR>
													장기 게임<BR>
												제한</td>
												<td colspan="2">1년 바둑/장기 게임제한</td>
											</tr>
											<tr>
												<td>머니 이전</td>
												<td><ul>
													<LI>① 내기대국에서 고의적인 기권을 통한 머니이전<BR>
														(머니를 받은 아이디와 준 아이디 동일 처리)   
													<LI>② 작전대국으로 처벌된 아이디와 연관이 있는 경우<BR>
														1년 정지 및 보유 머니 전액 회수 </LI>
												</ul></td>
												<td>1일 바둑/<BR>
													장기 게임<BR>
												제한</td>
												<td colspan="3">3일 바둑/장기 게임제한</td>
											</tr>
											<tr>
												<td>머니매매/매매유도 행위</td>
												<td>게임머니 매매, 교환 목적의 게임이용 및 홍보 행위</td>
												<td colspan="4">1년 바둑/장기 게임 이용제한 (동일정보 아이디 모두 제한)</td>
											</tr>
											<tr>
												<td>허위신고/운영방해</td>
												<td><ul>
													<LI>①자동계가로 정상적으로 종료되었으나 허위로 승패정정요청을 하는 경우 (허위신고에 따른 사항은 운영진의 판단에 따름)   
													<LI>②악의적인 목적으로 동일한 질문을 반목하는 행위 (멀티계정 또는 타인의 계정을 차용한 질문 반복 포함)   
													<LI>③특별한 사유없는 게임/운영자에 대한 비방 행위   
													<LI>④확인되지 않는 사항에 대한 반복적인 신고 </LI>
												</ul></td>
												<td colspan="4">1일 바둑/장기 게임제한</td>
											</tr>
											<tr>
												<td>분쟁유발</td>
												<td>회원간 분쟁(정치, 지역감정, 사회적 논쟁거리)를 유발<BR>
													하는 채팅을 통해 회원들에게 불쾌감을 주는 경우<BR>
												(*기타에 따른 사항은   운영진의 판단에 따름)</td>
												<td colspan="4">180분 바둑/장기 채팅제한</td>
											</tr>
										</tbody>
									</table>
									<div class="m_tb_5 lh14 f11 fc_06f"><span class="ico i_mark"></span>게임중 강제종료는 1일동안 추가 제한 없으면 차수 누적이 초기화됩니다.</div>
									<div class="m_tb_5 lh14 f11 fc_06f"><span class="ico i_mark"></span>무성의대국(9단이상)과 분쟁유발 제한은 게임 진입시 확인하실 수 있습니다. </div>
									<h3><span class="ico arr m_r_10"></span>최근 1년간 나의 제한내역</h3>
									<table class="lst_tbl_style2" width="100%">
										<col width="180px;"/>										
										<col width="200px;"/>
										<col width="300px;"/>
										<thead>
											<tr>
												<th>처리일</th>
												<th>서비스</th>
												<th>제한사유</th>
											</tr>
										</thead>
										<tbody class="nodata_tbody">
											<tr>
												<td colspan="3">이용제한내역이 없습니다.</td>
											</tr>
										</tbody>
										<tbody style="display:none">
											<tr>
												<td><div class="date">2015.08.08 13:26:03</div></td>
												<td>라스베가스포커</td>
												<td>비정상적인 이용</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">

	var selectedBttn;
	var searchPeriodNo = '3';
	var oCalendar1;
	var oCalendar2;
	var curPage = 1;

	function showLayer(num) {
		$j('#coinDiv' + num).show();
	}
	
	function closeLayer(num) {
		$j('#coinDiv' + num).hide();
	}
	
	function showCalendar(num) {
		for (i = 1; i <= 2; i++) {
			if (i == num) {
				if (document.getElementById("calendar" + num).style.display == "none") {
					document.getElementById("calendar" + num).style.display = "";
				} else {
					document.getElementById("calendar" + num).style.display = "none";
				}
			} else {
				document.getElementById("calendar" + i).style.display = "none";
			}
		}
	}
	
	function setCalendar(num) {
		if (num < 1 || num > 5) {
			return;
		}
		
		if (selectedBttn) {
			selectedBttn.removeClass('selected');
		}
		selectedBttn = $j('#search' + num);
		selectedBttn.addClass('selected');
		
		var curDay = new C.DateTime();
		
		if (num == 1) {
			oCalendar2.select(curDay.getYear(), curDay.getMonth(), curDay.getDate());
			oCalendar1.select(curDay.getYear(), curDay.getMonth(), curDay.getDate());
		} else if (num == 2) {
			oCalendar2.select(curDay.getYear(), curDay.getMonth(), curDay.getDate());
			curDay.addDate(-7);
			oCalendar1.select(curDay.getYear(), curDay.getMonth(), curDay.getDate());
		} else if (num == 3) {
			oCalendar2.select(curDay.getYear(), curDay.getMonth(), curDay.getDate());
			curDay.setDate(1);
			oCalendar1.select(curDay.getYear(), curDay.getMonth(), curDay.getDate());
		} else if (num == 4) {
			oCalendar2.select(curDay.getYear(), curDay.getMonth(), curDay.getDate());
			curDay.addMonth(-3);
			oCalendar1.select(curDay.getYear(), curDay.getMonth(), curDay.getDate());
		} else if (num == 5) {
			oCalendar2.select(curDay.getYear(), curDay.getMonth(), curDay.getDate());
			curDay.addMonth(-6);
			oCalendar1.select(curDay.getYear(), curDay.getMonth(), curDay.getDate());					
		}
		searchPeriodNo = num;
	}
	
	var upperDay = new C.DateTime(); // 당일까지만 선택 가능

	var lowerDay = new C.DateTime(); // 1년 전 까지만 선택 가능
	lowerDay.addYear(-1);
	
	function searchGo(m) {
		var startDt = $j('#startdt').val();
		var endDt = $j('#enddt').val();
		
		var startDtVal = startDt.replace(/\./g, "");
		var endDtVal = endDt.replace(/\./g, "");
		
		if (endDtVal < startDtVal) {
			alert("시작일자가 종료일자보다 큽니다.")
			return;
		}
		
		if (endDtVal - startDtVal > 1200) {// 년도가 다른 경우
			endDtVal = endDtVal - 10000 + 1200;
		}
		
		if (endDtVal - startDtVal > 600) { // 6개월 기간만 조회
			
			alert("한 번에 최대 6개월까지 조회 가능합니다.");
			return;
		}
		
		location.href = "/myinfo/account.nhn?m=" + m + "&startDt=" + startDt + "&endDt=" + endDt + "&searchPeriodNo=" + searchPeriodNo;
	}
	
	function goReverse(m) {
		var reverse = 'Y';
		if ('N' == 'Y') {
			reverse = 'N';
		}
		var startDt = $j('#startdt').val();
		var endDt = $j('#enddt').val();
		location.href = "/myinfo/account.nhn?m=" + m + "&startDt=" + startDt + "&endDt=" + endDt + "&searchPeriodNo=" + searchPeriodNo +"&reverse=" + reverse + "&page=" + curPage;
	}
	
	function showInfo(page) {
		var totSize = 0;
		for (i = 1; i <= totSize; i++) {
			if (i == page) {
				$j('#show' + i).show();
			} else {
				$j('#show' + i).hide();
			}
		}
	}
	
	function showPage(page) {
		var totSize = 0;
		if (page > totSize || page < 1) {
			return;
		}
		curPage = page;
		showInfo(page);
		
		var firstStr = "<a href=\"#\" class=\"frst\" onclick=\"showPage(1); return false;\">처음페이지</a>";
		var preStr = "<a href=\"#\" class=\"pre\" onclick=\"showPage(" + (page - 1) + "); return false;\">이전페이지</a>";
		var nextStr = "<a href=\"#\" class=\"next\" onclick=\"showPage(" + (page + 1) + "); return false;\">다음페이지</a>";
		var lastStr = "<a href=\"#\" class=\"last\" onclick=\"showPage(0); return false;\">마지막페이지</a>";

		var _html = "";
		
		var endIndex = totSize;
		var firstIndex = 1;
		if (totSize > 10) {
			if (page + 5 > totSize) {
				endIndex = totSize;
			} else if (page - 5 < 1) {
				endIndex = 10; 
			} else {
				endIndex = page + 4;
			}
			firstIndex = endIndex - 9;
		}
		
		for (i = firstIndex; i <= endIndex; i++) {
			if (i == page) {
				_html += "<strong>" + i + "</strong>"; 
			} else {
				_html += "<a href=\"#\" onclick=\"showPage(" + i + "); return false;\">" + i + "</a>";
			}
		}
		_html = firstStr + preStr + _html + nextStr + lastStr;
		$j('#pageDiv').html(_html);
	}
	
	function resizeSelf() {
		var outline = document.getElementById("content");
		
		height = outline.offsetHeight;
		
		if (height < 689) {
			height = 689;
		}
		
		parentIframe = parent.document.getElementById("myinfoIframe");
		parentIframe.height = height;
	}
	
	function openWinOverride(url, name, width, height) {
		var _thisUrl = url + "&RURL=" + escape(document.location.href);
		
		var x = (screen.width - width) / 2;
		var y = (screen.height - height) / 2;
		
		var sOption = "toolbar=no, channelmode=no, location=no, directories=no, menubar=no";
		sOption = sOption + ", scrollbars=no, left=" + x + ", top=" + y + ", width=" + width + ", height=" + height;
		window.open(_thisUrl, name, sOption);
	}

	C.addOnReady( function() {
		var startCalObj = {};
		var endCalObj = {}
		
		startCalObj.year = "2015";
		startCalObj.month = "10";
		startCalObj.day = "01";
		
		endCalObj.year = "2015";
		endCalObj.month = "10";
		endCalObj.day = "21";
		
		
		$j('#startdt').val(startCalObj.year + "." + startCalObj.month + "." + startCalObj.day);
		$j('#enddt').val(endCalObj.year + "." + endCalObj.month + "." + endCalObj.day);
		
		oCalendar1 = new Calendar($j('#calendar1'), startCalObj.year, startCalObj.month, startCalObj.day);
    	oCalendar1.setOnSelect(function(y, m, d) {
	    		var year = y;
				var mon = (m < 10) ? "0" + m : m;
	 			var day = (d < 10) ? "0" + d : d;

				$j('#startdt').val(year + "." + mon + "." + day);
				$j('#calendar1').hide();
				searchPeriodNo = 0; // 조회기간버튼 초기화
	    });
    	oCalendar1.setLowerbound(lowerDay);
    	oCalendar1.setUpperbound(upperDay);
     	oCalendar1.paint();
     	
     	oCalendar2 = new Calendar($j('#calendar2'), endCalObj.year, endCalObj.month, endCalObj.day);
    	oCalendar2.setOnSelect(function(y, m, d) {
	    		var year = y;
				var mon = (m < 10) ? "0" + m : m;
	 			var day = (d < 10) ? "0" + d : d;

				$j('#enddt').val(year + "." + mon + "." + day);
				$j('#calendar2').hide();
				searchPeriodNo = 0; // 조회기간버튼 초기화
	    });
    	oCalendar2.setLowerbound(lowerDay);
    	oCalendar2.setUpperbound(upperDay);
     	oCalendar2.paint();
     	
     	
     	setCalendar(3);
     	
     	
     	showPage(1);
     	resizeSelf();
	});
</script> 
	<!--#include virtual="/inc/footer.asp" -->