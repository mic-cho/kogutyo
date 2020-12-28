<!--#include virtual="/bbs/lib/defGlobal.asp" -->
<!--#include virtual="/bbs/class/cls_dbconnect.asp" -->
<!-- #include virtual="/bbs/class/cls_encrypt.asp"-->
<%

	mem_id  = trim(LCase(request("mem_id")))
	chk_mem_pass  = request("mem_pass")
	log_machine  = "PC"
	if len(AdminLogin) = 0 then AdminLogin = 0
	p_domain = request.ServerVariables("SERVER_NAME")
	p_ip = request.ServerVariables("REMOTE_ADDR")
	
	Set XTEncrypt = new XTclsEncrypt
	chk_mem_pass = XTEncrypt.SHA256(chk_mem_pass)
	Set XTEncrypt = nothing


	SQL = "Select Top 1 mem_idx, mem_pass,mem_user_status"
	SQL = SQL & " From member_db Where mem_id = ? "

	Set DBConn = new XTclsDbConn			' 클래스 선언
	Call DBConn.AddParam("mem_id", mem_id )	' 파라메터 입력 (mtc_id = [?]) 부분
	Set RS = DBConn.RSOpen(SQL) 			' 레코드셋 받아오기 

	if not RS.eof then
	
		mem_idx = rs("mem_idx")
		mem_pass = rs("mem_pass")
		mem_user_status = rs("mem_user_status")
		p_Msg = ""
		if mem_user_status = 0 then
			CookieError = "관리자의 가입승인이 필요합니다."
		elseif mem_user_status = 2 then
			CookieError = "사용정지 회원입니다."
		elseif mem_user_status = 3 then
			CookieError = "탈퇴 회원입니다."
			
		elseif mem_pass = chk_mem_pass Then

			session(DefCookieID) = mem_idx

			SQL = "Update member_db Set"
			SQL = SQL & " mem_last_login = ?"
			SQL = SQL & ",mem_session = ?"
			SQL = SQL & ",mem_ip = ?"
			SQL = SQL & " Where mem_id = ?"
			Set DBConn = new XTclsDbConn			' 클래스 선언
			Call DBConn.AddParam("mem_last_login", now )	' 파라메터 입력 (mtc_id = [?]) 부분
			Call DBConn.AddParam("mem_session", session.SessionID )	' 파라메터 입력 (mtc_id = [?]) 부분
			Call DBConn.AddParam("mem_ip", p_ip )	' 파라메터 입력 (mtc_id = [?]) 부분
			Call DBConn.AddParam("mem_id", mem_id )	' 파라메터 입력 (mtc_id = [?]) 부분
			Call DBConn.ExecSQL(SQL)
			Set DBConn = nothing

			if len(go_url) = 0 then go_url = "/"
			CookieError = ""
			p_Msg = "OK"
		else
			CookieError = "등록되지 않은 ID이거나 비밀번호 입니다."
			p_Msg = "비밀번호 오류"
		end if

		if len(p_Msg) = 0 then p_Msg = CookieError

		SQL = "Insert Into log_login (log_date, log_id, log_ip, log_regist, log_Message, log_domain) values (?, ?, ?, ?, ?, ?)"
		Set DBConn = new XTclsDbConn			' 클래스 선언
		Call DBConn.AddParam("log_date", trim(date) )
		Call DBConn.AddParam("log_id", trim(mem_id) )
		Call DBConn.AddParam("log_ip", p_ip )
		Call DBConn.AddParam("log_regist", trim(now) )
		Call DBConn.AddParam("log_Message", trim(p_Msg) )
		Call DBConn.AddParam("log_domain", trim(p_domain) )
		
		Call DBConn.ExecSQL(SQL)
		Set DBConn = Nothing
	else
		CookieError = "등록되지 않은 ID이거나 비밀번호 입니다."
	End if
	Set RS = nothing
%>