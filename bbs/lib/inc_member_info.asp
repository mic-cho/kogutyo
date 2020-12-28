<%

p_loginSession = session(DefCookieID)
if Len(p_loginSession) > 0 then


	Set LoginDBConn = new XTclsDBConn
	SQL = "Select Top 1 * From member_db m Where mem_idx = ? And mem_user_status = 1"
	Call LoginDBConn.AddParam("DefCookieID",p_loginSession)
	Set LoginRs = LoginDBConn.RSOpen(SQL)
	if not LoginRs.eof then 
		RSCnt = LoginRs.Fields.Count    '필드의 갯수
		for i = 0 to RSCnt - 1
			obj_name = LoginRs.fields(i).name
			Execute("login_" & obj_name & " = LoginRs(" & i & ")")
		Next
	End if
	Set LoginRs = nothing
	Set LoginDBConn = Nothing

	if len(login_mem_id) > 0 then 
		' 로그인 이후 처리되야 할 부분
		if isNull(login_mem_money_cash)  then login_mem_money_cash = 0
		if isNull(login_mem_money_point)  then login_mem_money_point = 0
		if isNull(login_mem_money_gamemoney)  then login_mem_money_gamemoney = 0
		if isNull(login_mem_charge_money) then login_mem_charge_money = 0
		if isNull(login_mem_charge_date)  then login_mem_charge_date = ""

		if Left(login_mem_charge_date,7) <> trim(date) then
			login_mem_charge_date = trim(date)
			login_mem_charge_money = 0
		end if
		login_mem_charge_money_Max = CCur(DefMaxMonthChargeMoney) - CCur(login_mem_charge_money)


		Set LoginDBConn = new XTclsDBConn
		SQL = "Select Top 1 * From member_detail m Where mem_idx = ?"
		Call LoginDBConn.AddParam("DefCookieID",login_mem_idx)
		Set LoginRs = LoginDBConn.RSOpen(SQL)
		if not LoginRs.eof then 
			RSCnt = LoginRs.Fields.Count    '필드의 갯수
			for i = 0 to RSCnt - 1
				obj_name = LoginRs.fields(i).name
				Execute("login_" & obj_name & " = LoginRs(" & i & ")")
			Next
		End if
		Set LoginRs = nothing
		Set LoginDBConn = Nothing

	end if
	

	
	
End if
%>