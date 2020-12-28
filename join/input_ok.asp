<!--#include virtual="/dbopen.asp" -->
<!--#include virtual="/bbs/lib/oop_check_page.asp" -->
<!-- #include virtual="/bbs/lib/mdl_codemake.asp"-->
<!-- #include virtual="/bbs/class/cls_encrypt.asp"-->
<%

rtnMsg = ""
rtnMsg = CheckMemberIDCheck(mem_id)
if Len(rtnMsg) > 0 then Call MovePage("","BACK",rtnMsg)
rtnMsg = CheckMemberNickCheck(mem_nick)
if Len(rtnMsg) > 0 then Call MovePage("","BACK",rtnMsg)
rtnMsg = CheckMemberPasswordCheck(mem_id, mem_pass)

mem_family_id = trim(mem_family_id)
if len(mem_family_id) > 0 then 
	
	Sql = "Select Top 1 * From member_db Where mem_id = ?"
	Set DBConn = new XTclsDbConn
	Call DBConn.AddParam("mem_id",tmp_family_id)
	Set Rs = DBConn.RSOpen(SQL)
	Set DBConn = Nothing
	
	if not RS.eof then 
		mem_family_id = ""
	end if
else
	mem_family_id = ""
end if

mem_hp = tmp_hp_1 & "-" & tmp_hp_2 & "-" & tmp_hp_3
mem_email = tmp_email1 & "@" & tmp_email2
mem_pass_old = mem_pass

Set XTEncrypt = new XTclsEncrypt
mem_pass = XTEncrypt.SHA256(mem_pass)
mem_hp = Base64encode(mem_hp)
mem_email = Base64encode(mem_email)

Set XTEncrypt = nothing

Set XTUpdater = new XTclsDBUpdater
Call XTUpdater.InitSetting(DBUpdaterForm, "test", "member_db","mem_idx",DefUploadDir)
Call XTUpdater.AddParam("mem_id",mem_id)
Call XTUpdater.AddParam("mem_pass",mem_pass)
Call XTUpdater.AddParam("mem_nick",mem_nick)
Call XTUpdater.AddParam("mem_hp",mem_hp)
Call XTUpdater.AddParam("mem_email",mem_email)
Call XTUpdater.AddParam("mem_sex",mem_sex)
Call XTUpdater.AddParam("mem_family_id",mem_family_id)
Call XTUpdater.AddParam("mem_regist",now)
Call XTUpdater.AddParam("mem_ip",trim(Request.ServerVariables("REMOTE_ADDR")))
Call XTUpdater.AddParam("mem_user_status",1)
Call XTUpdater.AddParam("mem_session",session.SessionID)
Call XTUpdater.AddParam("mem_date_password",trim(date))

XTUpdater.SaveSQLForm
Set XTUpdater = nothing

Sql = "Select Top 1 mem_idx From member_db Where mem_id = ?"
Set DBConn = new XTclsDbConn
Call DBConn.AddParam("mem_id",mem_id)
Set Rs = DBConn.RSOpen(SQL)
Set DBConn = Nothing

if not rs.eof then
	mem_idx = rs(0)
	Set XTUpdater = new XTclsDBUpdater
	Call XTUpdater.InitSetting(DBUpdaterForm, "md", "member_detail","md_idx",DefUploadDir)
	Call XTUpdater.AddParam("mem_idx",mem_idx)
	XTUpdater.SaveSQLForm
	Set XTUpdater = nothing
end if




' 포커 회원 가입
Set XTUpdater = new XTclsDBUpdater
Call XTUpdater.InitSetting(DBUpdaterForm, "tbl", "tbl_Player","idx",DefUploadDir)
Call XTUpdater.DBConnection(PokerConn)
Call XTUpdater.AddParam("UserID",mem_id)
Call XTUpdater.AddParam("PassWD",mem_pass_old)
Call XTUpdater.AddParam("RealMoney",0)
Call XTUpdater.AddParam("GameMoney",0)
Call XTUpdater.AddParam("CashBonusPoint",0)
Call XTUpdater.AddParam("RakeBonusPoint",0)
Call XTUpdater.AddParam("CashBetAcum",0)
Call XTUpdater.AddParam("RakeAcum",0)
XTUpdater.SaveSQLForm
Set XTUpdater = nothing

Call MovePage("complete.asp","MOVE","")
%>