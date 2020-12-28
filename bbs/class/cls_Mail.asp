<!--#include virtual="/bbs/class/cls_FSO.asp" -->
<%
' ASP 페이지를 HTML페이지로 만들어주는 클래스
Class XTclsMail

	Private FSO
	Private DefaultMailFrom
	Private DefaultMailTo
	Private DefaultMailTitle
	Private DefaultMailContent
	Private ParamCollection			' 사용될 파라메터
	Private ParamCounter			' 파라메터의 카운터		
	
	Private Sub Class_Initialize()
	
		Set FSO = new XTclsFSO					' FSO 관련 클래스 선언
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
    ' 배열로 매개변수를 만든다.
	' 	PName : 매개변수의 이름 , @en_type
	' 	PType : 데이터 타입으로 DataTypeEnum 값 중 하나 ** (제일 아래 주석 참고)
	' 	PDirection : 매개변수의 종류로 ParameterDirectionEnum 값 중 하나 (추가시 : adParamInput) ** 아래 참고
	' 	PSize : 매개변수의 최대 길이(문자열 매개변수는 지정 필요)
	' 	PValue : 매개변수의 값
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
		objMail.BodyFormat = 0  				   	' HTML일떄 0, 일반 Text일때 1 으로 설정한다.
		objMail.MailFormat = 0     					' HTML일떄 0, 일반 Text일때 1 으로 설정한다.
		objMail.body = mail_body		   			'만든 문자열html을 Body로 연결한다.
		objMail.send               					'이제 메일을 보낸다.
		Set objMail = nothing

	End Function

	Private Sub Class_Terminate()
		' 소멸자
		Set FSO = Nothing
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