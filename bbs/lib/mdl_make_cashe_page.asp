<!--#include virtual="/bbs/class/cls_AspToHTML.asp" -->
<%
'���� ���� �ִ� �������� ĳ�� ���Ϸ� ������ִ� �Լ� (�ַ� �ε��� �������� ����Ѵ�)
'make_page_source : ���� ������ (ex : http://www.superxt.com/superxt/superxt.asp)
'make_page_unit : �ð����� ���� , "h" �ð�, "m" ��
'make_page_time : �� ����
'make_page_url : �������� ������ URL
'make_file_name : ������� ���ϸ�
'Make_Page_Run : ������ ������ ������ ���Ұ�� True
Public Function MakeCashePage(byVal make_page_source, byVal make_page_unit, byVal make_page_time,byVal make_page_url,byVal make_file_name, byVal Make_Page_Run)
	dim now_http, now_root
	dim page_filename,page_root,objFSO,BoolPageMake
	dim objFolder,objFile,page_make_time,ShowPage
	
	' ĳ���� �Ⱦ���� ���
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
		' ���������� ���
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
		' �������� ����� ���
		Set objAspToHTML = New AspToHTML
		objAspToHTML.executeURL = make_page_source & "?make_cashe_page=Y"    ' HTML�� ���� ASP URL
		objAspToHTML.charSet = "euc-kr"                        		' HTML�� ���� �� CharSet, �⺻�� euc-kr
		objAspToHTML.savingFilePath = make_page_url                  	' HTML�� ������ ���� ���
		objAspToHTML.savingFileName = page_filename             ' HTML�� ������ ���ϸ�
		objAspToHTML.isViewResult = False                      ' �������, �⺻�� True
		objAspToHTML.createFolder                                ' HTML ������ ������ ���� ����
		objAspToHTML.makeHTML                                    ' HTML ����
		Set objAspToHTML = Nothing
	end if
	set objFSO = nothing
	if ShowPage then server.Execute(page_root)
	response.Flush()
	MakeCashePage = true
End Function
%>