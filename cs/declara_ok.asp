<!--#include virtual="/dbopen.asp" -->
<!--#include virtual="/bbs/lib/oop_check_page.asp" -->
<!-- #include virtual="/bbs/lib/mdl_codemake.asp"-->
<!-- #include virtual="/bbs/class/cls_encrypt.asp"-->
<%

rtnMsg = ""

if len(bb_01) = 0 then rtnMsg = "분류가 누락되었습니다."
if len(bb_title) = 0 then rtnMsg = "제목이 누락되었습니다."
if len(bb_content) = 0 then rtnMsg = "내용이 누락되었습니다."

mem_hp = tmp_tel_1 & "-" & tmp_tel_2 & "-" & tmp_tel_3
mem_email = tmp_email1 & "@" & tmp_email2

Set XTEncrypt = new XTclsEncrypt
mem_hp = Base64encode(mem_hp)
mem_email = Base64encode(mem_email)
Set XTEncrypt = nothing

if len(tmp_tel_check) = 0 then tmp_tel_check = "N"

Set XTUpdater = new XTclsDBUpdater
Call XTUpdater.InitSetting(DBUpdaterForm, "bb", "board_body","bb_idx",DefUploadDir)
Call XTUpdater.AddParam("bh_idx",5)
Call XTUpdater.AddParam("mem_idx",login_mem_idx)
Call XTUpdater.AddParam("mem_id",login_mem_id)
Call XTUpdater.AddParam("bb_name",login_mem_nick)
Call XTUpdater.AddParam("bb_02",mem_hp)
Call XTUpdater.AddParam("bb_03",mem_email)
Call XTUpdater.AddParam("bb_04",tmp_tel_check)
Call XTUpdater.AddParam("bb_ip",trim(Request.ServerVariables("REMOTE_ADDR")))
Call XTUpdater.AddParam("bb_regist",now)
Call XTUpdater.AddParam("bb_readnum",0)
XTUpdater.SaveSQLForm
Set XTUpdater = nothing

Call MovePage(request.ServerVariables("HTTP_REFERER"),"MOVE","접수되었습니다.\n\n빠른시간내에 답변드리겟습니다.")
%>