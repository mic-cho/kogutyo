<!--#include virtual="/dbopen.asp" -->
<!--#include virtual="/bbs/lib/oop_check_page.asp" -->
<!-- #include virtual="/bbs/lib/mdl_codemake.asp"-->
<!-- #include virtual="/bbs/class/cls_encrypt.asp"-->
<%

Set XTEncrypt = new XTclsEncrypt
mem_pass = XTEncrypt.SHA256(OldPass)
NewPass = XTEncrypt.SHA256(NewPass)
Set XTEncrypt = nothing

if login_mem_pass <> mem_pass then Call MovePage("","BACK","비밀번호가 일치하지 않습니다.")

Set XTUpdater = new XTclsDBUpdater
Call XTUpdater.InitSetting(DBUpdaterForm, "mem", "member_db","mem_idx",DefUploadDir)
Call XTUpdater.AddParam("mem_idx",login_mem_idx)
Call XTUpdater.AddParam("mem_pass",NewPass)
Call XTUpdater.AddParam("mem_date_password",trim(date))
XTUpdater.SaveSQLForm
Set XTUpdater = nothing

Call WriteLog_Member(login_mem_idx,"유저정보","비밀번호변경:" & trim(now),0)

Call MovePage("","CLOSE","비밀번호가 변경되었습니다.")
%>