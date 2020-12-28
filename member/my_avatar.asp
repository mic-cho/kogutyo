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
						<h1 class="h1_stitle">아바타옷장<span class="title_coment">고객님께서 구매하신 아바타목록을 확인하실 수 있습니다.</span></h1>
						<div id="tab_container" class="m_t_20">
							<ul class="tabs" persist="true">
								<li><a href="javascript:void(0);" rel="lst_avatar">아바타 옷장</a></li>
								<li><a href="javascript:void(0);" rel="lst_album">내앨범</a></li>
								<li><a href="javascript:void(0);" rel="lst_gift">선물함</a></li>
								<li><a href="javascript:void(0);" rel="lst_wish">조르기함</a></li>
								<li><a href="javascript:void(0);" rel="lst_jjim">찜리스트</a></li>
							</ul>
							<div class="tabcontents">
								<div id="lst_avatar" class="tabcontent">
									<h3 class="fbo fc_223e66"><span class="ico arr4 m_r_10"></span>현재 착용중인 아바타</h3>
									<ul class="lst lst_box">
										<li><a href="#" class="thumb"><img src="/member/img/a1u09r.gif" width="100" height="120"></a><span class="title">삐야기</span><span class="bor">&nbsp;</span></li>
										<li><a href="#" class="thumb"><img src="/member/img/k5u011.gif" width="100" height="120"></a><span class="title">짜증은 날려</span><span class="bor">&nbsp;</span></li>
										<li><a href="#" class="thumb"><img src="/member/img/a4u0br.gif" width="100" height="120"></a><span class="title">활주로</span><span class="bor">&nbsp;</span></li>
										<li><a href="#" class="thumb"><img src="/member/img/sbm07ea.gif" width="100" height="120"></a><span class="title">전투기조종사정복</span><span class="bor">&nbsp;</span></li>
									</ul>
									<h3 class="fbo fc_223e66"><span class="ico arr4 m_r_10"></span>현재 보유한 아바타</h3>
									<div class="lst_spot">
										<p><span class="ico arr2"></span>일부 아바타와 현재 착용중인 아바타는 선물하기 및 삭제기능이 제한됩니다.</p>
										<span class="select_area">
										<input name="check_all" type="checkbox" value="">
										<label for="check_all">전체선택</label>
										ㅣ <a href="#" class="btn fc_FD6B00"><span>선물</span></a> <a href="#" class="btn"><span>삭제</span></a></span></div>
									<ul class="lst">
										<li><a href="#" class="thumb"><img src="/member/img/a1u09r.gif" width="100" height="120"></a><span class="title">
											<input name="" type="checkbox" value="">
											삐야기</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
										<li><a href="#" class="thumb"><img src="/member/img/k5u011.gif" width="100" height="120"></a><span class="title">
											<input name="" type="checkbox" value="">
											짜증은 날려</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
										<li><a href="#" class="thumb"><img src="/member/img/a4u0br.gif" width="100" height="120"></a><span class="title">
											<input name="" type="checkbox" value="">
											활주로</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
										<li><a href="#" class="thumb"><img src="/member/img/sbm07ea.gif" width="100" height="120"></a><span class="title">
											<input name="" type="checkbox" value="">
											전투기조종사정복</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
										<li><a href="#" class="thumb"><img src="/member/img/a4u0br.gif" width="100" height="120"></a><span class="title">
											<input name="" type="checkbox" value="">
											활주로</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
										<li><a href="#" class="thumb"><img src="/member/img/sbm07ea.gif" width="100" height="120"></a><span class="title">
											<input name="" type="checkbox" value="">
											전투기조종사정복</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
										<li><a href="#" class="thumb"><img src="/member/img/hcm008.gif" width="70" height="85"></a><span class="title">
											<input name="" type="checkbox" value="">
											활주로</span><em>지급받으신 아이템</em><span class="bor">&nbsp;</span></li>
										<li><a href="#" class="thumb"><img src="/member/img/lcm013.gif" width="70" height="85"></a><span class="title">
											<input name="" type="checkbox" value="">
											전투기조종사정복</span><em>지급받으신 아이템</em><span class="bor">&nbsp;</span></li>
									</ul>
									<div class="paginate"> <a href="#" class="pre_end">처음</a> <a href="#" class="pre">이전</a> <a href="#">1</a> <strong>2</strong> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a> <a href="#">8</a> <a href="#">9</a> <a href="#">10</a> <a href="#" class="next">다음</a> <a href="#" class="next_end">끝</a> </div>
								</div>
								<div id="lst_album" class="tabcontent">
									<div class="lst_spot">
										<p><span class="ico arr2"></span>고객님께서 착용했던 아바타와 아이템 앨범입니다.</p>
										<span class="select_area">
										<input name="check_all" type="checkbox" value="">
										<label for="check_all">전체선택</label>
										ㅣ <a href="#" class="btn"><span>삭제</span></a></span></div>
									<ul class="lst">
										<li><a href="#" class="thumb"><img src="/member/img/a1u09r.gif" width="100" height="120"></a><span class="title">
											<input name="" type="checkbox" value="">
											삐야기</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
										<li><a href="#" class="thumb"><img src="/member/img/k5u011.gif" width="100" height="120"></a><span class="title">
											<input name="" type="checkbox" value="">
											짜증은 날려</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
										<li><a href="#" class="thumb"><img src="/member/img/a4u0br.gif" width="100" height="120"></a><span class="title">
											<input name="" type="checkbox" value="">
											활주로</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
									</ul>
									<div class="paginate"> <a href="#" class="pre_end">처음</a> <a href="#" class="pre">이전</a> <a href="#">1</a> <strong>2</strong> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a> <a href="#">8</a> <a href="#">9</a> <a href="#">10</a> <a href="#" class="next">다음</a> <a href="#" class="next_end">끝</a> </div>
								</div>
								<div id="lst_gift" class="tabcontent">
									<ul class="gift_tabs" persist="true">
										<li class="brd_rht_solid"><a href="javascript:void(0);" rel="lst_recevie">받은 선물함</a></li>
										<li><a href="javascript:void(0);" rel="lst_give">보낸 선물함</a></li>
									</ul>
									<div class="gift_tabcontents">
										<div id="lst_recevie" class="gift_tabcontent">
											<div class="lst_spot">
												<p><span class="ico arr2"></span>최근 2주일간의 받은 선물만 표시됩니다.</p>
												<span class="select_area">
												<input name="check_all" type="checkbox" value="">
												<label for="check_all">전체선택</label>
												ㅣ <a href="#" class="btn"><span>삭제</span></a></span></div>
											<ul class="lst">
												<li><a href="#" class="thumb"><img src="/member/img/a1u09r.gif" width="100" height="120"></a><span class="title">
													<input name="" type="checkbox" value="">
													삐야기</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
												<li><a href="#" class="thumb"><img src="/member/img/k5u011.gif" width="100" height="120"></a><span class="title">
													<input name="" type="checkbox" value="">
													짜증은 날려</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
												<li><a href="#" class="thumb"><img src="/member/img/a4u0br.gif" width="100" height="120"></a><span class="title">
													<input name="" type="checkbox" value="">
													활주로</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
												<li><a href="#" class="thumb"><img src="/member/img/sbm07ea.gif" width="100" height="120"></a><span class="title">
													<input name="" type="checkbox" value="">
													전투기조종사정복</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
											</ul>
											<div class="paginate"> <a href="#" class="pre_end">처음</a> <a href="#" class="pre">이전</a> <a href="#">1</a> <strong>2</strong> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a> <a href="#">8</a> <a href="#">9</a> <a href="#">10</a> <a href="#" class="next">다음</a> <a href="#" class="next_end">끝</a> </div>
										</div>
										<div id="lst_give" class="gift_tabcontent">
											<div class="lst_spot">
												<p><span class="ico arr2"></span>최근 2주일간의 보낸 선물만 표시됩니다.</p>
												<span class="select_area">
												<input name="check_all" type="checkbox" value="">
												<label for="check_all">전체선택</label>
												ㅣ <a href="#" class="btn"><span>삭제</span></a></span></div>
											<div class="m_tb_30 ac fbo">아이템이 없습니다.</div>
											<div class="paginate"> <a href="#" class="pre_end">처음</a> <a href="#" class="pre">이전</a> <a href="#">1</a> <strong>2</strong> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a> <a href="#">8</a> <a href="#">9</a> <a href="#">10</a> <a href="#" class="next">다음</a> <a href="#" class="next_end">끝</a> </div>
										</div>
									</div>
								</div>
								<div id="lst_wish" class="tabcontent">
									<ul class="wish_tabs" persist="true">
										<li class="brd_rht_solid"><a href="javascript:void(0);" rel="wish_recevie">조르기 받은 내용</a></li>
										<li><a href="javascript:void(0);" rel="wish_give">조르기 보낸 내용</a></li>
									</ul>
									<div class="wish_tabcontents">
										<div id="wish_recevie" class="wish_tabcontent">
											<div class="lst_spot">
												<p><span class="ico arr2"></span>친구에게 조르기 받은 아바타입니다.</p>
												<span class="select_area">
												<input name="check_all" type="checkbox" value="">
												<label for="check_all">전체선택</label>
												ㅣ <a href="#" class="btn"><span>삭제</span></a></span></div>
											<ul class="lst">
												<li><a href="#" class="thumb"><img src="/member/img/a1u09r.gif" width="100" height="120"></a><span class="title">
													<input name="" type="checkbox" value="">
													삐야기</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
												<li><a href="#" class="thumb"><img src="/member/img/k5u011.gif" width="100" height="120"></a><span class="title">
													<input name="" type="checkbox" value="">
													짜증은 날려</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
											</ul>
											<div class="paginate"> <a href="#" class="pre_end">처음</a> <a href="#" class="pre">이전</a> <a href="#">1</a> <strong>2</strong> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a> <a href="#">8</a> <a href="#">9</a> <a href="#">10</a> <a href="#" class="next">다음</a> <a href="#" class="next_end">끝</a> </div>
										</div>
										<div id="wish_give" class="wish_tabcontent">
											<div class="lst_spot">
												<p><span class="ico arr2"></span>친구에게 조르기 보낸 아바타입니다.</p>
												<span class="select_area">
												<input name="check_all" type="checkbox" value="">
												<label for="check_all">전체선택</label>
												ㅣ <a href="#" class="btn"><span>삭제</span></a></span></div>
											<div class="m_tb_30 ac fbo">아이템이 없습니다.</div>
											<div class="paginate"> <a href="#" class="pre_end">처음</a> <a href="#" class="pre">이전</a> <a href="#">1</a> <strong>2</strong> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a> <a href="#">8</a> <a href="#">9</a> <a href="#">10</a> <a href="#" class="next">다음</a> <a href="#" class="next_end">끝</a> </div>
										</div>
									</div>
								</div>
								<div id="lst_jjim" class="tabcontent">
									<div class="lst_spot">
									<p><span class="ico arr2"></span>상점에서 내가 찜한 아바타 입니다.</p>
									<span class="select_area">
									<input name="check_all" type="checkbox" value="">
									<label for="check_all">전체선택</label> ㅣ 선택한 아바타를 <a href="#" class="btn"><span>구매</span></a><a href="#" class="btn"><span>선물</span></a><a href="#" class="btn"><span>삭제</span></a></span></div>
								<ul class="lst">
									<li><a href="#" class="thumb"><img src="/member/img/a1u09r.gif" width="100" height="120"></a><span class="title">
										<input name="" type="checkbox" value="">
										삐야기</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
									<li><a href="#" class="thumb"><img src="/member/img/k5u011.gif" width="100" height="120"></a><span class="title">
										<input name="" type="checkbox" value="">
										짜증은 날려</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
									<li><a href="#" class="thumb"><img src="/member/img/a4u0br.gif" width="100" height="120"></a><span class="title">
										<input name="" type="checkbox" value="">
										활주로</span><em>선물 받으신 아이템</em><span class="bor">&nbsp;</span></li>
								</ul>
								<div class="paginate"> <a href="#" class="pre_end">처음</a> <a href="#" class="pre">이전</a> <a href="#">1</a> <strong>2</strong> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a> <a href="#">8</a> <a href="#">9</a> <a href="#">10</a> <a href="#" class="next">다음</a> <a href="#" class="next_end">끝</a> </div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--#include virtual="/inc/footer.asp" -->