<!--#include virtual="/dbopen.asp" -->
<!--#include virtual="/bbs/lib/oop_check_page.asp" -->
<!-- #include virtual="/bbs/lib/mdl_log.asp"-->
<!-- #include virtual="/bbs/class/cls_encrypt.asp"-->
<%
if len(login_mem_id) = 0 then Call MovePage("","CLOSE","로그인후 이용해 주십시요")

rtnMsg = ""

if len(buycode) <> 12 then rtnMsg = "거래코드가 누락되었습니다."
if len(NowNum) = 0 then rtnMsg = "구매갯수가 누락되었습니다."

Sql = "Select Top 1 * From game_avata Where ga_idx = ?"
Set DBConn = new XTclsDbConn
Call DBConn.AddParam("ga_idx", ga_idx)
Set Rs = DBConn.RSOpen(SQL)
Set DBConn = Nothing

if not RS.eof then 
	RSCnt = RS.Fields.Count    '필드의 갯수
	for i = 0 to RSCnt - 1
		obj_name = RS.fields(i).name
		Execute(obj_name & " = RS(" & i & ")")
	Next
else
	rtnMsg = "상품코드가 누락되었습니다."
End if

buycode = buycode & login_mem_idx

Sql = "Select Top 1 * From game_avata_log Where gal_code = ?"
Set DBConn = new XTclsDbConn
Call DBConn.AddParam("buycode", buycode)
Set Rs = DBConn.RSOpen(SQL)
Set DBConn = Nothing

if not RS.eof then rtnMsg = "거래코드가 이미 등록된 거래가 있습니다."


response.Write(ga_cash & "_1<br>")
response.Write(ga_bonus_money & "_2<br>")
response.Write(ga_gamemoney & "_3<br>")
response.Write(NowNum & "_4<br>")

tmpTotal = CCur(ga_cash) * CCur(NowNum)
tmpTotal2 = CCur(ga_bonus_money) * CCur(NowNum)
tmpTotal3 = CCur(ga_gamemoney) * CCur(NowNum)
if CCur(login_mem_money_cash) < CCur(tmpTotal) then rtnMsg = "보유금액이 부족합니다." 


if len(rtnMsg) > 0 then Call MovePage("","BACK",rtnMsg)

gal_end_date = DateAdd("y",ga_used_exprice_day ,date)

SQL = "Insert Into game_avata_log " & vbCrlf
SQL = SQL & "(mem_id,mem_idx,ga_idx	,gal_code,gal_num,gal_type" & vbCrlf
SQL = SQL & " ,gal_cash,gal_gamemoney,gal_bonus_money"
SQL = SQL & " ,gal_cash_t,gal_gamemoney_t,gal_bonus_money_t"
SQL = SQL & ",gal_end_date,gal_img_url,gal_regist" & vbCrlf
SQL = SQL & ")" & vbCrlf
SQL = SQL & "Select Top 1" & vbCrlf
SQL = SQL & " ?,?,ga_idx ,?,?,ga_type" & vbCrlf
SQL = SQL & " ,ga_cash,ga_gamemoney,ga_bonus_money" & vbCrlf
SQL = SQL & " ,ga_cash * ?,ga_gamemoney * ?,ga_bonus_money * ?" & vbCrlf
SQL = SQL & " ,?,ga_img_url,?" & vbCrlf
SQL = SQL & " From game_avata Where ga_idx = ?" & vbCrlf

Set DBConn = new XTclsDbConn
Call DBConn.AddParam("mem_id", login_mem_id)
Call DBConn.AddParam("mem_idx", login_mem_idx)
Call DBConn.AddParam("gal_code", buycode)
Call DBConn.AddParam("gal_num", NowNum)

Call DBConn.AddParam("gal_num", NowNum)
Call DBConn.AddParam("gal_num", NowNum)
Call DBConn.AddParam("gal_num", NowNum)

Call DBConn.AddParam("gal_end_date", gal_end_date)
Call DBConn.AddParam("gal_regist", trim(now))
Call DBConn.AddParam("ga_idx", ga_idx)
Call DBConn.ExecSQL(SQL)
Set DBConn = Nothing

log_memo1 = "아바타 구매 : " & ga_name & " , 캐쉬사용 : " & tmpTotal 
log_memo2 = "아바타 구매 : " & ga_name & " , 알충전 : " & tmpTotal2 
log_memo3 = "아바타 구매 : " & ga_name & " , 골드충전 : " & tmpTotal3

Set DBConn = new XTclsDbConn
Call DBConn.SetConnType(adCmdStoredProc)
Call DBConn.AddParam("mem_idx",login_mem_idx)
Call DBConn.AddParam("set_cash",tmpTotal*-1)
Call DBConn.AddParam("set_cash_text",log_memo1)
Call DBConn.AddParam("set_Point",tmpTotal2)
Call DBConn.AddParam("set_Point_text",log_memo2)
Call DBConn.AddParam("set_Gamemoney",tmpTotal3)
Call DBConn.AddParam("set_Gamemoney_text",log_memo3)
Call DBConn.AddParam("set_regist",trim(now))
Call DBConn.ExecSQL("MemberMoneyCharge_SP")
Set DBConn = nothing


Sql = "Select Top 1 * From game_avata_log Where gal_code = ?"
Set DBConn = new XTclsDbConn
Call DBConn.AddParam("buycode", buycode)
Set Rs = DBConn.RSOpen(SQL)
Set DBConn = Nothing

if not rs.eof then gal_idx = rs("gal_idx")

Call MovePage("pop_complete.asp?idx=" & gal_idx,"MOVE","")
%>