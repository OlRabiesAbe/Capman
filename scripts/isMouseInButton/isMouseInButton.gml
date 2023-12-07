function isMouseInButton(x, y, look) {
	var mx = mouse_gui_x;
	var my = mouse_gui_y;
	
	return inRange(mx, x - look.w/2, x + look.w/2) and inRange(my, y - look.h / 2, y + look.h/2);
}