<!--#include virtual="/inc/header.asp" -->
<%
	if len(login_mem_id) = 0 then Call MovePage("","CLOSE","로그인후 이용해 주십시요")
	
	Sql = "Select Top 1 * From game_avata Where ga_idx = ?"
	Set DBConn = new XTclsDbConn
	Call DBConn.AddParam("ga_idx", idx)
	Set Rs = DBConn.RSOpen(SQL)
	Set DBConn = Nothing
	
	if not RS.eof then 
		RSCnt = RS.Fields.Count    '필드의 갯수
		for i = 0 to RSCnt - 1
			obj_name = RS.fields(i).name
			Execute(obj_name & " = RS(" & i & ")")
		Next
	else
		Call MovePage("","CLOSE","DB 에러입니다.")
	End if
	
	Select Case ga_used_exprice_day
	case 365
		p_Limit = "구매일로부터 1년"
	case 270
		p_Limit = "구매일로부터 9개월"
	case 180
		p_Limit = "구매일로부터 6개월"
	case 90
		p_Limit = "구매일로부터 3개월"
	case 30
		p_Limit = "구매일로부터 1개월"
	End Select
	
	buycode = mid(date,3,8)
	buycode = replace(buycode,"-","")
	buycode = buycode & tmp_ZeroString(hour(now),2)
	buycode = buycode & tmp_ZeroString(minute(now),2)
	buycode = buycode & tmp_ZeroString(second(now),2)
	
%>
<title>::망고게임::</title>

<link rel="stylesheet" type="text/css" href="/pop/css/pop.css">
<link rel="stylesheet" type="text/css" href="/shop/css/shop.css">

<!-- import for easytabs -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/js/easytabs/jquery.hashchange.min.js" type="text/javascript"></script>
<script src="/js/easytabs/jquery.easytabs.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready( function() {
	$('#tab_container').easytabs();
});
</script>

</head>

<body>
<h1 class="blind">망고게임 게임샵</h1>
<div id="pop_wrap">
	<div id="pop_header">
		<h2>게임아바타 구매/상세보기</h2>
		<a href="javascript:window.close()">닫기</a>
	</div>

	<div id="pop_container">
		<div id="pop_content">

			<div class="section_goods">
				<p class="avatar"><img src="<%=ga_img_url%>" title="아바타"></p>
				<ul>
				<li><strong><%=ga_name%></strong></li>
				<li class="price">
					<dl>
					<dt>결제금액</dt><dd><span class="money"><%=formatnumber(ga_cash,0)%>캐쉬</span></dd>
					<dt>구매수량</dt><dd><select id="tmpBuyNum" name="tmpBuyNum" onChange="SellAvataMoney()">
					<%
					for i = 1 to 10
						response.Write("<option value='" & i & "'>" & i & "개</option>")
					next
					
					%></select></dd>
					</dl>
				</li>
				<li>
					<dl>
					<dt>게임머니</dt><dd><span class="poker"><%=ga_money_text%></span></dd>
					<dt>보너스 알</dt><dd><span class="point"><%=ga_bonus_money%>알</span></dd>
					<dt>상품안내</dt><dd><%=ga_content%></dd>
					<dt>유효기간</dt><dd><span class="info"><%=p_Limit%></span><a href="javascript:ready();" class="btn3">유료상품 청약철회</a></dd>
					</dl>
				</li>
				</ul>
			</div>

			<h3>최종 결제금액</h3>
			<!-- 보유한 망고캐쉬 결제:start -->
			<div id="tab_container" class="section_payment">
				<ul class="etabs">
				<li class="tab"><a href="#tab_cash">망고캐쉬</a></li>
				<li class="tab"><a href="#tab_pay">바로결제</a></li>
				</ul>
				<div id="tab_cash" class="tab_payment">
					<dl>
					<dt class="cash">보유캐쉬</dt><dd><%=formatnumber(login_mem_money_cash,0)%>캐쉬</dd>
					<dt>상품금액</dt><dd class="goods_price"><%=formatnumber(ga_cash,0)%>캐쉬</dd>
					</dl>
					<p>최종 결제 금액 : <strong id="Obj_TotalMoney"><%=formatnumber(ga_cash,0)%>원</strong></p>
					<div class="wrap_btn"><a href="javascript:" onClick="BuyAvata()"><i class="fa fa-check"></i>망고캐쉬로 구매하기</a></div>
				</div>
				<div id="tab_pay" class="tab_payment">
					<p>최종 결제 금액 : <strong id="Obj_TotalMoney2"><%=formatnumber(ga_cash,0)%>원</strong></p>
					<div class="wrap_btn"><a href="/shop/pop_charge.asp"><i class="fa fa-check"></i>바로 결제하기</a></div>
				</div>
				<a href="javascript:ready();" class="btn3">월 구매한도 조회</a>
			</div>
			<!-- 보유한 망고캐쉬 결제:end -->

			<div class="wrap_btn">
				<a href="javascript:window.close()" class="style1_nm">취소</a>
			</div>

		</div>

	</div>

</div>
<form action="pop_avatar_ok.asp" method="post" name="frmAvata" id="frmAvata">
  <input type="hidden" name="NowNum" id="NowNum" value="">
  <input type="hidden" name="ga_idx" id="ga_idx" value="<%=ga_idx%>">
  <input type="hidden" name="buycode" id="buycode" value="<%=buycode%>">
</form>
</body>
<script language="JavaScript" type="text/JavaScript">
var ItemMoney = <%=ga_cash%>;
var MemCash = <%=login_mem_money_cash%>
function SellAvataMoney()
{
	var NowNum = parseInt($("#tmpBuyNum").val())
	var TotalMoney = NowNum * ItemMoney
	$("#Obj_TotalMoney").html(numOnMask(TotalMoney) + "캐쉬" )
	$("#Obj_TotalMoney2").html(numOnMask(TotalMoney) + "캐쉬" )
}

function BuyAvata()
{
	var NowNum = parseInt($("#tmpBuyNum").val())
	var TotalMoney = NowNum * ItemMoney
	if(TotalMoney > MemCash )
	{
		alert("아바타 구매에 필요한 캐쉬가 부족합니다.")
		return;
	}
	$("#NowNum").val(NowNum)
	
	if(confirm("아바타를 구매하시겠습니까?"))
		$("#frmAvata").submit()
}
</script>

</html>