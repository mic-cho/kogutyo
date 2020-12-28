<%
Public Sub WriteLog_Member(mem_idx,log_type,log_memo,log_money)
	
	Select Case log_type
	Case "Ä³½¬"
		
		SQL = "Insert Into log_member (mem_idx, log_type, log_memo, log_regist, log_org_money,log_edit_money,log_rtn_money)"
		SQL = SQL & " Select Top 1 mem_idx, ?,?,?, isNull(mem_money_cash), ?, isNull(mem_money_cash,0) + ? From member_db Where mem_idx = ?"
		Set DBConn = new XTclsDbConn
		Call DBConn.AddParam("log_type", log_type)
		Call DBConn.AddParam("log_memo", log_memo)
		Call DBConn.AddParam("log_regist", now)
		Call DBConn.AddParam("log_edit_money", log_money)
		Call DBConn.AddParam("log_rtn_money", log_money)
		Call DBConn.AddParam("mem_idx", mem_idx)
		Call DBConn.ExecSQL(SQL)
		Set DBConn = Nothing

	Case "¾Ë"
		
		SQL = "Insert Into log_member (mem_idx, log_type, log_memo, log_regist, log_org_money,log_edit_money,log_rtn_money)"
		SQL = SQL & " Select Top 1 mem_idx, ?,?,?, isNull(mem_money_point), ?, isNull(mem_money_point,0) + ? From member_db Where mem_idx = ?"
		Set DBConn = new XTclsDbConn
		Call DBConn.AddParam("log_type", log_type)
		Call DBConn.AddParam("log_memo", log_memo)
		Call DBConn.AddParam("log_regist", now)
		Call DBConn.AddParam("log_edit_money", log_money)
		Call DBConn.AddParam("log_rtn_money", log_money)
		Call DBConn.AddParam("mem_idx", mem_idx)
		Call DBConn.ExecSQL(SQL)
		Set DBConn = Nothing

	Case else
		SQL = "Insert Into log_member (mem_idx, log_type, log_memo, log_regist, log_org_money,log_edit_money,log_rtn_money)"
		SQL = SQL & " Select Top 1 mem_idx, ?,?,?, 0, 0, 0 From member_db Where mem_idx = ?"
		Set DBConn = new XTclsDbConn
		Call DBConn.AddParam("log_type", log_type)
		Call DBConn.AddParam("log_memo", log_memo)
		Call DBConn.AddParam("log_regist", now)
		Call DBConn.AddParam("mem_idx", mem_idx)
		Call DBConn.ExecSQL(SQL)
		Set DBConn = Nothing
	end select
End Sub


%>