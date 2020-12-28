/////////////////////////
// 전역 사용 함수 / 변수 모음
/////////////////////////
var DefUploadDir = "/bbs/pds/"
var DefJSDir = "/bbs/js/"
var SiteKey = "XTBOARD"
var SiteURL = ""
var SiteSSL = ""

//document.write("<script language=\"JavaScript\" type=\"text/JavaScript\" src=\"/bbs/js/prototype.js\">< /script>");

// From  Submit 도우미 모듈
// 실행시 중복 방지 체크기능
// ObjFrm : Form Object
// strMsg : Submit 전에 체크할 메세지 "수정하시겠습니까?" 이런거
// strAction : action  페이지
// strTarget : 목표창
// strMethod : get, post
var RunSubmit = false;
function SubmitForm(ObjFrm,strMsg,strAction,strTarget,strMethod)
{
	if(RunSubmit) return false;
	if(!ObjFrm) return false;
	if(strMsg)
	{
		if(!confirm(strMsg))
			return false;
	}
	
	if(strAction) ObjFrm.action = strAction;
	if(strTarget) ObjFrm.target = strTarget;
	if(strAction) ObjFrm.method = strMethod;
	
	RunSubmit = true;		// 중복실행 방지
	ObjFrm.submit();
	return true;	
}


function GetObj(objName)
{
	return document.getElementById(objName);
}

// 에러값이 비었는지 체크해주는 모듈
function ErrMsg(objName,MsgErr,MsgLen)
{
	obj = GetObj(objName)
	if(!obj) 
	{
		alert(objName + " 존재하지 않는 Object Name 입니다.")
		return false;
	}

	StrTemp = obj.value
	StrTemp = StrTemp.replace(/ /g,"");
	if(StrTemp.length == 0)
	{
		alert(MsgErr);
		if(obj.focus()) obj.focus();
		return false;
	}
	if(MsgLen)
	{
		if(StrTemp.length < MsgLen)
		{
			alert(MsgLen + "자 이상 입력하셔야 합니다.")
			return false;
		}
	}
	return true;
}

function ShowObj(objName,objDisplay)
{
	obj = GetObj(objName);
	if(!obj) return;
	obj.style.display = objDisplay;
}

function PopupOpen(url,p_name,p_width,p_height,chk_scrollbars)
{
	if(!chk_scrollbars) chk_scrollbars = "yes"
	var ObjOpenWindow = window.open(url,p_name, 'resizable=no,scrollbars=' + chk_scrollbars + ',height=' + p_height + ',width=' + p_width);
	ObjOpenWindow.focus();
	return ObjOpenWindow;
}

function PopupModal(url,p_height,p_width){ 
	window.showModelessDialog(url,null,"help=no;dialogWidth=" + p_width + "px;dialogHeight:" + p_height + "px; center:yes; status:yes; resizable:no;");
} 

function createForm(f_name,f_action,f_target,f_method) 
{
	var tmpForm=document.createElement("form");
	tmpForm.name=f_name;
	tmpForm.action=f_action;
	if(f_target) tmpForm.target=f_target;
	if(!f_method) f_method = "get";
	tmpForm.method=f_method;
	return tmpForm;
}
function addHidden(ah_form,ah_name,ah_value) 
{
	var tmpItem = document.createElement("input");
	tmpItem.type="hidden";
	tmpItem.name=ah_name;
	tmpItem.value=ah_value;
	ah_form.appendChild(tmpItem);
	return ah_form;
}

function MovePage(tmpURL,tmpTarget,tmpMessage,tmpMethod)
{
	var goURL = "";
	var tmpQueryString = "";
	var tmpArray = [];
	var tmpString = [];
	var tmpi
	if(tmpMessage)
	{
		if(!confirm(tmpMessage))
			return;
	}
	
	if(!tmpMethod) tmpMethod = "get"
	
	goURL = tmpURL.substring(0,tmpURL.indexOf("?"))
	if (goURL)
		tmpQueryString = tmpURL.substring(tmpURL.indexOf("?") + 1);
	else
		goURL = tmpURL;
	if(tmpQueryString)
	{
//		var frm = createForm("frmMovePage",goURL, tmpTarget, "get");
		var frm = createForm("frmMovePage",goURL, tmpTarget, tmpMethod);
		tmpArray = tmpQueryString.split("&")
		for(tmpi = 0; tmpi < tmpArray.length  ; tmpi++)
		{
			tmpString = tmpArray[tmpi].split("=");
			if(!tmpString[1]) tmpString[1] = "";
			frm = addHidden(frm, tmpString[0], tmpString[1]);
		}
	}
	else
	{
		var frm = createForm("frmMovePage",goURL, tmpTarget, "post");	
	}
	document.body.appendChild(frm);
	frm.submit();
}

