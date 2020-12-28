<!--#include virtual="/inc/header.asp" -->
<title>::망고고스톱샵::</title>
<link rel="stylesheet" type="text/css" href="/cs/css/cs.css">

<!-- import for easytabs -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/js/easytabs/jquery.hashchange.min.js" type="text/javascript"></script>
<script src="/js/easytabs/tabcontent.js" type="text/javascript"></script>
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
						<h1 class="h1_stitle">내 문의내역<span class="title_coment">고객님의 문의/신고 내역과 계정정지내역을 조회하실 수 있습니다.</span></h1>
						<div id="tab_container" class="m_t_20">
							<ul class="tabs" persist="true">
								<li><a href="javascript:void(0);" rel="account_paylist_coin">내 문의내역</a></li>
								<li><a href="javascript:void(0);" rel="account_paylist_goods">내 신고내역</a></li>
								<li><a href="javascript:void(0);" rel="account_paylist_cash">내 계정 정지내역</a></li>
							</ul>
							<div class="tabcontents">
								<div id="account_paylist_coin" class="tabcontent">
									<p class="my_inqury_txt">고객님께서 문의하신 내용과 답변을 확인하실 수 있습니다.<br/>
										답변이 완료된 질문은 고객님께서 <span class="fc_f00">열람하신 후 7일 이내에 자동으로 삭제</span>됩니다. </p>
									
                <table class="lst_tbl_style1" width="100%">
                  <col width="80px" />
                  <col width="260px" />
                  <col width="100px" />
                  <col width="100px" />
                  <col width="60px" />
                  <thead>
                    <tr> 
                      <th>번호</th>
                      <th>제목</th>
                      <th>처리상태</th>
                      <th>문의일자</th>
                      <th><input type="checkbox" name="checkbox" id="checkbox"> 
                        <label for="checkbox">삭제</label> </th>
                    </tr>
                  </thead>
                  <!--문의내역없을시-->
                  <%

	itemSQL = "*"
	
	' 검색할 테이블
	tableSQL = "board_body"
	' 정렬 쿼리
	OrderSQL = "bb_idx Desc"
	' 한화면에 보여줄 페이징 리스트
	ViewPageCount = 20
	' 현재 페이지의 페이지 리스트 쿼리명
	PageNumberQuery = "page_list"
	
	Set DBConn = new XTclsDbConn

	' SQL 검색 쿼리
	WhereSQL = " bh_idx = 4 And mem_idx = ?"
	Call DBConn.AddParam("mem_idx", login_mem_idx )
	
	Set Rs = DBConn.RSPaging(itemSQL, tableSQL, WhereSQL, OrderSQL, ViewPageCount, PageNumberQuery)
	PrintPaging = DBConn.PrintPaging
	NowRecordNum = DBConn.GetIndexDesc
	GetTotalPage = DBConn.GetTotalPage
	DBConn.DbClose
	Set DBConn = nothing
	if  rs.Eof Then
%>
                  <tbody class="nodata_tbody" style="display:">
                    <tr> 
                      <td colspan="5" class="nodata_tbody">문의하신 내역이 없습니다.</td>
                    </tr>
                  </tbody>
                  <%
	else
%>
                  <!--문의내역있을시-->
                  <tbody>
<%
		RSCnt = RS.Fields.Count    '필드의 갯수
		PrintNumber = NowRecordNum + 1
		Do Until rs.Eof 
			for i = 0 to RSCnt - 1
				obj_name = RS.fields(i).name
				Execute(obj_name & " = RS(" & i & ")")
			Next
			PrintNumber = PrintNumber - 1
			rs.movenext		
			p_regist = replace(mid(bb_regist,1,10),"-",".")
			if len(bb_re_Regist) > 0 then
				p_status = "답변완료"
			elseif bb_check = 1 then
				p_status = "확인중"
			else
				p_status = "접수중"
			end if
%>
                    <tr> 
                      <td> 
                        <%=PrintNumber%>
                      </td>
                      <td> 
                        <span style="cursor:pointer" onClick="$('#bb_<%=bb_idx%>').toggle()"><%=bb_title%></span>
                      </td>
                      <td> 
                        <%=p_status%>
                      </td>
                      <td><span class="date"> 
                        <%=p_regist%>
                        </span></td>
                      <td><input type="checkbox" name="checkbox2" id="checkbox2"> 
                        <label for="checkbox2">삭제</label></td>
                    </tr>
                    <tr id="bb_<%=bb_idx%>" style="display:none"> 
                      <td colspan="5">문의 내용 : <br><%=replaceBR(bb_content)%>
					  <%if len(bb_re_Regist) > 0 then%>
					  <br><br>답변내용 : <br><%=bb_re_content%>
					  <%end if%>
					  </td>
                    </tr>
                    <%

		Loop
	End if
