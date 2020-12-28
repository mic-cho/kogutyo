// 주민등록 번호 체크 (미성년자 등록 불가)
function chkssn(ossn1,ossn2,chk_age)
{
	var ssn1 = ossn1.value
	var ssn2 = ossn2.value
	if(!chk_age) chk_age = false
	if(ssn1.length < 6 || ssn2.length < 7) 
	{
		alert("주민등록번호에 오류가 있습니다. 다시 확인하여 주십시오.");
		ossn1.focus();
		return false;
	}

		var rn;
		rn= ssn1 + ssn2;
		var sum=0;
		for(i=0;i<8;i++) { sum+=rn.substring(i,i+1)*(i+2); }
		for(i=8;i<12;i++) { sum+=rn.substring(i,i+1)*(i-6); }
		sum=11-(sum%11);
		if (sum>=10) { sum-=10; }
	    if (rn.substring(12,13) != sum || (rn.substring(6,7) !=1 && rn.substring(6,7) != 2)) 
		{
			alert("주민등록번호에 오류가 있습니다. 다시 확인하십시오.");
			ossn1.focus();
			return false;
		}
		if (ssn1.length == 6 && chk_age)
		{
			var today = new Date();
			var toyear = parseInt(today.getYear());
			var tomonth = parseInt(today.getMonth()) + 1;
			var todate = parseInt(today.getDate());
			var bhyear = parseInt('19' + ossn1.value.substring(0,2)); 
			var ntyear = ossn2.value.substring(0,1);
			var bhmonth = ossn1.value.substring(2,4); 
			var bhdate = ossn1.value.substring(4,6); 
			var birthyear = toyear - bhyear;

			if (ntyear == 1 || ntyear == 2)	
			{
				if (birthyear < 14) 
				{ 
					alert("14세 미만은 이용하실 수 없습니다.!!!");
					ossn1.value ='';
					ossn2.value ='';
					ossn1.focus();
					return false; 
				} 
				else if (birthyear == 14) 
				{
					if (parseInt(tomonth) < parseInt(bhmonth)) 
					{
						alert("14세 미만은 이용하실 수 없습니다.!!!");
						ossn1.value ='';
						ossn2.value ='';
						ossn1.focus();
						return false;
					} 
					else if ((parseInt(tomonth) == parseInt(bhmonth)) && (parseInt(todate) > parseInt(bhdate))) 
					{
						alert("14세 미만은 이용하실 수 없습니다.!!!");
						ossn1.value ='';
						ossn2.value ='';
						ossn1.focus();
						return false; 
					}
				}
			}
		}
		return true;
}

// E-Mail 체크해주는 모듈 (Object를 값으로 받는다.)
function chk_email(c_email)
{
		var first = c_email.value.indexOf("@")
		var last = c_email.value.indexOf(".")
		f_name = c_email;
		var str_email = f_name.value.toUpperCase( );	// 대문자로 만든다.
		var email_num = f_name.value.length;
		if(str_email.substring(0,4)=="WWW.")
		{
			alert("E-mail 주소를 다시 써주세요. www.이 들어갈수 없습니다.");
			f_name.focus();
			return false;
		}
		if(str_email.substring(0,5)=="HTTP:")
		{
			alert("E-mail 주소를 다시 써주세요. http:이 들어갈수 없습니다.");
			f_name.focus();
			return false;
		}
		for (var l = 0; l <= (email_num - 1); l++) 
		{
			if (f_name.value.indexOf(" ") >= 0 ) 
			{
				alert ("E-메일 주소에서 공란을 빼주십시오.");
				f_name.focus();
				return false;
			} 
		}
		for (var l = 0; l <= (email_num - 1); l++) 
		{
			if (f_name.value.indexOf("@.") >= 0 ) 
			{
				alert ("E-mail 주소를 다시 써주세요. @.이 들어갈수 없습니다.");
				f_name.focus();
				return false;
			} 
		}
		if(email_num>0 && str_email.indexOf("/")==email_num-1)
		{
			alert("E-mail 주소를 다시 써주세요. 끝에 /가 들어갈수 없습니다.");
			f_name.focus();
			return false;
		}
		if(email_num>0 && str_email.indexOf(".")==email_num-1)
		{
			alert("E-mail 주소를 다시 써주세요. 끝에 .가 들어갈수 없습니다.");
			f_name.focus();
			return false;
		}
		if (str_email.search(/(\S+)@(\S+)\.(\S+)/) == -1) 
		{
			alert("E-Mail형식이 잘못되었습니다.\n\n  다시한번 확인바랍니다.");
			f_name.focus();
			return false;
		}
		return true;
}
// 숫자인지 확인시켜주는 페이지
function num_chk(chk_txt)
{
	c_text = chk_txt.value;
	if(c_text == "")
	{
		alert("번호를 입력해 주십시요!");
		chk_txt.focus();
		return false;
	}
	var chk = true;
	for(i=0;i<=c_text.length - 1 ; i ++)
	{
		
		if (c_text.charCodeAt(i) >= 48 && c_text.charCodeAt(i) <= 57)
			;
		else
			chk = false;

	}
	if (chk == false)
	{
		alert("숫자만 입력해 주십시요.");
		chk_txt.focus();
	}
	return chk;
}
// 문자열을 받아서 리턴값을 넘겨준다.
function chk_text(c_id)
{
	if(c_id == "")
	{
		alert("값을 입력해 주십시요!");
		return false;
	}
	var chk = true;
	for(i=0;i<=c_id.length - 1 ; i ++)
	{
		
		if (c_id.charCodeAt(i) >= 97 && c_id.charCodeAt(i) <= 122) 
			;
		else if (c_id.charCodeAt(i) >= 65 && c_id.charCodeAt(i) <= 90) 
			;
		else if (c_id.charCodeAt(i) >= 48 && c_id.charCodeAt(i) <= 57)
			;
		else
			chk = false;

	}
	if (chk == false)
	{
		alert("영문과 숫자조합만 가능합니다.");
	}
	return chk;
}
function check_key(obj) { 
        val = obj.value; 
        new_val = ''; 
        for(i=0;i<val.length;i++) { 
                char = val.substring(i,i+1); 
                if (char < '0' || char > '9') { 
                        obj.value = new_val; 
                        return; 
                } else { 
                        new_val = new_val + char; 
                } 
        } 
} 

function calculateBytes( szValue)
{
	var tcount = 0;
	
	var tmpStr = new String(szValue);
	var temp = tmpStr.length;
	
	var onechar;
	for ( k=0; k<temp; k++ )
	{
		onechar = tmpStr.charAt(k);
		if (escape(onechar).length > 4)
		{
		  tcount += 2;
		}
		else
		{
		  tcount += 1;
		}
	}
	
	return tcount;
}
