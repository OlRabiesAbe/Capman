/// @desc Drawing

#region Title text (user)

// You can draw your title text here

#endregion

if (!menu_enabled) exit;

#region Run menu extension draw

if (menu_extension != undefined and is_struct(menu_extension)){
	if (variable_struct_exists(menu_extension, "draw")) {
		if (is_method(menu_extension.draw)) menu_extension.draw();
	}
}

#endregion

// Exit if page is empty
if (getlen(page) == 0) exit;

// Get array length 
var back = !ds_stack_empty(prev_pages);
var num = getlen(page) + back;

#region Check for sidebar menu items

	var sidebar = false;
	
	for (var i = 0; i < num; i++) {
		var on_back_button = back and i == num - 1;
		
		if (!on_back_button) {
			var arr = page[i];
			var strc = pageFind(arr).item;
			
			if (strc != undefined) {
				if (contains(sidebar_elements, instanceof(strc))) {
					sidebar = true;
					break;
				}
			}
		}
	}

#endregion

#region Create animation array

	var anim_type = sidebar ? e_anim_type.sidebar : e_anim_type.button;
	
	if (getlen(anim_array) == 0) {
		anim_array = array_create(num);
		
		for (var i = 0; i < num; i++) {
			anim_array[i] = new ButtonAnimation(anim_type);
		}
	}
	
#endregion

// Set draw pos
var menu_ypos = paused ? pause_settings.menu_ypos : look.pos.menu_pos.y;

var start_x = gui_w / 2 + look.pos.menu_pos.x;
var start_y = menu_ypos == auto ? ((gui_h / 2) - (((num - 1) / 2) * look.pos.buffer.y)) : menu_ypos;
var origin_y = start_y;

// Get buffers
var y_buff = sidebar ? look.pos.buffer.y : item_look.button.y_buffer;
var x_buff = look.pos.buffer.x;

// Get menu height and middle
var menu_h	= (y_buff * (num - 1));
var menu_middle = start_y + ((gui_h - start_y) / 2);

// Set drawing x and y pos
var xx = start_x;
var yy = start_y;

#region Scrolling

// Set scrolling y
if (scrolling_y == undefined) scrolling_y = start_y;

// If menu page is too big
if (menu_h > (gui_h - start_y)) {
	// If selected button is below middle
	var sel_y = start_y + (y_buff * menu_option);
	
	if (sel_y > menu_middle) {
		scrolling_y_to = start_y - (sel_y - menu_middle);
	}  else {
		scrolling_y_to = start_y;
	}
	
	scrolling_y = lerp(scrolling_y, scrolling_y_to, scrolling.speed);
	if (abs(scrolling_y - scrolling_y_to) < 0.2) scrolling_y = scrolling_y_to; 
	
	start_y = scrolling_y;
}

#endregion

#region Adjust controls position

	if (menu_extension != undefined and is_struct(menu_extension)) {
		if (instanceof(menu_extension) == "Controls") {
			start_x += item_look.controls.x_offset;
		}
	}

#endregion

#region Main drawing loop

	var skipped_items = 0;

	for (var i = 0; i < num; i++) {
		// Pos
		yy = start_y + (y_buff * (i - skipped_items));
		
		// Break if item is not on screen
		if (yy - y_buff > gui_h) break;
		
		// Continue if item is too high
		if (scrolling.disappear and yy < origin_y - (y_buff / 4)) continue;
		
		var on_back_button	= back and i == num - 1;
		var arr = !on_back_button ? page[i] : [item_look.back_button.name];
		
		if (isMouseInButton(xx, yy, (!sidebar ? item_look.button : { w: (gui_w * 0.9) - abs(look.pos.menu_pos.x), h: look.pos.buffer.y })) and !inputting) {
			if (input_mode == e_input_mode.mouse or point_distance(mouse_gui_x, mouse_gui_y, mouse_pos_prev[0], mouse_pos_prev[1]) > 20) {
				menu_option = i;
				mouse_pos_prev = [mouse_gui_x, mouse_gui_y];
				input_mode = e_input_mode.mouse;
				
				if (audio.mouse_select and menu_option != menu_option_prev) sn = audio.move;
			}
		}
		
		// Animation
		var anim_pos = 0;
		
		if ((sidebar and anim.sidebar.anim_on) or (!sidebar and anim.button.anim_on)) {
			anim_array[i].step(menu_option == i);
			anim_pos = anim_array[i].pos;
		}
		
		// Drawing
		if (is_array(arr)) {
			// Get name and struct
			var item = pageFind(arr);
			
			// Skip empty preset
			if (is_undefined(item.name)) {
				skipped_items++;
				continue;
			}
			
			// Selected
			var sel = menu_option == i;
			
			// Set color
			col = {
				unsel_sel:		col2(sel, look.col.unselected.normal,	look.col.selected.normal),
				dkunsel_selint:	col2(sel, look.col.unselected.dark, 	look.col.selected.intense)
			}
			
			if (!sidebar) {
				// Draw buttons
				yy += anim_pos;
				drawButton(xx, yy, item.name);
			} else {
				// Draw evertything else
				
				// Draw names at left side
				xx = start_x - x_buff - anim_pos;
				drawSetText(col.unsel_sel.c1, look.txt.normal.font, fa_right, fa_center)
				drawText(xx, yy, item.name, look.txt.normal.scale, look.txt.normal.outline_on ? col.unsel_sel.c2 : false);
				
				// Draw line in the middle
				draw_set_color(item_look.div_line.col);
				draw_line(start_x, (scrolling.disappear ? origin_y : start_y) - y_buff, start_x, start_y + menu_h + y_buff);
				
				// Run draw at right side
				draw_set_halign(fa_left)
				xx = start_x + x_buff;
				 
				// Set color to intense if inputting
				if (inputting and menu_option == i) col.unsel_sel.c1 = look.col.selected.intense;
				
				// Run items draw method
				if (item.item != undefined) {
					var selected = menu_option == i;
					if (variable_struct_get(item.item, "draw") != undefined) item.item.draw(xx, yy, selected);
				}
			}
		}
	}

#endregion