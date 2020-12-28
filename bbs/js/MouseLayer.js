// 마우스 따라다니는 레이어
// 사용법 : onmouseover="CursorLayerView('', '메모');" onmouseout="CursorLayerView('none', '');"
var CursorStatus = new Array();

function CursorEventOver()
{
	CursorStatus["x"] = document.body.scrollLeft + window.event.x;
	CursorStatus["y"] = document.body.scrollTop + window.event.y;
	
}

function CursorLayerView(tmpDisplay, tmpText)
{
	obj =  document.getElementById("div_Cursor");
	CursorEventOver();
	if(tmpText == "") tmpDisplay = "none"
	obj.style.display = tmpDisplay;
	obj.style.pixelLeft = CursorStatus["x"] + 20;
	obj.style.pixelTop = CursorStatus["y"];

	if(tmpText)
		document.getElementById("td_Cursor").innerHTML = tmpText;
}

document.onmousemove = CursorEventOver;


document.write('<div id="div_Cursor" style="display:none;position:absolute;top:0px;left:0px;" onMouseOver="CursorLayerView(\'\')" onMouseOut="CursorLayerView(\'none\')"><table border="1" cellpadding="3" cellspacing="0" bordercolor="#333333"><Tr><td id="td_Cursor" bgcolor="#FFFFFF"></td></Tr></table></div>')

