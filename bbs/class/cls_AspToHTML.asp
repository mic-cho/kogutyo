<%
' ASP �������� HTML�������� ������ִ� Ŭ����
Class AspToHTML

      Private strExecuteURL
      Private strSavingFilePath
      Private strSavingFileName
      Private strCharSet
      Private blIsRewrite
      private blIsViewResult

      Private Sub Class_Initialize()

          ' ������
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

          ' strExecuteURL - ������ ASP ������ ��ü ��� (�� : http://www.aaa.com/index.asp)

          Set objWinHTTP = Server.CreateObject("WinHttp.WinHttpRequest.5.1")

          If objWinHTTP Is Nothing Then Set objWinHTTP = Server.CreateObject("MSXML2.ServerXMLHTTP")
          If objWinHTTP Is Nothing Then Set objWinHTTP = Server.CreateObject("Microsoft.XMLHTTP")

          objWinHTTP.Open "GET", strExecuteURL, False
          ' objWinHTTP.SetCredentials "ID", "PWD", 0    ' �α����� �ʿ��� ������ ������ �� ���
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

          strCurrentDirectory = createFolder()                                                                     ' ������ ���� ���
          If (blIsRewrite = True) Then strSavingFileName = getFileName(strSavingFileName, strCurrentDirectory)    ' ������ ���� ��
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

          strName = Mid(strFileName, 1, InstrRev(strFileName, ".") - 1)    ' Ȯ���ڸ� ������ ���ϸ��� ��´�.
          strExt = Mid(strFileName, InstrRev(strFileName, ".") + 1)        ' Ȯ���ڸ� ��´�

          Set objFSO = Server.CreateObject("Scripting.FileSystemObject")

          blExist = True                                                        ' �켱 �����̸��� ������ �����Ѵٰ� ����
          strFileWholePath = strDirectoryPath & "\" & strName & "." & strExt    ' ������ ������ ������ �̸�(������ �������� ���) ����
          intCountFileName = 0                                                  ' ������ ������ ���, �̸� �ڿ� ���� ���ڸ� ������.


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
              Response.Write "<font color='red'>" & strSavingFileName & "</font>������ ���������� �����Ǿ����ϴ�!<br><br>" & vbCrLf

              If (Left(strSavingFilePath, 1) = "/") Then strSavingFilePath = Mid(strSavingFilePath, 2, Len(strSavingFilePath))
              If (Right(strSavingFilePath, 1) = "/") Then strSavingFilePath = Mid(strSavingFilePath, 1, Len(strSavingFilePath)-1)
              
              Set objFileInfo = objFSO.GetFile(strUserFileName)
              Response.Write " &nbsp;&nbsp; - ���� ��� : " & objFileInfo.Path & "<br>" & vbCrLf
              Response.Write " &nbsp;&nbsp; - ���� ������ : " & objFileInfo.Size & "<br>" & vbCrLf
              Response.Write " &nbsp;&nbsp; - ���� ������¥ : " & objFileInfo.DateCreated & "<br>" & vbCrLf
              Response.Write " &nbsp;&nbsp; - <a href='/" & strSavingFilePath & "/" & strSavingFileName & "' target='_blank'>������ ���� ����</a><br><br>" & vbCrLf
              Set objFileInfo = Nothing
          Else
              Response.Write "<font color='red'>" & strSavingFileName & "</font>���� ������ �����Ͽ����ϴ�!<br>" & vbCrLf
          End If

          Set objFSO = Nothing

      End Sub


      Private Sub Class_Terminate()
    
          ' �Ҹ���

      End Sub


  End Class


'****************************************************************************************
'  /* ���⼭ ���� ��� �� */
'  Set objAspToHTML = New AspToHTML
'
'  objAspToHTML.executeURL = "http://www.bebehouse.com/"    ' HTML�� ���� ASP URL
'  ' objAspToHTML.charSet = "euc-kr"                        ' HTML�� ���� �� CharSet, �⺻�� euc-kr
'  objAspToHTML.savingFilePath = "/temp/"                   ' HTML�� ������ ���� ���
'  objAspToHTML.savingFileName = "temp.html"                ' HTML�� ������ ���ϸ�
'  ' objAspToHTML.isViewResult = False                      ' �������, �⺻�� True
'  ' objAspToHTML.isRewrite = True                          ' ���� ����� ��뿩��, �⺻�� False(True�̸� ���ϸ�(1).html�� ���� �������� ����
'
'  objAspToHTML.createFolder                                ' HTML ������ ������ ���� ����
'
'  objAspToHTML.makeHTML                                    ' HTML ����
'
'  Set objAspToHTML = Nothing
'****************************************************************************************
%>