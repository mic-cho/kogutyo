<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head><title>Checkdata</title><meta http-equiv="Content-Type" content="text/html; charset=euc-kr"></head>

<body bgcolor="#ffffff">
<p> <b><font size= "3"face= "돋움">넘어온 데이터 확인</font></b>
<p>
<table border="1" cellpadding="0" cellspacing="0" width="400">
<tr><td colspan="2" height="30">
<p align="center"><font size="2" face="돋움"color="#003399"><b>Querystring 으로 넘어온 
        데이터 </b></font></td></tr>
<%
For each item in Request.QueryString
    for i = 1 to Request.QueryString(item).Count
%> 
<tr>
<td width= "150" height= "25"><font face= "돋움"size="2">&nbsp;Request("<%=item%>")</font></td>
<td width= "250" height= "25"><font face= "돋움"size="2">&nbsp;<%=Request.QueryString(item)(i)%></font>
</td></tr>
<%
    next 
next
%> 
</table><br>


<table border="1" cellpadding="0" cellspacing="0" width="400">
  <tr><td colspan="2" height="30">
<p align="center"><font size="2" face="돋움"color= "#003399"><b>Form 으로 넘어온 데이터</b></font></td></tr>
<%
i=0
For each item in Request.Form
    for i = 1 to Request.Form(item).Count
%> 
<tr>
<td width= "150"height= "25"><font face= "돋움"size="2">&nbsp;Request.form("<%=item%>")</font></td>
<td width= "250"height= "25"><font face= "돋움"size="2">&nbsp;<%=Request.form(item)(i)%></font></td>
</tr>
<%
    next 
next
%> 
</table>
<br>
<table border="1" cellpadding="0" cellspacing="0" width="400">
  <tr><td colspan="2" height="30"> <p align="center"><font size="2" face="돋움"color= "#003399"><b>ABC 
        로 넝어온 데이터 조합</b></font></td>
  </tr>
  <%
set UploadForm = 	Server.CreateObject("ABCUpload4.XForm")

i=0
For each item in UploadForm
    for i = 1 to UploadForm(item).Count
%> 
<tr>
<td width= "150"height= "25"><font face= "돋움"size="2">&nbsp;UploadForm("<%=item%>")</font></td>
<td width= "250"height= "25"><font face= "돋움"size="2">&nbsp;<%=UploadForm(item)(i)%></font></td>
</tr>
<%
    next 
next
set UploadForm = Nothing
%>
</table>
</body>
</html>


 
