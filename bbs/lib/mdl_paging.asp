<%
'################################################################################
'### 넘어온 데이터를 받아서 리턴해주는 함수
'### Return_Query_String 함수 : 쿼리스트링으로 넘어오는 데이터를 문자열로 만들어준다.
'### Return_Form_String 함수 : 폼으로 넘어오는 데이터를 문자열로 만들어준다.(쿼리스트링으로 리턴)
'################################################################################
Function Return_Query_String()
	Dim Query_Item , i
	Dim Return_Query
	For each Query_Item in Request.QueryString
	    For i = 1 to Request.QueryString(Query_Item).Count
			Return_Query = Return_Query & "&" & Query_Item & "=" & Request.QueryString(Query_Item)(i)
		Next
	Next
	Return_Query_String = Mid(Return_Query,2)
End Function

Function Return_Form_String()
	Dim Form_Item , i
	Dim Return_Form
	For each Form_Item in Request.Form
	    For i = 1 to Request.Form(Form_Item).Count
			Return_Form = Return_Form & "&" & Form_Item & "=" & Request.Form(Form_Item)(i)
		Next
	Next
	Return_Form_String = Mid(Return_Form,2)
End Function

' 쿼리스트링 문자열 + 폼스트링 문자열 을 리턴해주는 함수
Function Return_Query_Form_String()
	Dim Return_Query
	Return_Query = Return_Query_String()
	if Len(Return_Query) Then Return_Query = Return_Query & "&"
	Return_Query = Return_Query & Return_Form_String()
	Return_Query_Form_String = Return_Query
End Function

' 쿼리스트링 문자열 중에 특정 문자열 리턴값만 제거해 준다.
Function Return_Remove_String(byVal Source_String,byVal Target_String)
	Dim Prev_String, Next_String
	Dim Target_position, i
	' 리턴받은 문자열들을 초기화 한다.
	Tmp_Source_String = LCase(Source_String)
	Target_String = Split(LCase(Target_String),",")

	for i = 0 to ubound(Target_String)
		Target_position = InStr(Tmp_Source_String,Trim(Target_String(i)))				' 삭제할 문자열의 위치를 받는다.
		if Target_position > 0 Then											' 문자열이 존재한다면
			Prev_String = ""
			Next_String = ""
			if Target_position > 1 Then										' 맨 앞에 있는 문자가 삭제될 문자가 아니면
				Prev_String = Left(Source_String, Target_position - 1)		' 삭제할 문자열 앞쪽을 받아온다.
				Source_String = Mid(Source_String, Target_position)			' 삭제할 문자열 앞족을 잘라낸다.
			End if
			Tmp_Source_String = Source_String
			' 만약 삭제할 문자열 뒤쪽에 남은 문자가 있다면, 받아둔다.
			if InStr(Source_String,"&") Then Next_String = Mid(Source_String, InStr(Source_String,"&"))
	
			' 앞쪽 문자와 뒤쪽문자를 합한다.
			Source_String = replace(Prev_String & Next_String,"&&","&")
		End if
	Next
	
	if Left(Source_String,1) = "&" then Source_String = Mid(Source_String,2)
	Return_Remove_String = Return_Query_Check(Source_String)			' 문자열을 리턴해 준다.
End Function

' 쿼리스트링내부에 잘못된 문자열들을 정리해주는 함수
Function Return_Query_Check(byVal Source_String)
	tmpURL = Source_String
	tmpURL = replace(tmpURL,"?&" , "?")
	tmpURL = replace(tmpURL,"&&" , "&")
	if Right(tmpURL,1) = "&" then tmpURL = Left(tmpURL,Len(tmpURL) - 1)
	if Right(tmpURL,1) = "?" then tmpURL = Left(tmpURL,Len(tmpURL) - 1)
	Return_Query_Check = tmpURL
End Function