%>
                  </tbody>
                </table>
									<%=Edit_Paging("page_list",GetTotalPage)%>
								</div>
								<div id="account_paylist_goods" class="tabcontent">
									<p class="my_inqury_txt">고객님께서 문의하신 내용과 답변을 확인하실 수 있습니다.<br/>
										신고하신 내용은 처리상태에 따라 신고취소가 가능하며, 신고취소 시에는 본인인증 절차를 거치게 됩니다. </p>
									<table class="lst_tbl_style1" width="100%">
										<col width="80px" />
										<col width="320px" />
										<col width="100px" />
										<col width="100px" />
										<thead>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>처리상태</th>
												<th>신고일자</th>
											</tr>
										</thead>
										<!--문의내역없을시-->
                  <%

	itemSQL = "*"
	
	' 검색할 테이블
	tableSQL = "board_body"
	' 정렬 쿼리
	OrderSQL = "bb_idx Desc"
	' 한화면에 보여줄 페이징 리스트
	ViewPageCount = 20
	' 현재 페이지의 페이지 리스트 쿼리명
	PageNumberQuery = "page_list2"
	
	Set DBConn = new XTclsDbConn

	' SQL 검색 쿼리
	WhereSQL = " bh_idx = 5 And mem_idx = ?"
	Call DBConn.AddParam("mem_idx", login_mem_idx )
	
	Set Rs = DBConn.RSPaging(itemSQL, tableSQL, WhereSQL, OrderSQL, ViewPageCount, PageNumberQuery)
	PrintPaging = DBConn.PrintPaging
	NowRecordNum = DBConn.GetIndexDesc
	GetTotalPage = DBConn.GetTotalPage
	DBConn.DbClose
	Set DBConn = nothing
	if  rs.Eof Then
%>

										<tbody class="nodata_tbody" style="display:none">
											<tr>
												<td colspan="4" class="nodata_tbody">문의하신 내역이 없습니다.</td>
											</tr>
										</tbody>
                  <%
	else
%>
										<!--문의내역있을시-->
										<tbody>
<%
		RSCnt = RS.Fields.Count    '필드의 갯수
		PrintNumber = NowRecordNum + 1
		Do Until rs.Eof 
			for i = 0 to RSCnt - 1
				obj_name = RS.fields(i).name
				Execute(obj_name & " = RS(" & i & ")")
			Next
			PrintNumber = PrintNumber - 1
			rs.movenext		
			p_regist = replace(mid(bb_regist,1,10),"-",".")
			if len(bb_re_Regist) > 0 then
				p_status = "답변완료"
			elseif bb_check = 1 then
				p_status = "확인중"
			else
				p_status = "접수중"
			end if
%>

                      <td> 
                        <%=PrintNumber%>
                      </td>
                      <td> 
                        <span style="cursor:pointer" onClick="$('#bb_<%=bb_idx%>').toggle()"><%=bb_title%></span>
                      </td>
                      <td> 
                        <%=p_status%>
                      </td>
                      <td><span class="date"> 
                        <%=p_regist%>
                        </span></td>
                    </tr>
                    <tr id="bb_<%=bb_idx%>" style="display:none"> 
                      <td colspan="4">문의 내용 : <br><%=replaceBR(bb_content)%>
					  <%if len(bb_re_Regist) > 0 then%>
					  <br><br>답변내용 : <br><%=bb_re_content%>
					  <%end if%>
					  </td>
					  </tr>
                    <%

		Loop
	End if
%>
										</tbody>
									</table>

									<%=Edit_Paging("page_list2",GetTotalPage)%>
								</div>
								<div id="account_paylist_cash" class="tabcontent">
									<p class="my_inqury_txt">고객님의 게임계정정지 내역을 확인 하실 수 있습니다. </p>
									<table class="lst_tbl_style1" width="100%">
										<col width="80px" />
										<col width="120px" />
										<col width="100px" />
										<col width="200px" />
										<col width="100px" />
										<col width="100px" />
										<thead>
											<tr>
												<th>번호</th>
												<th>게임</th>
												<th>서버/캐릭명</th>
												<th>정지사유</th>
												<th>정지일</th>
												<th>해지일</th>
											</tr>
										</thead>
										<tbody class="nodata_tbody" style="display:none">
											<tr>
												<td colspan="6" class="nodata_tbody">해당 기간에는 망고코인 충전내역이 없습니다.</td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td>1</td>
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
									<div class="paginate"> <a href="#" class="pre_end">처음</a> <a href="#" class="pre">이전</a> <a href="#">1</a> <strong>2</strong> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a> <a href="#">8</a> <a href="#">9</a> <a href="#">10</a> <a href="#" class="next">다음</a> <a href="#" class="next_end">끝</a> </div>
									<div class="memo_box">										
										<ul class="relative">
											<li><span class="ico i_mark" style="margin-top:-1px;"></span>계정도용과 관련되어 이용정지 해제 시 이용정지 기간은 보상되지 않습니다.</li>
											<li>계정정지와 관련된 궁금하신 점이 있으시면 [1:1문의]를 이용해주세요. </li>
											<a href="#" class="red_btn_big2 absolute" style="right:10px; top:-8px"><span>1:1 문의</span></a>
										</ul>										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--#include virtual="/inc/footer.asp" -->