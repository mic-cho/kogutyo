function GetCookie(name) { 
	var Found = false 
	var start, end 
	var i = 0 
	// cookie ���ڿ� ��ü�� �˻� 
	while(i <= document.cookie.length)
	{ 
		start = i 
		end = start + name.length 
		// name�� ������ ���ڰ� �ִٸ� 
		if(document.cookie.substring(start, end) == name)
		{ 
		Found = true 
		break 
		} 
	i++ 
	} 
	// name ���ڿ��� cookie���� ã�Ҵٸ� 
	if(Found == true)
	{ 
		start = end + 1 
		end = document.cookie.indexOf(";", start) 
		// ������ �κ��̶�� ���� �ǹ�(���������� ";"�� ����) 
		if(end < start) 
			end = document.cookie.length 
		// name�� �ش��ϴ� value���� �����Ͽ� �����Ѵ�. 
		return document.cookie.substring(start, end) 
	} 
// ã�� ���ߴٸ� 
return "" 
} 
function DataSetCookie(s_name)
{
	var ExpDate = new Date(); 
    ExpDate.setDate( ExpDate.getDate() + 1 ); 
	temp_str = "Y"
    document.cookie = s_name + "=" + escape( temp_str ) + "; path=/; expires=" + ExpDate.toGMTString() + ";" ;
}
function AdminPopUp(s_cookie,s_link,s_left,s_top,s_width,s_height,s_scrollbars,s_idx)
{
	chkvalue = ""
	chkvalue = GetCookie(s_cookie);
	if(chkvalue != "Y" )
	{
//		s_width = parseInt(s_width) + 15
		s_height = parseInt(s_height) + 40
		AdminOpenPopup(s_cookie,s_link,s_left,s_top,s_width,s_height,'no',s_idx);
	}	
}
admin_pop = [];
function AdminOpenPopup(s_name,s_link,s_left,s_top,s_width,s_height,s_scrollbars,s_idx)
{
	pop_idx = admin_pop.length;
	if(!s_link)
	{
		admin_pop[pop_idx] = window.open("/popup/popup_prg.asp?idx=" + s_idx,s_name,"scrollbars=" + s_scrollbars + ",width=" + s_width + ",height=" + s_height + ",top=" + s_top + ",left=" + s_left);
	}
	else
	{
		admin_pop[pop_idx] = window.open(s_link,s_name,"scrollbars=" + s_scrollbars + ",width=" + s_width + ",height=" + s_height + ",top=" + s_top + ",left=" + s_left);
	}
	admin_pop[pop_idx].focus();
}
function AdminClosePopup()
{
	if(!admin_pop) return;
	if(admin_pop.length == 0) return;
	for(pop_i=admin_pop.length-1;pop_i >= 0;pop_i-- )
	{
		if(admin_pop[pop_i]) admin_pop[pop_i].close();
	}
}
