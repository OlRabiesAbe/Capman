/// @description If D is held down, draw debug text
if keyboard_check(ord("D"))
{
	if p_chase draw_set_color(c_green);
	else draw_set_color(c_red);
	draw_text_transformed(x, y-16, "p_chase", 0.5, 0.5, 0);
	
	draw_set_color(c_white);
	draw_text_transformed(x, y-8, "_scattertime " + string(_scattertime/room_speed), 0.5, 0.5, 0);
	
	var _str = "";
	for (var i = 0; i < 6; i++)
	{
		_str += string(i) + ":" + string(alarm[i]/room_speed) + " ";
	}
	draw_text_transformed(x, y, _str, 0.8, 0.8, 0);
}