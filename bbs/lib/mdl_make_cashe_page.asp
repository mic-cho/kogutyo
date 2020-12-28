<!--#include virtual="/bbs/class/cls_AspToHTML.asp" -->
<%
'현재 보고 있는 페이지를 캐쉬 파일로 만들어주는 함수 (주로 인덱스 페이지에 사용한다)
'make_page_source : 원본 페이지 (ex : http://www.superxt.com/superxt/superxt.asp)
'make_page_unit : 시간단위 설정 , "h" 시간, "m" 분
'make_page_time : 분 설정
'make_page_url : 페이지가 생성될 URL
'make_file_name : 만들어질 파일명
'Make_Page_Run : 강제로 페이지 생성을 원할경우 True
Public Function MakeCashePage(byVal make_page_source, byVal make_page_unit, byVal make_page_time,byVal make_page_url,byVal make_file_name, byVal Make_Page_Run)
	dim now_http, now_root
	dim page_filename,page_root,objFSO,BoolPageMake
	dim objFolder,objFile,page_make_time,ShowPage
	
	' 캐쉬를 안쓸경우 사용
	if request("make_cashe_page") = "Y" then 
		MakeCashePage = false
		exit function
	end if

	if Len(make_page_source) = 0 then make_page_source = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("URL")
	if InStr(make_page_source,"?") > 0 then make_page_source = Left(make_page_source,InStr(make_page_source,"?") - 1)
	if Len(make_page_unit) = 0 then make_page_unit = "h"
	if Len(make_page_time) = 0 then make_page_time = 1
	if Len(make_page_url) = 0 then make_page_url = DefUploadDir
	if Len(make_file_name) = 0 then make_file_name = replace(Request.ServerVariables("URL"),"/","_")
	
	page_filename = make_file_name
	page_root = make_page_url & page_filename
	Set objFSO = CreateObject("Scripting.FileSystemObject")
	BoolPageMake = false
	if objFSO.FileExists(server.MapPath(page_root)) = true then
		' 기존페이지 출력
		SET objFolder = objFSO.GetFolder(server.MapPath(DefUploadDir))
		FOR EACH objFile IN objFolder.Files
			if page_filename = trim(objFile.Name) then
				page_make_time = objFile.DateLastModified
				exit for
			end if
		NEXT
		set objFile = nothing
		if dateDiff(make_page_unit,page_make_time,now) > (make_page_time - 1) then BoolPageMake = true
		ShowPage = false
		server.Execute(page_root)
		response.Flush()
	else
		BoolPageMake = true
		ShowPage = true
	end if
	
	if BoolPageMake or Make_Page_Run then
		' 페이지를 만들고 출력
		Set objAspToHTML = New AspToHTML
		objAspToHTML.executeURL = make_page_source & "?make_cashe_page=Y"    ' HTML로 만들 ASP URL
		objAspToHTML.charSet = "euc-kr"                        		' HTML로 만들 때 CharSet, 기본값 euc-kr
		objAspToHTML.savingFilePath = make_page_url                  	' HTML을 저장할 폴더 경로
		objAspToHTML.savingFileName = page_filename             ' HTML로 저장할 파일명
		objAspToHTML.isViewResult = False                      ' 결과보기, 기본값 True
		objAspToHTML.createFolder                                ' HTML 파일을 저장할 폴더 생성
		objAspToHTML.makeHTML                                    ' HTML 생성
		Set objAspToHTML = Nothing
	end if
	set objFSO = nothing
	if ShowPage then server.Execute(page_root)
	response.Flush()
	MakeCashePage = true
End Function
%>