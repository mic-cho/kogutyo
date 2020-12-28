<!--#include virtual="/inc/header.asp" -->
<%
if len(login_mem_id) = 0 then Call MovePage("/","MOVE","로그인 후 이용해주세요")

if sDate1 = "" then sDate1 = trim(date)
if sDate2 = "" then sDate2 = sDate1

Select Case Cint(sDateType)
Case 1
	sDate1 = trim(date)
	sDate2 = trim(date)
Case 2
	sDate1 = dateAdd("w",-1,date)
	sDate2 = trim(date)
Case 3
	sDate1 = dateAdd("m",-1,date)
	sDate2 = trim(date)
Case 4
	sDate1 = dateAdd("m",-3,date)
	sDate2 = trim(date)
Case 5
	sDate1 = dateAdd("m",-6,date)
	sDate2 = trim(date)
End Select
%>
<title>::결제내역조회::</title>
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
						<h1 class="h1_stitle">결제내역조회<span class="title_coment">고객님의 충전내역과 유료상품 구매내역을 조회하실 수 있습니다.</span></h1>
						<table class="tbl_style2" width="100%">
							<col width="160px"/>
							<col width="30%"/>
							<col width="160px"/>
							<col width="30%"/>
							<thead>
								<tr>
									<th colspan="4">내 망고코인</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>충전한 망고코인</th>
									<td><span class="fc_FD6B00 fbo f18">800</span> 원 </td>
									<th>지급받은 망고코인</th>
									<td><span class="fc_FD6B00 fbo f14">0</span> 원</td>
								</tr>
							</tbody>
							<tbody class="thead_stl">
								<tr>
									<th colspan="4">내 충전한도</th>
								</tr>
							</tbody>
							<tbody>
								<tr>
										<th>충전하신 금액</th>
										<td><span class="fc_FD6B00 fbo f14"><%=formatnumber(login_mem_charge_money,0)%></span> 원</td>
										<th>충전가능한 금액</th>
										<td><span class="fc_FD6B00 fbo f18"><%=formatnumber(login_mem_charge_money_Max,0)%></span> 원</td>
								</tr>
							</tbody>
						</table>
						<div id="tab_container" class="m_t_20">
							<ul class="tabs" persist="true">
								<li><a href="javascript:void(0);" rel="account_paylist_coin">망고코인 충전내역</a></li>
								<li><a href="javascript:void(0);" rel="account_paylist_goods">유료상품 충전내역</a></li>
								<li><a href="javascript:void(0);" rel="account_paylist_cash">현금영수증 충전내역</a></li>
							</ul>
							<div class="tabcontents">
								<div id="account_paylist_coin" class="tabcontent">
									<p class="txt_dsc"></span>망고게임의 사이버화페인 망고코인의 충전내역을 조회하실 수 있습니다.</p>
									<div class="srch_section">
										<div class="sort_area"><SPAN class="tit">조회기간</SPAN>
											<ul class="month_lst">
												<li id="search1"<%if Cint(sDateType) = 1 then%> class="selected"<%end if%>><a onClick="setCalendar(1); return false;" class="today" 
  href="?sDateType=1">오늘</a> </li>
												<li id="search2"<%if Cint(sDateType) = 2 then%> class="selected"<%end if%>><a onClick="setCalendar(2); return false;" class="week" 
  href="?sDateType=2">1주일</a> </li>
												<li id="search3"<%if Cint(sDateType) = 3 then%> class="selected"<%end if%>><a onClick="setCalendar(3); return false;" class="month" 
  href="?sDateType=3">당월</a> </li>
												<li id="search4"<%if Cint(sDateType) = 4 then%> class="selected"<%end if%>><a onClick="setCalendar(4); return false;" class="month3" 
  href="?sDateType=4">3개월</a> </li>
												<li id="search5"<%if Cint(sDateType) = 5 then%> class="selected"<%end if%>><a onClick="setCalendar(5); return false;" class="month6" 
  href="?sDateType=5">6개월</a> </li>
											</ul>
										</div>
										<div class="calendar_area">