function GetCookie(name) { 
	var Found = false 
	var start, end 
	var i = 0 
	// cookie 문자열 전체를 검색 
	tmpCookie = unescape(document.cookie)
	while(i <= tmpCookie.length)
	{ 
		start = i 
		end = start + name.length 
		// name과 동일한 문자가 있다면 
		if(tmpCookie.substring(start, end) == name)
		{ 
			Found = true 
			break 
		} 
	i++ 
	} 
	// name 문자열을 cookie에서 찾았다면 
	if(Found == true)
	{ 
		start = end + 1 
		end = tmpCookie.indexOf(";", start) 
		// 마지막 부분이라는 것을 의미(마지막에는 ";"가 없다) 
		if(end < start) 
			end = tmpCookie.length 
		// name에 해당하는 value값을 추출하여 리턴한다. 
		return tmpCookie.substring(start, end) 
	} 

	// 찾지 못했다면 
	return "" 
} 

function SetCookie(s_name,temp_str,tmp_length)
{
	if(!temp_str) temp_str = " "
	if (!tmp_length) tmp_length = 1
	var ExpDate = new Date(); 
    ExpDate.setDate( ExpDate.getDate() + tmp_length ); 
    document.cookie = s_name + "=" + escape( temp_str ) + "; path=/; expires=" + ExpDate.toGMTString() + ";" ;
}

function Init_iframe_size(objname) 
{  	
	document.getElementById(objname).style.height = 0;	
	document.getElementById(objname).style.height = document.frames[objname].document.body.scrollHeight;	
}

function CopyClipBoard(objText) 
{
	window.clipboardData.setData('Text', objText);
	alert('복사되었습니다');
}

function NoImage(obj_img,img_size)
{
	if(!obj_img) return;
	if(img_size=='s')
		obj_img.src = "/img/no_image.gif";
	else
		obj_img.src = "/img/no_image.gif";
}

/*
** 사용법 : 스크립트 로드에 사용함
** 사용예 : 
** addScript(Array("CAL","EDITER"));
*/
function addScript(ScriptArray) 
{
	for(arr_i = 0;arr_i < ScriptArray.length ; arr_i++)
	{
		arr_url = ""
		if(ScriptArray[arr_i] == "EDITER") arr_url = DefJSDir + "KNEditor.js";
		else if(ScriptArray[arr_i] == "CAL") arr_url = DefJSDir + "calendar.js";
		else if(ScriptArray[arr_i] == "COMMON") arr_url = DefJSDir + "common.js";
		else if(ScriptArray[arr_i] == "CONTROL") arr_url = DefJSDir + "control.js";
		else if(ScriptArray[arr_i] == "POPUP") arr_url = DefJSDir + "cookie_popup.js";
		else arr_url = ScriptArray[arr_i];
		
		document.write("<" + "script language=\"JScript\" src=\"" + arr_url + "\"><" + "/script>");
	}
}
// 키보드 숫자 잡는 함수
function handlerNum() 
{
	e = window.event; //윈도우의 event를 잡는것입니다. 그냥 써주심됩니당.
	//숫자열 0 ~ 9 : 48 ~ 57, 키패드 0 ~ 9 : 96 ~ 105 ,8 : backspace, 46 : delete -->키코드값을 구분합니다. 저것들이 숫자랍니다.
	if(e.keyCode >= 48 && e.keyCode <= 57 || e.keyCode >= 96 && e.keyCode <= 105 || e.keyCode == 8 || e.keyCode == 9 || e.keyCode == 46 || e.keyCode == 13)
	{
		if(e.keyCode == 48 || e.keyCode == 96)//0을 눌렀을경우
		{
				return; //-->입력시킨다.
		}
		else if(e.keyCode == 13)//0을 눌렀을경우
		{
				return; //-->입력시킨다.
		} //0이 아닌숫자
			return; //-->입력시킨다.
	}
	else //숫자가 아니면 넣을수 없다.
		e.returnValue=false;
}
function numOnMask(me)
{
    var tmpH 
	var tmpArr
	me = me.toString();
	tmpArr = me.split(",")
	me = tmpArr.join("")
	me = me.replace(/ /g, "")
	if(me.length > 3)
	{
		var c=0;
		var myArray=new Array();

		for(var i=me.length;i>0;i=i-3)
		{
			myArray[c++]=me.substring(i-3,i);
		}
		myArray.reverse();
		me=myArray.join(",");
	}
    if(tmpH)
    {
        me=tmpH+me;
    }
    return me
}

