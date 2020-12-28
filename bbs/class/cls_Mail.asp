<!--#include virtual="/bbs/class/cls_FSO.asp" -->
<%
' ASP �������� HTML�������� ������ִ� Ŭ����
Class XTclsMail

	Private FSO
	Private DefaultMailFrom
	Private DefaultMailTo
	Private DefaultMailTitle
	Private DefaultMailContent
	Private ParamCollection			' ���� �Ķ����
	Private ParamCounter			' �Ķ������ ī����		
	
	Private Sub Class_Initialize()
	
		Set FSO = new XTclsFSO					' FSO ���� Ŭ���� ����
		ParamCollection = Array()
		ParamCounter = 0
	
	End Sub

	Public Property Let MailFrom(strParam)
		DefaultMailFrom = strParam
	End Property

	Public Property Let MailTo(strParam)
		DefaultMailTo = strParam
	End Property

	Public Property Let MailTitle(strParam)
		DefaultMailTitle = strParam
	End Property

	Public Property Let MailURL(strParam)
		DefaultMailContent = FSO.Read_File(strParam)
	End Property

	Public Property Let MailHTML(strParam)
		DefaultMailContent = strParam
	End Property
	'########################################################
    ' �迭�� �Ű������� �����.
	' 	PName : �Ű������� �̸� , @en_type
	' 	PType : ������ Ÿ������ DataTypeEnum �� �� �ϳ� ** (���� �Ʒ� �ּ� ����)
	' 	PDirection : �Ű������� ������ ParameterDirectionEnum �� �� �ϳ� (�߰��� : adParamInput) ** �Ʒ� ����
	' 	PSize : �Ű������� �ִ� ����(���ڿ� �Ű������� ���� �ʿ�)
	' 	PValue : �Ű������� ��
	'########################################################
	Public Function MakeParam(P_Source,P_Result)
		ReDim Preserve ParamCollection(ParamCounter)
		ParamCollection(ParamCounter) = Array(P_Source, P_Result)
		ParamCounter = ParamCounter + 1		
	End Function

	Public Function ClearParam()
		ReDim ParamCollection(0)
		ParamCollection = Array()
		ParamCounter = 0
	End Function

	Public Function SendMail()
		Dim mail_body,mail_title
		Dim objMail
		Dim params, LoopCnt_i
		mail_title  = DefaultMailTitle
		mail_body  = DefaultMailContent

	    If ParamCounter > 0 then 
		    params = ParamCollection
		    For LoopCnt_i = LBound(params) To UBound(params)
				mail_title = replace(mail_title,params(LoopCnt_i)(0),params(LoopCnt_i)(1))
				mail_body = replace(mail_body,params(LoopCnt_i)(0),params(LoopCnt_i)(1))
		    Next
	    End If

		Set objMail = Server.CreateObject("CDONTS.NewMail")
		objMail.From =  DefaultMailFrom
		objMail.To = DefaultMailTo
		objMail.Subject= mail_title
		objMail.BodyFormat = 0  				   	' HTML�ϋ� 0, �Ϲ� Text�϶� 1 ���� �����Ѵ�.
		objMail.MailFormat = 0     					' HTML�ϋ� 0, �Ϲ� Text�϶� 1 ���� �����Ѵ�.
		objMail.body = mail_body		   			'���� ���ڿ�html�� Body�� �����Ѵ�.
		objMail.send               					'���� ������ ������.
		Set objMail = nothing

	End Function

	Private Sub Class_Terminate()
		' �Ҹ���
		Set FSO = Nothing
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