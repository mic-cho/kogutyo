<!--#include virtual="/bbs/lib/defGlobal.asp" -->
<%
    FilePath = Request("FilePath")
    FileName = Request("filename")
    SaveName = Request("SaveName")
	
	FullFilePath = DefUploadDir & FilePath & "/" & filename
	FullFilePath = Replace(FullFilePath,"//","/")
	
	if Len(SaveName) = 0 then SaveName = FileName
	'파일 이름
    Response.ContentType = "application/unknown"
    'ContentType 를 선언합니다.

    Response.AddHeader "Content-Disposition","attachment; filename=" & SaveName 
    '헤더값이 첨부파일을 선언합니다.

    Set objStream = Server.CreateObject("ADODB.Stream")
    'Stream 을 이용합니다.

    objStream.Open
    '무엇이든 Set 으로 정의했으면 열어야 겠지요^^

    objStream.Type = 1

    objStream.LoadFromFile Server.MapPath(FullFilePath)
    '절대경로 입니다. 

	download = objStream.Read


    Response.BinaryWrite download 
    '이게 보통 Response.Redirect 로 파일로 연결시켜주는 부분을 대신하여 사용된 것입니다.

    Set objstream = nothing 
    '초기화시키구요.
%> 