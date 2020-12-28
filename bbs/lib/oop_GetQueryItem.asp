<%
Function CheckXSSCheck(tmpString)

	RtnString = tmpString
	RtnString = Replace(RtnString,"'","¡®")
	RtnString = Replace(RtnString,"""","£¢")
	RtnString = Replace(RtnString,"(","£¨")
	RtnString = Replace(RtnString,")","£©")
	RtnString = Replace(RtnString,"{","£û")
	RtnString = Replace(RtnString,"}","£ý")
	RtnString = Replace(RtnString,"[","£Û")
	RtnString = Replace(RtnString,"]","£Ý")
	RtnString = Replace(RtnString,"<","¡´")
	RtnString = Replace(RtnString,">","¡µ")
	RtnString = Replace(RtnString,"%","£¥")
	RtnString = Replace(RtnString,"$","£¤")
	RtnString = Replace(RtnString,"+","£«")
	RtnString = Replace(RtnString,";","£»")
'	RtnString = Replace(RtnString,"-","£­")
	RtnString = Replace(RtnString,"|","£ü")
	RtnString = Replace(RtnString,"\","¡¬")
	
	CheckXSSCheck = RtnString
End function

Function CheckJSCheck(tmpString)


	RtnString = lcase(tmpString)
	tmpCheck = false

	if tmpCheck = false And inStr(RtnString,"script") > 0 then tmpCheck = true
	if tmpCheck = false And inStr(RtnString,"mouse") > 0 then tmpCheck = true
	if tmpCheck = false And inStr(RtnString,"click") > 0 then tmpCheck = true
	if tmpCheck = false And inStr(RtnString,"onkey") > 0 then tmpCheck = true
	if tmpCheck = false And inStr(RtnString,"onload") > 0 then tmpCheck = true
	if tmpCheck = false And inStr(RtnString,"onerror") > 0 then tmpCheck = true
	if tmpCheck = false And inStr(RtnString,"<object") > 0 then tmpCheck = true
'	if tmpCheck = false And inStr(RtnString,"document") > 0 then tmpCheck = true
	if tmpCheck = false And inStr(RtnString,"location") > 0 then tmpCheck = true
	if tmpCheck = false And inStr(RtnString,"embed") > 0 then tmpCheck = true
	if tmpCheck = false And inStr(RtnString,"<embed") > 0 then tmpCheck = true

	if tmpCheck = true then
		RtnString = CheckXSSCheck(tmpString)
	else
		RtnString = tmpString
	end if
	CheckJSCheck = RtnString
End function



QueryLink = ""
For each QueryItemName in Request.QueryString
	if Len(trim(QueryItemName)) > 0 then
		tmpGetString = CheckXSSCheck(Request.QueryString(QueryItemName)(1))
'		tmpString = QueryItemName & " = Request.QueryString(""" & QueryItemName & """)(1)"
		tmpString = QueryItemName & " = tmpGetString"
		
		if Left(trim(tmpString),1) <> "=" And  Left(trim(tmpString),1) <> "&" And Left(trim(tmpString),1) <> "?" And Left(trim(tmpString),1) <> "_" then 
			Execute(tmpString)	
			QueryLink = QueryLink & "&" & QueryItemName & "=" & tmpGetString
		end if
	end if
Next

For each QueryItemName in Request.Form
	if Len(QueryItemName) > 0 then
'		Execute(QueryItemName & " = Request.Form(""" & QueryItemName & """)")
'		QueryLink = QueryLink & "&" & QueryItemName & "=" & Request.Form(QueryItemName)

		tmpGetString = CheckXSSCheck(Request.Form(QueryItemName)(1))
		tmpString = QueryItemName & " = tmpGetString"
		if Left(trim(tmpString),1) <> "=" And  Left(trim(tmpString),1) <> "&" And Left(trim(tmpString),1) <> "?" And Left(trim(tmpString),1) <> "_" then 
			Execute(tmpString)			
			QueryLink = QueryLink & "&" & QueryItemName & "=" & tmpGetString
		end if
	End if
Next
if Len(QueryLink) > 1 then 
	QueryLink = Replace(QueryLink,"&&","&")
	QueryLink = Mid(QueryLink,2)
end if
if Left(QueryLink,1) = "&" then QueryLink = Mid(QueryLink,2)


%>