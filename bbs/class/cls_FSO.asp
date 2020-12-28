<%
Const ForReading = 1, ForWriting = 2, ForAppending = 3
Const TristateUseDefault = -2, TristateTrue = -1, TristateFalse = 0
' ASP 페이지를 HTML페이지로 만들어주는 클래스
Class XTclsFSO
	Private FSO

	Private Sub Class_Initialize()
		' 생성자
		' 접속 커넥션을 저장한다
		Set FSO = CreateObject("Scripting.FileSystemObject")			' FSO를 선언한다.
	End Sub

	'########################################################################
	'### 파일을 복사한다..
	'### sourceURL : 원본 파일 ("/bbs/pds/aaa.txt")
	'### targetURL : 타겟 파일 ("/bbs/pds/bbb.txt")
	'########################################################################
	Function Copy_File(byVal sourceURL,byVal targetURL)
		if LCase(sourceURL) <> LCase(targetURL) then
			FSO.CopyFile server.MapPath(sourceURL), server.MapPath(targetURL)
		end if
	End Function

	'########################################################################
	'### 특정 파일의 내용을 읽어온다.
	'### Page_URL : 파일이 있는 가상위치 
	'### (예 : http://test.bbs/bbs/superxt.txt 일경우 => /bbs/superxt.txt)
	'### 읽어들인 파일내용을 리턴한다.
	'########################################################################
	Function Read_File(byVal Page_URL)
		if Exists_FIle(Page_URL) = false then
			Read_File = ""
			exit function
		end if
		Dim FileHandle				
		Set FileHandle = FSO.OpenTextFile(server.MapPath(Page_URL), ForReading, False, TristateFalse)
		Read_File = FileHandle.ReadAll
		Set FileHandle = nothing
	End Function
	
	'########################################################################
	'### 특정폴더 내의 하위폴더 리스트를 받아준다.
	'### Page_URL : 읽어들일 폴더의 위치
	'### (예 : http://test.bbs/bbs/ 아래의 폴더들을 읽어들이고 싶은경우 => /bbs/ 를 입력)
	'### objSubFolders : 읽어들인 폴더의 내용을 받아서 리턴한다.
	'### FSO.Read_Folder_List "/bbs/", objSubFolders
	'### FOR EACH folder IN objSubFolders
	'### 	folderName = folder.name
	'### NEXT
	'########################################################################
	Public Sub Read_Folder_List(byVal Page_URL, objSubFolders)
		Dim objFolder
		SET objFolder                  = FSO.GetFolder(Server.MapPath(Page_URL))
		SET objSubFolders              = objFolder.SubFolders
		Set objFolder = nothing
	End Sub

	'########################################################################
	'### 신규파일을 생성한다.
	'### FileURL : 저장할 파일의 위치 
	'### (예 : http://test.bbs/bbs/superxt.txt 일경우 => /bbs/superxt.txt)
	'### FileData : 저장할 파일의 내용
	'########################################################################
	Public Sub Create_File(byVal FileURL, byVal FileData)
		Dim f, ts
		Dim NewFileName
	
		NewFileName = server.MapPath(FileURL)
		
		Call Delete_File(FileURL)
		
		FSO.CreateTextFile NewFileName
		Set f = FSO.GetFile(NewFileName)
		Set ts = f.OpenAsTextStream(ForWriting, TristateUseDefault)
		ts.Write FileData
		ts.Close
		Set ts = nothing
		Set f = nothing
	End sub
	
	'########################################################################
	'### 파일의 존재여부를 확인
	'### FileURL : 존재여부를 확인할 경로
	'### (예 : http://test.bbs/bbs/superxt.txt 일경우 => /bbs/superxt.txt)
	'########################################################################
	Function Exists_FIle(byVal FileURL)
		Exists_FIle = FSO.FileExists(server.MapPath(FileURL))
	End Function
	
	'########################################################################
	'### 파일을 삭제한다.
	'### FileURL : 생성할 파일의 위치
	'### (예 : http://test.bbs/bbs/superxt.txt 일경우 => /bbs/superxt.txt)
	'########################################################################
	Public Sub Delete_File(byVal FileURL)
		if Exists_FIle(FileURL) Then FSO.DeleteFile server.MapPath(FileURL)
	End sub
	
	'########################################################################
	'### 폴더를 생성한다.
	'### FileURL : 생성할 폴더의 위치
	'### (예 : http://test.bbs/bbs/superxt.txt 일경우 => /bbs/superxt.txt)
	'########################################################################
	Public Sub Create_Folder(byVal FileURL)
		Dim TmpDir
		Dim TmpMkDir
		Dim TmpLoop
		On Error Resume Next
		if Exists_Folder(FileURL) = false then 
			tmpDir = split(server.MapPath(FileURL) , "\")
			TmpMkDir = tmpDir(0) 
			for TmpLoop = 1 to uBound(TmpDir)
				TmpMkDir = TmpMkDir & "\" & tmpDir(TmpLoop)
				if FSO.FolderExists(TmpMkDir) = false then FSO.CreateFolder TmpMkDir
			Next
		end if
	End sub
	
	'########################################################################
	'### 폴더를 삭제한다.
	'### FileURL : 생성할 폴더의 위치
	'### (예 : http://test.bbs/bbs/ 일경우 => /bbs/)
	'########################################################################
	Public Sub Delete_Folder(byVal FileURL)
		if Exists_Folder(FileURL) Then	FSO.DeleteFolder server.MapPath(FileURL)
	End sub
	
	'########################################################################
	'### 폴더의 존재여부를 확인
	'### FileURL : 존재여부를 확인할 경로
	'### (예 : http://test.bbs/bbs/ 일경우 => /bbs/)
	'########################################################################
	Function Exists_Folder(byVal FileURL)
		FileURL = replace(FileURL,"\","/")
		Exists_Folder = FSO.FolderExists(server.MapPath(FileURL))
	End Function


	'########################################################################
	'### 중복파일이 존재하는지 체크한다.
	'### FileURL : 체크할 파일의 경로
	'### (예 : http://test.bbs/bbs/test.txt 일경우 => /bbs/test.txt)
	'### 리턴값으로 파일명을 리턴한다.
	'########################################################################
	Function FileNameCheck(byVal FileURL)
		dim bExist
		Dim strDirectory, FileName
		Dim intComma,strName,strExt
		dim countFileName, counter_char
		
		bExist = True   
		strDirectory = Left( FileURL,InstrRev(FileURL, "/"))
		FileName = Mid( FileURL,InstrRev(FileURL, "/")+1)
		intComma = InstrRev(FileName, ".") 
		strName = Mid(FileName, 1, intComma - 1)    				' 확장자를 제외한 파일명을 얻는다.
		strExt = Mid(FileName, intComma + 1)     				   	'확장자를 얻는다.
		
		FileName = strName & "." & strExt  										' 우선 같은이름의 파일이 존재한다고 가정
		strFileName = strDirectory & FileName 			    					' 저장할 파일의 완전한 이름을 만듦
		countFileName  = 0														' 파일이 존재할 경우, 이름 뒤에 붙일 숫자를 세팅함.

		Randomize  																' 랜덤문을 선언한다.	
		counter_char = Chr(Int((122 - 97 + 1) * Rnd + 97))	
		Do While bExist 														' 우선 있다고 생각함.
			If (Exists_FIle(strFileName)) Then    							' 같은 이름의 파일이 있을 때
				countFileName = countFileName  + 1    							' 파일명에 숫자를 붙인 새로운 파일 이름 생성
				FileName = strName & counter_char & "_" & countFileName & "." & strExt
				strFileName = strDirectory & FileName
			Else    '같은 이름의 파일이 없을 때
				bExist = False
				' 파일이 존재하지 않으므로.
			End If
		Loop
		
		FileNameCheck = strFileName
	End Function


	Private Sub Class_Terminate()
		' 소멸자
		Set FSO = Nothing
	End Sub

End Class
 
'###########################################  
'사용법
'Set FSO = new XTclsFSO						' 클래스 선언
'Call FSO.Create_Folder("/bbs/pds/abc")		' 폴더 생성
'Set FSO = nothing							' 클래스 종료
'###########################################  
%>