function KeyBoxFocusEvent() 
{
	var all_img=document.all.tags("INPUT")
	if(all_img.length > 0)
	{
		for(var i=0;i<all_img.length;i++)
		{
			if(all_img[i].type=="text")
				all_img[i].onfocus=function (){this.select()};
		}
	}
}

 // 문자열 길이 체크 알파뉴메릭(1자리), 한글(2자리)
function getStringLength (str)
{
	var retCode = 0;
	var strLength = 0;
	
	for (i = 0; i < str.length; i++)
	{
		var code = str.charCodeAt(i)
		var ch = str.substr(i,1).toUpperCase()
		
		code = parseInt(code)
		
		if ((ch < "0" || ch > "9") && (ch < "A" || ch > "Z") && ((code > 255) || (code < 0)))
			strLength = strLength + 2;
		else
			strLength = strLength + 1;
	}
	return strLength;
}

 // 문자열 길이 체크 알파뉴메릭(1자리), 한글(2자리)
function getStringCut (t_str,t_len)
{
	var retCode = 0;
	var strLength = 0;
	var strRtn = "";
	
	for (i = 0; i < t_str.length; i++)
	{
		var code = t_str.charCodeAt(i)
		var ch = t_str.substr(i,1).toUpperCase()
		ch2 = t_str.substr(i,1)
		code = parseInt(code)
		
		if ((ch < "0" || ch > "9") && (ch < "A" || ch > "Z") && ((code > 255) || (code < 0)))
			strLength = strLength + 2;
		else
			strLength = strLength + 1;
		strRtn += ch2
		if(t_len < strLength) 
		{
			strRtn += "..";
			break;
		}
	}
	return strRtn;
}

// x값, y값, 부호 :::::::: 소수점 계산 함수
function FloatCalcul(tmp_x, tmp_y, tmp_cal)
{
	tmp_x = tmp_x.toString();
	tmp_y = tmp_y.toString();

	tmp_x_count = 1;
	if(tmp_x.indexOf(".") > -1)
	{
		tmpArr = tmp_x.split(".")
		for(tmp_Loop_cnt = 0;tmp_Loop_cnt < tmpArr[1].length; tmp_Loop_cnt++)
			tmp_x_count *= 10;
	}
	
	tmp_y_count = 1;
	if(tmp_y.indexOf(".") > -1)
	{
		tmpArr = tmp_y.split(".")
		for(tmp_Loop_cnt = 0;tmp_Loop_cnt < tmpArr[1].length; tmp_Loop_cnt++)
			tmp_y_count *= 10;
	}
	
	tmp_x = Math.round(parseFloat(tmp_x) * tmp_x_count);
	tmp_y = Math.round(parseFloat(tmp_y) * tmp_y_count);


	tmp_rtn_value = eval("tmp_x " + tmp_cal + " tmp_y");
	tmp_rtn_value = tmp_rtn_value / tmp_x_count;
	tmp_rtn_value = tmp_rtn_value / tmp_y_count;

	return tmp_rtn_value;
}
function Fn_LoadAjax(url)
{
	var myAjax = new $.ajax(url,{
	contentType: "text/html; charset=UTF-8", 
	success:function(dataA)
		{
			try{
				eval(dataA);		
			}catch( e ){

			}
		},
      error:function(request,status,error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }

	
	})
}
window.onload = KeyBoxFocusEvent;