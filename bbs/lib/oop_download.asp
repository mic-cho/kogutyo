<!--#include virtual="/bbs/lib/defGlobal.asp" -->
<%
    FilePath = Request("FilePath")
    FileName = Request("filename")
    SaveName = Request("SaveName")
	
	FullFilePath = DefUploadDir & FilePath & "/" & filename
	FullFilePath = Replace(FullFilePath,"//","/")
	
	if Len(SaveName) = 0 then SaveName = FileName
	'���� �̸�
    Response.ContentType = "application/unknown"
    'ContentType �� �����մϴ�.

    Response.AddHeader "Content-Disposition","attachment; filename=" & SaveName 
    '������� ÷�������� �����մϴ�.

    Set objStream = Server.CreateObject("ADODB.Stream")
    'Stream �� �̿��մϴ�.

    objStream.Open
    '�����̵� Set ���� ���������� ����� ������^^

    objStream.Type = 1

    objStream.LoadFromFile Server.MapPath(FullFilePath)
    '������ �Դϴ�. 

	download = objStream.Read


    Response.BinaryWrite download 
    '�̰� ���� Response.Redirect �� ���Ϸ� ��������ִ� �κ��� ����Ͽ� ���� ���Դϴ�.

    Set objstream = nothing 
    '�ʱ�ȭ��Ű����.
%> 