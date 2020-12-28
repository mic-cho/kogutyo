<%
Const DefUploadDir = "http://img.bk-aa.com/bbs/file_upload.asp"
Const DefSKINDir = "/skin/"
Const DefCookieID = "IDX"
Const DefMaxMonthChargeMoney = 300000	' �� �ִ� �����ݾ�


Public Sub MovePage(ByVal URL , ByVal MoveType , ByVal Message )
'////////////////////////////////////////
'/// MoveType
'///   -> BACK : ������������ �̵�
'///   -> CLOSE : â�� �ݴ´�.
'///   -> ��Ÿ : �׳� �̵��Ѵ�.
'///////////////////////////////////////
	Print_Script = ""
	if Len(Message) Then Print_Script = "alert(""" & Message & """);" & vbCrLf
	URL = replace(URL,"?&","?")
	Select Case MoveType
	Case "BACK"
		Print_Script = Print_Script & "history.back();"  & vbCrLf
	Case "CLOSE"
		Print_Script = Print_Script & "self.close();"  & vbCrLf
	Case "PRINT"
		Print_Script = "document.write(""" & Message & """);"  & vbCrLf
	Case Else
'		Print_Script = Print_Script & "location.href = '" & URL & "';"  & vbCrLf
		Print_Script = Print_Script & "MovePage('" & URL & "');"  & vbCrLf
	End Select

	response.Write("<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.01 Transitional//EN"" ""http://www.w3.org/TR/html4/loose.dtd"">")
	response.Write("<html>")
	response.Write("<head>")
	response.Write("<meta http-equiv=""Content-Type"" content=""text/html; charset=euc-kr"">")
	response.Write("<title>Page</title>")
	response.Write("<script language=""JavaScript"" type=""text/JavaScript"" src=""/bbs/js/GlobalDef.js""></script>")
	response.Write("</head><body></body>")
	response.Write("<script language=""JavaScript"" type=""text/JavaScript"">")
	response.Write(Print_Script)	
	response.Write("</script>")
	response.Write("</html>")

	response.End()
End sub

'################################################################################
'### ���ڿ� ���̸� �߶��ִ� �Լ�
'### str : �����ҽ�
'### strlen : �߶���� ����
'################################################################################
Function getString(str, strlen)
    dim rValue
    dim nLength
	if str = "" or isNull(str) then 
		getString = ""
		exit function
	end if
    nLength = 0.00
    rValue = ""
	chk_boolean = true
    for f = 1 to len(str)
        tmpStr = MID(str,f,1)
        tmpLen = ASC(tmpStr)
        if (tmpLen = 60) then
            leng = nLength                     '"<"�� �±� ������ ��ġ �ľ�
			chk_boolean = false
        elseif (tmpLen = 62) then
            nLength = leng                     '">"�� �±� ������ ��ġ�� �ľ��Ͽ� ������ ó���� ��ġ ���ʹ� ���ڿ� ���̿��� ����
			chk_boolean = true
        elseif  (tmpLen < 0) And chk_boolean then
            nLength = nLength + 1.21           '�ѱ��϶� ���̰� ����
            rValue = rValue & tmpStr
        elseif (tmpLen >= 97 and tmpLen <= 122) And chk_boolean then
            nLength = nLength + 0.71           '�����ҹ��� ���̰� ����
            rValue = rValue & tmpStr
        elseif (tmpLen >= 65 and tmpLen <= 90) And chk_boolean then
            nLength = nLength + 0.82           '�����빮�� ���̰� ����
            rValue = rValue & tmpStr
        elseif (tmpLen >= 48 and tmpLen <= 57) And chk_boolean then
            nLength = nLength + 0.61           '���� ���̰� ����
            rValue = rValue & tmpStr
        elseif chk_boolean then
            nLength = nLength + 0.71           'Ư������ ��ȣ��...
            rValue = rValue & tmpStr
        end if
        If (nLength > strlen) then
            rValue = rValue & "..."
            exit for
        end if
    next
    getString = rValue
End Function

Public Function ReplaceBR(ByVal TmpString )

	if isNull(TmpString) then TmpString = ""
	
	ReplaceBR = replace(TmpString,chr(13)&chr(10),"<br>")

End Function

' ���ڿ��� 0�� zLen ���������� ����ִ� �ڸ��� �߰������ִ� �Լ�
Public Function Tmp_ZeroString(ByVal zTemp,byVal zLen)
	retTemp = ""
	if isNull(zTemp) then exit function 
	for zCount = Len(zTemp) + 1 to zLen
		retTemp = retTemp & "0"
	next
	retTemp = retTemp & trim(zTemp)
	Tmp_ZeroString = Right(retTemp,zLen)
End Function

' �ʸ� �ð����� �����Ѵ�
function SecToTime(byVal TmpSec)
	TmpSec = CCur(TmpSec)
	if TmpSec < 1 then
		SecToTime = "00:00:00"
		exit function 
	end if
	' �ð� ��� : Fix(��ü�� / 3600 (60�� * 60��) : �Ҽ��� ���ֱ�) = �ð�
	GetTime = Fix(TmpSec / 3600)
	' �ð��� ������ ������ �ð��� ��´�.
	TmpIdleTime = TmpSec - (GetTime * 3600)
	'���� ����Ѵ�.
	GetMin = Fix(TmpIdleTime / 60)
	' �ʸ� �����Ѵ�.
	GetSec = Round(TmpIdleTime - (GetMin * 60),0)
	
	
	rtnTime = ""
	if GetTime > 0 then rtnTime = rtnTime & GetTime & " �� "
	if GetTime > 0 or GetMin > 0 then rtnTime = rtnTime & GetMin & " �� "
	rtnTime = rtnTime & GetSec & " ��"
	SecToTime = rtnTime

End function

function RtnWeekday(tmpDate)
	Select Case weekday(tmpDate)
	Case 1
		tmpDayName = "��"
	Case 2
		tmpDayName = "��"
	Case 3
		tmpDayName = "ȭ"
	Case 4
		tmpDayName = "��"
	Case 5
		tmpDayName = "��"
	Case 6
		tmpDayName = "��"
	Case 7
		tmpDayName = "��"
	end Select
	RtnWeekday = tmpDayName 
End function

' x��, y��, ��ȣ :::::::: �Ҽ��� ��� �Լ�
function FloatCalcul(tmp_x, tmp_y, tmp_cal)

	tmp_x = trim(tmp_x)
	tmp_y = trim(tmp_y)


	tmp_x_count = 1
	if inStr(tmp_x,".") > 0 then
		tmpArr = Trim(Mid(tmp_x,inStr(tmp_x,".") + 1))
		
		for tmp_Loop_cnt = 1 to Len(tmpArr)
			tmp_x_count = tmp_x_count * 10
		Next		
	End if

	tmp_y_count = 1
	if inStr(tmp_y,".") > 0 then
		tmpArr = Trim(Mid(tmp_y,inStr(tmp_y,".") + 1))
		
		for tmp_Loop_cnt = 1 to Len(tmpArr)
			tmp_y_count = tmp_y_count * 10
		Next		
	End if

	tmp_x = round(CCur(tmp_x) * tmp_x_count,0)
	tmp_y = round(CCur(tmp_y) * tmp_y_count,0)


	execute("tmp_rtn_value = tmp_x " + tmp_cal + " tmp_y")
	tmp_rtn_value = tmp_rtn_value / tmp_x_count
	tmp_rtn_value = tmp_rtn_value / tmp_y_count

	FloatCalcul = tmp_rtn_value
	
end function

function ReplaceDate(tmpDate,tmpPoint)

	ReplaceDate = Replace(Left(tmpDate,10),"-",tmpPoint)

end function

' ��¥ ���
function CheckDateToDay(tmpDate)

	Dim strNowWeek
	strNowWeek = WeekDay(tmpDate)
	Select Case (strNowWeek)
	   Case 1
		   CheckDateToDay = "��"
	   Case 2
		   CheckDateToDay = "��"
	   Case 3
		   CheckDateToDay = "ȭ"
	   Case 4
		   CheckDateToDay = "��"
	   Case 5
		   CheckDateToDay = "��"
	   Case 6
		   CheckDateToDay = "��"
	   Case 7
		   CheckDateToDay = "��"
	End Select
end function

Function URLDecode(Expression)
 Dim strSource, strTemp, strResult, strchr
 Dim lngPos, AddNum, IFKor
 strSource = Replace(Expression, "+", " ")
 For lngPos = 1 To Len(strSource)
  AddNum = 2
  strTemp = Mid(strSource, lngPos, 1)
  If strTemp = "%" Then
   If lngPos + AddNum < Len(strSource) + 1 Then
    strchr = CInt("&H" & Mid(strSource, lngPos + 1, AddNum))
    If strchr > 130 Then 
     AddNum = 5
     IFKor  = Mid(strSource, lngPos + 1, AddNum)
     IFKor  = Replace(IFKor, "%", "")
     strchr = CInt("&H" & IFKor )
    End If
    strResult = strResult & Chr(strchr)
    lngPos = lngPos + AddNum
   End If
  Else
   strResult = strResult & strTemp
  End If
 Next
 URLDecode = strResult
End Function  
Function DelHTML(ByVal tmpHTML )

    Dim rtnStr 

    If InStr(tmpHTML, "<") > 0 And InStr(tmpHTML, ">") > 0 Then
    
        If Left(tmpHTML, 1) <> "<" Then
            rtnStr = rtnStr & Left(tmpHTML, InStr(tmpHTML, "<") - 1)
        End If
        
        tmpHTML = Mid(tmpHTML, InStr(tmpHTML, ">") + 1)
        rtnStr = rtnStr & DelHTML(tmpHTML)
        
    Else
        rtnStr = tmpHTML
    End If

    rtnStr = Replace2(rtnStr,"&nbsp;","")

    DelHTML = rtnStr

End Function

Function Replace2(byVal tmpStr,byval tmpSource,byval tmpChange)
	if isNull(tmpStr) = true then tmpStr = ""
	if isNull(tmpSource) = true then tmpSource = ""
	if isNull(tmpChange) = true then tmpChange = ""
	Replace2 = replace(tmpStr,tmpSource, tmpChange)
End Function

Function MemberImageLoad(byVal imgName)
	MemberImageLoad = ds_site_img_url & DefUploadDir & "member_grade/" & imgName
End Function
Function BannerImageLoad(byVal imgName)
	BannerImageLoad = ds_site_img_url & DefUploadDir & "site_banner/" & imgName
End Function
Function MemberInfoImageLoad(byVal imgName)
	if isNull(imgName) or imgName = "" then imgName = "profile_img.gif"
	MemberInfoImageLoad = ds_site_img_url & DefUploadDir & "member/" & imgName
End Function
%>