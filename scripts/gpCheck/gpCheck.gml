/// @func gpCheck(gp, [mode], [gp_num])

/// @desc Checks if a gamepad button is pressed or not

/// @param {gp}   gp			The gamepad button to check for
/// @param {enum} [mode]		Input check mode CHECK_MODE.DOWN, PRESSED or RELEASED (default: DOWN)
/// @param {real} [device]		Gamepad device number (default: 0)

/// @return {bool}

/// @example gpCheck(gp_axislr, CHECK_MODE.PRESSED, global.gamepads_connected[0]);

function gpCheck(gp, mode, gp_num) {
    if (mode == undefined) mode = CHECK_MODE.DOWN;
    if (gp_num == undefined) gp_num = 0;
    
	var input = false;

	if (inRange(gp_num, 0, 11)) {
		if (is_string(gp)) {
			// Gamepad axis
		
			// Check axis last val
			var key = "gp num:" + string(gp_num) + " axis_id:" + string(gp);
			var axis_last_val = global.axis_last_val[? key];
		
			// Convert string to axis id and axis dir
			var axis_ind = real(string_digits(gp));
			var str_last = string_char_at(gp, string_length(gp));
		
			var axis_target_val = 1;
			if (str_last == "-") axis_target_val = -1;
		
			// Get value
			var axis_val = sign(gamepad_axis_value(gp_num, axis_ind));
			
			switch mode {
				case CHECK_MODE.DOWN:
					input = axis_val == axis_target_val;
					break;
		
				case CHECK_MODE.PRESSED:
					input = axis_val == axis_target_val and axis_val != axis_last_val;
					break;
			
				case CHECK_MODE.RELEASED:
					input = axis_val == 0 and axis_last_val == axis_target_val;
					break;
			}
		
			// Add axis value to the list
			var ls = global.axis_val_ls;
			var arr = [key, axis_val];
		
			if (ds_list_find_index(ls, arr) == -1) ds_list_add(ls, arr);
		} else {
			// Gamepad button
			
			switch mode {
				case CHECK_MODE.DOWN:
					input = gamepad_button_check(gp_num, gp);
					break;
		
				case CHECK_MODE.PRESSED:
					input = gamepad_button_check_pressed(gp_num, gp);
					break;
			
				case CHECK_MODE.RELEASED:
					input = gamepad_button_check_released(gp_num, gp);
					break;
			}
		}
	}

	return input;
}