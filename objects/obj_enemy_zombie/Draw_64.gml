/// @description If D is held down, draw debug text
if keyboard_check(ord("D"))
{
	var _image_alpha_stored = image_alpha;
	image_alpha = 1;
	draw_set_font(font_basic);
	
	if p_chase draw_set_color(c_green);
	else draw_set_color(c_red);
	draw_text_transformed(x, y-16, "p_chase", 0.6, 0.6, 0);
	
	draw_set_color(c_white);
	draw_text_transformed(x, y-8, "_scattertime " + string(_scattertime/room_speed), 0.6, 0.6, 0);
	
	var _str = "";
	for (var i = 0; i < 6; i++)
	{
		_str += string(i) + ":" + string(alarm[i]/room_speed) + " ";
	}
	draw_text_transformed(x, y, _str, 0.6, 0.6, 0);
	
	draw_text_transformed(x, y+8, "p_movespeed " + string(p_moveSpeed), 0.6, 0.6, 0);
	
	draw_text_transformed(x, y+16, "object_index " + string(object_index), 0.6, 0.6, 0);
	
	image_alpha = _image_alpha_stored;
}