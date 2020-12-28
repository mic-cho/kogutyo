<%
' ASP 페이지를 HTML페이지로 만들어주는 클래스
Class AspToHTML

      Private strExecuteURL
      Private strSavingFilePath
      Private strSavingFileName
      Private strCharSet
      Private blIsRewrite
      private blIsViewResult

      Private Sub Class_Initialize()

          ' 생성자
		  strSavingFileName = CStr(Date()) & ".html"
		  strCharSet = "euc-kr"
		  blIsRewrite = False
          blIsViewResult = True

      End Sub


      Public Property Get executeURL()

          executeURL = strExecuteURL

      End Property

      Public Property Let executeURL(strParam)

          strExecuteURL = strParam

      End Property


      Public Property Get savingFilePath()

          savingFilePath = strSavingFilePath

      End Property

      Public Property Let savingFilePath(strParam)

          strSavingFilePath = strParam

      End Property


      Public Property Get savingFileName()

          savingFileName = strSavingFileName

      End Property

      Public Property Let savingFileName(strParam)

          strSavingFileName = strParam

      End Property


      Public Property Get charSet()

          charSet = strCharSet

      End Property

      Public Property Let charSet(strParam)

          strCharSet = strParam

      End Property


      Public Property Get isViewResult()

          isViewResult = blIsViewResult

      End Property

      Public Property Let isViewResult(blParam)

          blIsViewResult = blParam

      End Property


      Public Property Get isRewrite()

          isRewrite = blIsRewrite

      End Property

      Public Property Let isRewrite(blParam)

          blIsRewrite = blParam

      End Property


      Public Sub makeHTML()

          Dim strCurrentDirectory
          Dim strUserFileName
          Dim objWinHTTP
          Dim objFSO
          Dim objFile
          Dim objFileInfo

          ' strExecuteURL - 실행할 ASP 파일의 전체 경로 (예 : http://www.aaa.com/index.asp)

          Set objWinHTTP = Server.CreateObject("WinHttp.WinHttpRequest.5.1")

          If objWinHTTP Is Nothing Then Set objWinHTTP = Server.CreateObject("MSXML2.ServerXMLHTTP")
          If objWinHTTP Is Nothing Then Set objWinHTTP = Server.CreateObject("Microsoft.XMLHTTP")

          objWinHTTP.Open "GET", strExecuteURL, False
          ' objWinHTTP.SetCredentials "ID", "PWD", 0    ' 로그인이 필요한 서버에 접근할 때 사용
          objWinHTTP.Send() 

          If (objWinHTTP.Status = 200) Then
              strReturnMsg = getStreamBinaryToString(objWinHTTP.ResponseBody)
		  Else
		      Response.Write "Error Status : " & objWinHTTP.Status & "<br>" & vbCrLf
			  Response.Write "Error Message : " & objWinHTTP.StatusText
			  Set objWinHTTP = Nothing
			  Response.End
			  Exit Sub
		  End If

          Set objWinHTTP = Nothing

          strCurrentDirectory = createFolder()                                                                     ' 저장할 파일 경로
          If (blIsRewrite = True) Then strSavingFileName = getFileName(strSavingFileName, strCurrentDirectory)    ' 저장할 파일 명
          strUserFileName = strCurrentDirectory & "\" & strSavingFileName          

          Set objFSO = Server.CreateObject("Scripting.FileSystemObject")

          Set objFile = objFSO.CreateTextFile(strUserFileName, True)
          Set objFile = Nothing

          Set objFile = objFSO.OpenTextFile(strUserFileName, 8, True)
          objFile.WriteLine strReturnMsg

          objFile.Close
          Set objFile = Nothing

          If (blIsViewResult = True) Then Call checkEnd(strUserFileName)

          Set objFSO = Nothing

      End Sub


      Public Function getStreamBinaryToString(objBinary)

          ' // Create Stream object
          Dim objBinaryStream 'As New Stream
          Dim objTempBabyStream

          Set objBinaryStream = Server.CreateObject("ADODB.Stream")

          ' // Specify stream type - we want To save text/string data.
          objBinaryStream.Type = 1

          ' // Open the stream And write text/string data To the object
          objBinaryStream.Open
          objBinaryStream.Write objBinary

          ' // Change stream type To binary
          objBinaryStream.Position = 0
          objBinaryStream.Type = 2

          ' // Specify charset For the source text (unicode) data.
          If Len(Trim(strCharSet)) > 0 Then
              objBinaryStream.CharSet = strCharSet
          Else
              ' BinaryStream.CharSet = "us-ascii"
              objBinaryStream.CharSet = "euc-kr"
          End If

          objTempBinaryStream = objBinaryStream.ReadText

          Set objBinaryStream = Nothing

          ' //Open the stream And get binary data from the object
          getStreamBinaryToString = objTempBinaryStream

      End Function


      Public Function createFolder()

          Dim objFSO
          Dim strReturnResult
          Dim arrTempFolder
          Dim strTempPath
          Dim i

          strReturnResult = Server.MapPath(strSavingFilePath)

          Set objFSO = Server.CreateObject("Scripting.FileSystemObject")

          arrTempFolder = Split(strReturnResult, "\", -1)

          If IsArray(arrTempFolder) Then
			  strTempPath = arrTempFolder(0)

              For i=1 To UBound(arrTempFolder)
                  If (arrTempFolder(i) <> "") Then
                      strTempPath = strTempPath & "\" & arrTempFolder(i)

                      If (objFSO.FolderExists(strTempPath) = False) Then objFSO.CreateFolder(strTempPath)
                  End If
              Next
          Else
              If (objFSO.FolderExists(strReturnResult) = False) Then objFSO.CreateFolder(strReturnResult)
          End If

          Set objFSO = Nothing

          createFolder = strReturnResult

      End Function


      Public Function getFileName(strFileName, strDirectoryPath)

          Dim strName
          Dim strExt
          Dim objFSO
          Dim blExist
          Dim strFileWholePath
          Dim intCountFileName

          strName = Mid(strFileName, 1, InstrRev(strFileName, ".") - 1)    ' 확장자를 제외한 파일명을 얻는다.
          strExt = Mid(strFileName, InstrRev(strFileName, ".") + 1)        ' 확장자를 얻는다

          Set objFSO = Server.CreateObject("Scripting.FileSystemObject")

          blExist = True                                                        ' 우선 같은이름의 파일이 존재한다고 가정
          strFileWholePath = strDirectoryPath & "\" & strName & "." & strExt    ' 저장할 파일의 완전한 이름(완전한 물리적인 경로) 구성
          intCountFileName = 0                                                  ' 파일이 존재할 경우, 이름 뒤에 붙일 숫자를 세팅함.


          Do While blExist
              If (objFSO.FileExists(strFileWholePath)) Then
                  intCountFileName = intCountFileName + 1
                  strFileName = strName & "(" & intCountFileName & ")." & strExt
                  strFileWholePath = strDirectoryPath & "\" & strFileName
              Else
                  blExist = False
              End If
          Loop

          Set objFSO = Nothing

          getFileName = strFileName

      End Function 


      Public Sub checkEnd(strUserFileName)

          Dim objFSO
          Dim objFileInfo

          Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
    
          If (objFSO.FileExists(strUserFileName) = True) Then
              Response.Write "<font color='red'>" & strSavingFileName & "</font>파일이 성공적으로 생성되었습니다!<br><br>" & vbCrLf

              If (Left(strSavingFilePath, 1) = "/") Then strSavingFilePath = Mid(strSavingFilePath, 2, Len(strSavingFilePath))
              If (Right(strSavingFilePath, 1) = "/") Then strSavingFilePath = Mid(strSavingFilePath, 1, Len(strSavingFilePath)-1)
              
              Set objFileInfo = objFSO.GetFile(strUserFileName)
              Response.Write " &nbsp;&nbsp; - 파일 경로 : " & objFileInfo.Path & "<br>" & vbCrLf
              Response.Write " &nbsp;&nbsp; - 파일 사이즈 : " & objFileInfo.Size & "<br>" & vbCrLf
              Response.Write " &nbsp;&nbsp; - 파일 생성날짜 : " & objFileInfo.DateCreated & "<br>" & vbCrLf
              Response.Write " &nbsp;&nbsp; - <a href='/" & strSavingFilePath & "/" & strSavingFileName & "' target='_blank'>생성된 파일 보기</a><br><br>" & vbCrLf
              Set objFileInfo = Nothing
          Else
              Response.Write "<font color='red'>" & strSavingFileName & "</font>파일 생성에 실패하였습니다!<br>" & vbCrLf
          End If

          Set objFSO = Nothing

      End Sub


      Private Sub Class_Terminate()
    
          ' 소멸자

      End Sub


  End Class


'****************************************************************************************
'  /* 여기서 부터 사용 예 */
'  Set objAspToHTML = New AspToHTML
'
'  objAspToHTML.executeURL = "http://www.bebehouse.com/"    ' HTML로 만들 ASP URL
'  ' objAspToHTML.charSet = "euc-kr"                        ' HTML로 만들 때 CharSet, 기본값 euc-kr
'  objAspToHTML.savingFilePath = "/temp/"                   ' HTML을 저장할 폴더 경로
'  objAspToHTML.savingFileName = "temp.html"                ' HTML로 저장할 파일명
'  ' objAspToHTML.isViewResult = False                      ' 결과보기, 기본값 True
'  ' objAspToHTML.isRewrite = True                          ' 파일 덮어쓰기 허용여부, 기본값 False(True이면 파일명(1).html과 같은 형식으로 생성
'
'  objAspToHTML.createFolder                                ' HTML 파일을 저장할 폴더 생성
'
'  objAspToHTML.makeHTML                                    ' HTML 생성
'
'  Set objAspToHTML = Nothing
'****************************************************************************************
%>