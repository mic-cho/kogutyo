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
						<h1 class="h1_stitle">자동결제내역조회<span class="title_coment">정기적으로 자동결제되는 회원제와 정액상품 정보를 조회하실 수 있습니다.</span></h1>
						<div class="coment_div">
							<h3 class="comnt_h3"><span class="ico arr m_t_5"></span>&nbsp;Plus 회원제</h3>
							<ul class="comnt_ul">
								<li>한게임 Plus 회원제는 매월 1일에 자동결제됩니다.</li>
								<li>가입상품 변경, 자동결제 해지예약, 옵션회원제 추가 가입 등은 한게임 Plus 페이지에서 가능합니다.</li>
								<li>[자세히]버튼을 누르시면 한게임 Plus로 이동합니다. </li>
							</ul>
						</div>
						<div class="p_20">
							<table class="lst_tbl_style1" width="100%">
								<col width="200px" />
								<col width="100px" />
								<col width="140px" />
								<col width="120px" />
								<col width="100px" />
								<thead>
									<tr>
										<th>회원제명</th>
										<th>결제수단</th>
										<th>결제금액</th>
										<th>가입일</th>
										<th>가입상태</th>
									</tr>
								</thead>
								<tbody class="nodata_tbody" style="display:none">
									<tr>
										<td colspan="5" class="nodata_tbody">해당 기간에는 망고코인 충전내역이 없습니다.</td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<td>플러스 아이템</td>
										<td>핸드폰 결제</td>
										<td>50,000 원</td>
										<td><span class="date">2015.12.25</span></td>
										<td>기간종료</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="coment_div">
							<h3 class="comnt_h3"><span class="ico arr m_t_5"></span>&nbsp;정액제</h3>
							<ul class="comnt_ul">
								<li>정기적으로 자동결제되는 정액제 상품의 가입정보를 확인하실 수 있습니다.</li>
								<li>자동결제수단 변경, 자동결제 해지예약 등은 각 정액제의 상세 페이지에서 가능합니다.</li>
								<li>[자세히]를 누르시면 상세 페이지로 이동합니다. </li>
							</ul>
						</div>
						<div class="p_20">
							<table class="lst_tbl_style1" width="100%">
								<col width="200px" />
								<col width="100px" />
								<col width="140px" />
								<col width="120px" />
								<col width="120px" />
								<col width="100px" />
								<thead>
									<tr>
										<th>정액제명</th>
										<th>결제수단</th>
										<th>결제금액</th>
										<th>가입일</th>
										<th>다음결제예정일</th>
										<th>가입상태</th>
									</tr>
								</thead>
								<tbody class="nodata_tbody" style="display:">
									<tr>
										<td colspan="6" class="nodata_tbody">해당 기간에는 망고코인 충전내역이 없습니다.</td>
									</tr>
								</tbody>
								<tbody style="display:none">
									<tr>
										<td>플러스 아이템</td>
										<td>핸드폰 결제</td>
										<td>50,000 원</td>
										<td><span class="date">2015.12.25</span></td>
										<td><span class="date">2016.1.25</span></td>
										<td>서비스중</td>
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
<!--#include virtual="/inc/footer.asp" -->
<SCRIPT type=text/javascript>
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
</SCRIPT>
</body>
</html>
