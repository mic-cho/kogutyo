<%@  codepage="65001" language="VBScript" %>
<%response.Expires = -1%>
<%
Session.CodePage = 65001
Response.ChaRset = "utf-8"
%>
<!--#include virtual="/bbs/lib/defGlobal.asp" -->
<!--#include virtual="/bbs/class/cls_dbupdater.asp" -->
<!-- #include virtual="/bbs/lib/oop_GetQueryItem.asp"-->
<!-- #include virtual="/bbs/lib/inc_member_info.asp"-->
<!-- #include virtual="/bbs/lib/mdl_log.asp"-->
<%
	
Const PokerConn ="Provider=SQLOLEDB.1;Password=akdrh123!@#;Persist Security Info=True;User ID=mangogame;Initial Catalog=37poker;Data Source=."

	' �⺻������ �������� ���Ǵ� ��ũ��Ʈ �ε�
'	Sql = "Select Top 1 * From default_setting"
'	Set DBConn = new XTclsDbConn			' Ŭ���� ����
'	Set Rs = DBConn.RSOpen(SQL)												' ���ڵ�� �޾ƿ��� 
'	Set DBConn = Nothing
'	
'	if not RS.eof then 
'		RSCnt = RS.Fields.Count    '�ʵ��� ����
'		for i = 0 to RSCnt - 1
'			obj_name = RS.fields(i).name
'			Execute(obj_name & " = RS(" & i & ")")
'		Next
'	End if

%>
<script language="JavaScript" type="text/JavaScript" src="/bbs/js/GlobalDef.js"></script>
<script language="JavaScript" type="text/JavaScript" src="/bbs/js/jquery-1.7.1.min.js"></script>
