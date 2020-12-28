<%
Const ForReading = 1, ForWriting = 2, ForAppending = 3
Const TristateUseDefault = -2, TristateTrue = -1, TristateFalse = 0
' ASP �������� HTML�������� ������ִ� Ŭ����
Class XTclsFSO
	Private FSO

	Private Sub Class_Initialize()
		' ������
		' ���� Ŀ�ؼ��� �����Ѵ�
		Set FSO = CreateObject("Scripting.FileSystemObject")			' FSO�� �����Ѵ�.
	End Sub

	'########################################################################
	'### ������ �����Ѵ�..
	'### sourceURL : ���� ���� ("/bbs/pds/aaa.txt")
	'### targetURL : Ÿ�� ���� ("/bbs/pds/bbb.txt")
	'########################################################################
	Function Copy_File(byVal sourceURL,byVal targetURL)
		if LCase(sourceURL) <> LCase(targetURL) then
			FSO.CopyFile server.MapPath(sourceURL), server.MapPath(targetURL)
		end if
	End Function

	'########################################################################
	'### Ư�� ������ ������ �о�´�.
	'### Page_URL : ������ �ִ� ������ġ 
	'### (�� : http://test.bbs/bbs/superxt.txt �ϰ�� => /bbs/superxt.txt)
	'### �о���� ���ϳ����� �����Ѵ�.
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
	'### Ư������ ���� �������� ����Ʈ�� �޾��ش�.
	'### Page_URL : �о���� ������ ��ġ
	'### (�� : http://test.bbs/bbs/ �Ʒ��� �������� �о���̰� ������� => /bbs/ �� �Է�)
	'### objSubFolders : �о���� ������ ������ �޾Ƽ� �����Ѵ�.
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
	'### �ű������� �����Ѵ�.
	'### FileURL : ������ ������ ��ġ 
	'### (�� : http://test.bbs/bbs/superxt.txt �ϰ�� => /bbs/superxt.txt)
	'### FileData : ������ ������ ����
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
	'### ������ ���翩�θ� Ȯ��
	'### FileURL : ���翩�θ� Ȯ���� ���
	'### (�� : http://test.bbs/bbs/superxt.txt �ϰ�� => /bbs/superxt.txt)
	'########################################################################
	Function Exists_FIle(byVal FileURL)
		Exists_FIle = FSO.FileExists(server.MapPath(FileURL))
	End Function
	
	'########################################################################
	'### ������ �����Ѵ�.
	'### FileURL : ������ ������ ��ġ
	'### (�� : http://test.bbs/bbs/superxt.txt �ϰ�� => /bbs/superxt.txt)
	'########################################################################
	Public Sub Delete_File(byVal FileURL)
		if Exists_FIle(FileURL) Then FSO.DeleteFile server.MapPath(FileURL)
	End sub
	
	'########################################################################
	'### ������ �����Ѵ�.
	'### FileURL : ������ ������ ��ġ
	'### (�� : http://test.bbs/bbs/superxt.txt �ϰ�� => /bbs/superxt.txt)
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
	'### ������ �����Ѵ�.
	'### FileURL : ������ ������ ��ġ
	'### (�� : http://test.bbs/bbs/ �ϰ�� => /bbs/)
	'########################################################################
	Public Sub Delete_Folder(byVal FileURL)
		if Exists_Folder(FileURL) Then	FSO.DeleteFolder server.MapPath(FileURL)
	End sub
	
	'########################################################################
	'### ������ ���翩�θ� Ȯ��
	'### FileURL : ���翩�θ� Ȯ���� ���
	'### (�� : http://test.bbs/bbs/ �ϰ�� => /bbs/)
	'########################################################################
	Function Exists_Folder(byVal FileURL)
		FileURL = replace(FileURL,"\","/")
		Exists_Folder = FSO.FolderExists(server.MapPath(FileURL))
	End Function


	'########################################################################
	'### �ߺ������� �����ϴ��� üũ�Ѵ�.
	'### FileURL : üũ�� ������ ���
	'### (�� : http://test.bbs/bbs/test.txt �ϰ�� => /bbs/test.txt)
	'### ���ϰ����� ���ϸ��� �����Ѵ�.
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
		strName = Mid(FileName, 1, intComma - 1)    				' Ȯ���ڸ� ������ ���ϸ��� ��´�.
		strExt = Mid(FileName, intComma + 1)     				   	'Ȯ���ڸ� ��´�.
		
		FileName = strName & "." & strExt  										' �켱 �����̸��� ������ �����Ѵٰ� ����
		strFileName = strDirectory & FileName 			    					' ������ ������ ������ �̸��� ����
		countFileName  = 0														' ������ ������ ���, �̸� �ڿ� ���� ���ڸ� ������.

		Randomize  																' �������� �����Ѵ�.	
		counter_char = Chr(Int((122 - 97 + 1) * Rnd + 97))	
		Do While bExist 														' �켱 �ִٰ� ������.
			If (Exists_FIle(strFileName)) Then    							' ���� �̸��� ������ ���� ��
				countFileName = countFileName  + 1    							' ���ϸ� ���ڸ� ���� ���ο� ���� �̸� ����
				FileName = strName & counter_char & "_" & countFileName & "." & strExt
				strFileName = strDirectory & FileName
			Else    '���� �̸��� ������ ���� ��
				bExist = False
				' ������ �������� �����Ƿ�.
			End If
		Loop
		
		FileNameCheck = strFileName
	End Function


	Private Sub Class_Terminate()
		' �Ҹ���
		Set FSO = Nothing
	End Sub

End Class
 
'###########################################  
'����
'Set FSO = new XTclsFSO						' Ŭ���� ����
'Call FSO.Create_Folder("/bbs/pds/abc")		' ���� ����
'Set FSO = nothing							' Ŭ���� ����
'###########################################  
%>