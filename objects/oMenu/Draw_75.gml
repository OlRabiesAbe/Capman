/// @desc Cover up borders

var disp_h = display_get_height();

draw_set_color(c_black);
draw_rectangle(0, 0, gui_w, -disp_h, false);
draw_rectangle(0, gui_h, gui_w, gui_h + disp_h, false);