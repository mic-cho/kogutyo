<!--#include virtual="/inc/header.asp" -->
<title>::내정보::</title>
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
						<h1 class="h1_stitle">받은 쪽지함<span class="title_coment">받은 쪽지를 확인/쓰기와 쪽지 수진설정을 변경하실 수 있습니다.</span></h1>
						<div class="coment_div">
							<ul class="comnt_ul">
								<li><span class="fbo">쪽지는 받은 날짜로부터 10일이 지나면 자동 삭제</span>됩니다.</li>
								<li>주의해주세요! 운영자가 보낸 쪽지는 보낸사람이 <span class="fbo fc_FD6B00">빨간색 굵은 글씨</span>로 표시됩니다.</li>
							</ul>
							<a href="#" class="red_btn_big2 absolute blind" style="right:20px; top:14px"><span>쪽지쓰기</span></a> </div>
						<div class="p_20">
							<div class="lst_spot2">
								<p><span class="ico arr2"></span>쪽지 수신설정 - 친구에게만 받음&nbsp;<a href="#" class="btn"><span>변경</span></a></p>
								<span class="select_area"> 선택한 쪽지를 <a href="#" class="btn"><span>삭제</span></a></span></div>
							<table class="lst_tbl_style1" width="100%">
								<col width="20px" />
								<col width="110px" />
								<col width="300px" />
								<col width="100px" />
								<col width="100px" />
								<thead>
									<tr>
										<th><input type="checkbox" name="checkbox" id="checkbox">
											<label for="checkbox"></label></th>
										<th>보낸사람</th>
										<th>내용</th>
										<th>받은날짜</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody class="nodata_tbody" style="display:none">
									<tr>
										<td colspan="5" class="nodata_tbody">받은 쪽지가 없습니다.</td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<td><input type="checkbox"></td>
										<td class="cf60 fw">운영자</td>
										<td class="title"><a href="javascript:popup_window('/member/pop_memo.asp', '받은 쪽지 읽기', 'scrollbars=no,resizable=no,width=500,height=600,top=200,left=400')">제목 또는 내용 일부를 표시합니다. 한글 기준 최대 26자까지 (자동 잘림) 왜 안 잘리냐 죽을래</a></td>
										<td><span class="date">2015.12.25</span></td>
										<td class="c999 f11">읽지않음</td>
									</tr>
								</tbody>
							</table>
							<div class="memo_box">
								<h4><span class="ico i_mark"></span>쪽지를 받지 못하는 경우</h4>
								<ul>
									<li><span class="ico square"></span>쪽지를 받지 못하는 경우스팸쪽지를 막기 위해 쪽지수신 기본설정을 <span class="f_1FB6F8">"친구에게만 받음"</span>으로 지정해드리고 있습니다. </li>
									<li><span class="ico square"></span>모든 쪽지 받기를 원하실 경우 <span class="fbo">수신설정을 변경</span>하시면 됩니다. </li>
									<li><span class="ico square"></span>스팸없는 깨끗한 쪽지함을 위해, 가급적이면 쪽지를 자주 주고받는 사이끼리 "친구" 관계 맺기를 권해드립니다.</li>
								</ul>
								<h4 class="m_t_20"><span class="ico i_mark"></span>신고하기</h4>
								<ul>
									<li><span class="ico square"></span>친구 신청하러 가기신고하기도우미 또는 운영자를 사칭하는 쪽지에 주의하세요! </li>
									<li><span class="ico square"></span>도우미 사칭, 스팸 등의 불량 쪽지를 신고할 수 있습니다. </li>
								</ul>
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