' 페이징을 출력해주는 함수
' 값: now_page = 페이지 변수이름, tot_page = 총 페이지 번호, page_count = 한번에 출력할 페이징 갯수
' src_Top = 10개이전 소스, src_Last = 10개 이후 소스, src_now = 현재 페이지 소스, src_pagenu = 선택되지 않은 페이지 소스
' src_spacer = 페이지 중간값
Public Function Print_Paging(byVal now_page, byVal tot_page, byVal page_count, byVal src_Top, byVal src_Last, byVal src_now, byVal src_pagenum, byVal src_spacer)
	Dim RtnPaging
	Dim blockPage
	
	if tot_page = "" or tot_page = 0 then exit Function	' 총 페이지 갯수가 안넘어 오면 에러
	now_page_count = request(now_page)				' 현재 페이지 번호를 받는다.
	if now_page_count = "" then now_page_count = 1
	now_page_count = CLng(now_page_count)
	now_link = Return_Query_Form_String()
	now_link = Return_Remove_String(now_link,now_page)
	if Len(now_link) then now_link = "&" & now_link 
	now_link = replace(now_link,"&&","&")

	RtnPaging = "<table width='100%' cellpadding='0' cellspacing='0' class='page_text' style='margin-bottom:20px;'><tr><td align='center'>"
	src_Top = " Prev"
	src_Last = "Next "
	 '************************ 이전 page_count 개구문 시작 ***************************    
	blockPage = Int((now_page_count - 1) / page_count) * page_count + 1
	if CLng(blockPage) > CLng(page_count) Then
		RtnPaging = RtnPaging & "<a href=""?" & now_page & "=" & trim(blockPage - 1) & now_link & """>"
		RtnPaging = RtnPaging & src_Top
		RtnPaging = RtnPaging & "</a>"
		RtnPaging = RtnPaging & " " & src_spacer & " "
	else
		RtnPaging = RtnPaging & src_Top
		RtnPaging = RtnPaging & " " & src_spacer & " "
	End If
	'************************ 이전 page_count 개 구문 끝***************************              
	'************************ 페이징 출력 시작 ***************************              
	for i = 1 to page_count
		If CLng(blockPage) = CLng(now_page_count) Then     
			RtnPaging = RtnPaging & replace("<a href='?" & now_page & "=" & trim(blockPage) & now_link & "' class='page_box' style='color:#363636'>[id]</a>","[id]",blockPage)
		else
			RtnPaging = RtnPaging & "<a href=""?" & now_page & "=" & trim(blockPage) & now_link & """>"
			RtnPaging = RtnPaging & replace(src_pagenum,"[id]",blockPage)
			RtnPaging = RtnPaging & "</a>"
		end if
		blockPage = CLng(blockPage) + 1     
		if CLng(blockPage) > CLng(tot_page) or CLng(i) >= CLng(page_count) then exit For
	Next
	'************************ 페이징 출력 종료 ***************************      
	'************************ 다음 page_count 개 구문 시작***************************      
	if CLng(blockPage) <= CLng(tot_page) Then  
		RtnPaging = RtnPaging & " " & src_spacer & " "		
		RtnPaging = RtnPaging & "<a href=""?" & now_page & "=" & trim(blockPage) & now_link & """>"
		RtnPaging = RtnPaging & src_Last
		RtnPaging = RtnPaging & "</a>"
	else
		RtnPaging = RtnPaging & " " & src_spacer & " "		
		RtnPaging = RtnPaging & src_Last
	End If     
	'************************ 다음 page_count 개 구문 끝***************************              
	RtnPaging = RtnPaging & "</td></tr></table>"
	Print_Paging = RtnPaging
End Function

' 페이징을 출력해주는 함수
' 값: now_page = 페이지 변수이름, tot_page = 총 페이지 번호, page_count = 한번에 출력할 페이징 갯수
' src_Top = 10개이전 소스, src_Last = 10개 이후 소스, src_now = 현재 페이지 소스, src_pagenu = 선택되지 않은 페이지 소스
' src_spacer = 페이지 중간값
Public Function Edit_Paging(byVal now_page, byVal tot_page)
	Dim RtnPaging
	Dim blockPage
	page_count = 10
	if tot_page = "" or tot_page = 0 then exit Function	' 총 페이지 갯수가 안넘어 오면 에러
	now_page_count = request(now_page)				' 현재 페이지 번호를 받는다.
	if now_page_count = "" then now_page_count = 1
	now_page_count = CLng(now_page_count)
	now_link = Return_Query_Form_String()
	now_link = Return_Remove_String(now_link,now_page)
	if Len(now_link) then now_link = "&" & now_link 
	now_link = replace(now_link,"&&","&")

	' 헤더 페이지 등록
	RtnPaging = "<div class='paginate'>"
	RtnPaging = RtnPaging & "<a href=""?" & now_page & "=1" & now_link & """ class='pre_end'>처음</a>&nbsp;" & vbCrLf		

	 '************************ 이전 page_count 개구문 시작 ***************************    
	blockPage = Int((now_page_count - 1) / page_count) * page_count + 1
	if CLng(blockPage) > CLng(page_count) Then
		RtnPaging = RtnPaging & "<a href=""?" & now_page & "=" & trim(blockPage - 1) & now_link & """ class='pre'>이전"
		RtnPaging = RtnPaging & "</a>" & vbCrLf
	else
		RtnPaging = RtnPaging & "<a href=""#"" class='pre'>이전"
		RtnPaging = RtnPaging & "</a>" & vbCrLf
	End If
	RtnPaging = RtnPaging & "&nbsp;" & vbCrLf
	'************************ 이전 page_count 개 구문 끝***************************              
	'************************ 페이징 출력 시작 ***************************              
	src_now = " <strong>[id]</strong> " & vbCrLf
	src_pagenum = "[id]" & vbCrLf
	for i = 1 to page_count
		If CLng(blockPage) = CLng(now_page_count) Then     
			RtnPaging = RtnPaging & replace(src_now,"[id]",blockPage)
		else
			RtnPaging = RtnPaging & " <a href='?" & now_page & "=" & trim(blockPage) & now_link & "' >" & blockPage & "</a> " & vbCrLf
		end if
		blockPage = CLng(blockPage) + 1     
		if CLng(blockPage) > CLng(tot_page) or CLng(i) >= CLng(page_count) then exit For
		RtnPaging = RtnPaging & " | "
	Next
	RtnPaging = RtnPaging & "&nbsp;" & vbCrLf
	'************************ 페이징 출력 종료 ***************************      

	'************************ 다음 page_count 개 구문 시작***************************      
	if CLng(blockPage) <= CLng(tot_page) Then  
		RtnPaging = RtnPaging & "<a href=""?" & now_page & "=" & trim(blockPage) & now_link & """ class='next'>다음"
		RtnPaging = RtnPaging & "</a>" & vbCrLf
	else
		RtnPaging = RtnPaging & "<a href=""#"" class='next'>다음"
		RtnPaging = RtnPaging & "</a>" & vbCrLf
	End If     
	'************************ 다음 page_count 개 구문 끝***************************              
	' 마지막 페이지가 아닐경우 제일 앞으로 이동 출력
	RtnPaging = RtnPaging & "<a href=""?" & now_page & "=" & trim(tot_page) & now_link & """ class='next_end'>끝</a></div>" & vbCrLf		

	Edit_Paging = RtnPaging
End Function


%>