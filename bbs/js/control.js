/********************************************************************
*** 리스트박스에 관련된 함수
*** listbox_item_move(오브젝트,이동타입) : 선택된 아이템을 위아래로 이동시킨다
********************************************************************/
function listbox_item_move(obj_list,chk_up)
{
	if(obj_list.selectedIndex >= 0)
	{
		if(chk_up == "up")
		{
			if (obj_list.selectedIndex == 0) return;

			temp_value = obj_list[obj_list.selectedIndex].value;
			temp_text = obj_list[obj_list.selectedIndex].text;
			
			obj_list[obj_list.selectedIndex].value = obj_list[obj_list.selectedIndex - 1].value;
			obj_list[obj_list.selectedIndex].text = obj_list[obj_list.selectedIndex - 1].text;
			
			obj_list[obj_list.selectedIndex - 1].value = temp_value;
			obj_list[obj_list.selectedIndex - 1].text = temp_text;
			obj_list.selectedIndex--;
		}
		else
		{
			if (obj_list.selectedIndex == (obj_list.length - 1)) return;

			temp_value = obj_list[obj_list.selectedIndex].value;
			temp_text = obj_list[obj_list.selectedIndex].text;
			
			obj_list[obj_list.selectedIndex].value = obj_list[obj_list.selectedIndex + 1].value;
			obj_list[obj_list.selectedIndex].text = obj_list[obj_list.selectedIndex + 1].text;
			
			obj_list[obj_list.selectedIndex + 1].value = temp_value;
			obj_list[obj_list.selectedIndex + 1].text = temp_text;
			obj_list.selectedIndex++;
		}
	}
}

function CheckAll(obj,TmpChecked)
{
	if(obj)
	{
		if(obj.length)
		{
			for(Tmpi=0;Tmpi < obj.length; Tmpi++)
				obj[Tmpi].checked = TmpChecked;
		}
		else
		{
			obj.checked = TmpChecked;
		}
	}
}

function CheckTrueCount(obj)
{
	CheckBoxLoopCount = 0;
	if(obj)
	{	
		if(obj.length)
		{
			for(Tmpi=0;Tmpi < obj.length; Tmpi++)
				if(obj[Tmpi].checked) CheckBoxLoopCount++;
		}
		else
		{
			if(obj.checked) CheckBoxLoopCount++;
		}
	}
	return CheckBoxLoopCount;
}