<form action="?page_list=1" name="frmSearch" method="get"><span class="date">
											<INPUT  id="sDate1" title="조회기간 시작 날짜" class="input_txt" readOnly value="<%=sDate1%>" name="sDate1">
											<a onClick="showCalendar(1); return false;" class="ico i_calendar" href="#">달력</a></span> <span class="dashed">~</span> <span class="date">
											<INPUT  id="sDate2" title="조회기간 종료 날짜" class="input_txt" readOnly value="<%=sDate2%>" name="sDate2">
											<a onClick="showCalendar(2); return false;" class="ico i_calendar" href="#">달력</a></span> <a onClick="searchGo('chargeList'); return false;" class="btn" href="#"><span>조회하기</span></a>
											</form>
											</span>
										</div>
									</div>
									<table class="lst_tbl_style1" width="100%">
										<col width="140px" />
										<col width="200px" />
										<col width="140px" />
										<col width="120px" />
										<thead>
											<tr>
												<th>충전일자</th>
												<th>충전한 아이디</th>
												<th>결제수단</th>
												<th>충전금액</th>
											</tr>
										</thead>
										<tbody class="nodata_tbody" style="display:none">
											<tr>
												<td colspan="4" class="nodata_tbody">해당 기간에는 망고코인 충전내역이 없습니다.</td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td><span class="date"><%=replace(left(log_regist,10),"-",".")%></span></td>
												<td><%=l%></td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
 
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div id="account_paylist_goods" class="tabcontent">
									<p class="txt_dsc">망고코인, 휴대폰, 신용카드, 가상계좌 등을 통해 결제하신 유료상품 내역을 조회하실 수 있습니다.<br/>
										단, 채널링 게임에서 결제하신 내역 등 일부 내역은 표시되지 않을 수 있으며 표시되지 않은 내역에 대해서는 각 서비스의 문의절차를 이용해주시기 바랍니다.</p>
									<div class="srch_section">
										<div class="sort_area"><SPAN class="tit">조회기간</SPAN>
											<ul class="month_lst">
												<li id="search1" class="selected"><a onClick="setCalendar(1); return false;" class="today" 
  href="#">오늘</a> </li>
												<li id="search2"><a onClick="setCalendar(2); return false;" class="week" 
  href="#">1주일</a> </li>
												<li id="search3"><a onClick="setCalendar(3); return false;" class="month" 
  href="#">당월</a> </li>
												<li id="search4"><a onClick="setCalendar(4); return false;" class="month3" 
  href="#">3개월</a> </li>
												<li id="search5"><a onClick="setCalendar(5); return false;" class="month6" 
  href="#">6개월</a> </li>
											</ul>
										</div>
										<div class="calendar_area"><span class="date">
											<INPUT onFocus="showCalendar(1); return false;" id="startdt" title="조회기간 시작 날짜" class="input_txt" readOnly value="2012.05.09" name="startdt">
											<a onClick="showCalendar(1); return false;" class="ico i_calendar" href="#">달력</a></span> <span class="dashed">~</span> <span class="date">
											<INPUT onFocus="showCalendar(2); return false;" id="enddt" title="조회기간 종료 날짜" class="input_txt" readOnly value="2012.05.09" name="enddt">
											<a onClick="showCalendar(2); return false;" class="ico i_calendar" href="#">달력</a></span> <a onClick="searchGo('chargeList'); return false;" class="btn" href="#"><span>조회하기</span></a>
											
											
										</div>
									</div>
									<table class="lst_tbl_style1" width="100%">
										<col width="140px" />
										<col width="160px" />
										<col width="120px" />
										<col width="120px" />
										<col width="160px" />
										<col width="140px" />
										<thead>
											<tr>
												<th>구매일자</th>
												<th>충전한 아이디</th>
												<th>결제수단</th>
												<th>구분</th>
												<th>상품명</th>
												<th>금액</th>
											</tr>
										</thead>
										<tbody class="nodata_tbody" style="display:none">
											<tr>
												<td colspan="6" class="nodata_tbody">해당 기간에는 망고코인 충전내역이 없습니다.</td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td><span class="date">2015.12.25</span></td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div id="account_paylist_cash" class="tabcontent">
									<p class="txt_dsc">현금영수증 발급내역을 조회하고, 자동발급 신청정보를 관리하실 수 있습니다.</p>
									<div class="srch_section">
										<div class="sort_area"><SPAN class="tit">조회기간</SPAN>
											<ul class="month_lst">
												<li id="search1" class="selected"><a onClick="setCalendar(1); return false;" class="today" 
  href="#">오늘</a> </li>
												<li id="search2"><a onClick="setCalendar(2); return false;" class="week" 
  href="#">1주일</a> </li>
												<li id="search3"><a onClick="setCalendar(3); return false;" class="month" 
  href="#">당월</a> </li>
												<li id="search4"><a onClick="setCalendar(4); return false;" class="month3" 
  href="#">3개월</a> </li>
												<li id="search5"><a onClick="setCalendar(5); return false;" class="month6" 
  href="#">6개월</a> </li>
											</ul>
										</div>
										<div class="calendar_area"><span class="date">
											<INPUT onFocus="showCalendar(1); return false;" id="startdt" title="조회기간 시작 날짜" class="input_txt" readOnly value="2012.05.09" name="startdt">
											<a onClick="showCalendar(1); return false;" class="ico i_calendar" href="#">달력</a></span> <span class="dashed">~</span> <span class="date">
											<INPUT onFocus="showCalendar(2); return false;" id="enddt" title="조회기간 종료 날짜" class="input_txt" readOnly value="2012.05.09" name="enddt">
											<a onClick="showCalendar(2); return false;" class="ico i_calendar" href="#">달력</a></span> <a onClick="searchGo('chargeList'); return false;" class="btn" href="#"><span>조회하기</span></a>
											
											
										</div>
									</div>
									<table class="lst_tbl_style1" width="100%">
										<col width="120px" />
										<col width="120px" />
										<col width="140px" />
										<col width="120px" />
										<col width="100px" />
										<col width="100px" />
										<thead>
											<tr>
												<th>결제일시</th>
												<th>발급일시</th>
												<th>금액</th>
												<th>결제수단</th>
												<th>발급승인번호</th>
												<th>상태</th>
											</tr>
										</thead>
										<tbody class="nodata_tbody" style="display:none">
											<tr>
												<td colspan="6" class="nodata_tbody">해당 기간에는 망고코인 충전내역이 없습니다.</td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td><span class="date">2015.12.25</span></td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
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