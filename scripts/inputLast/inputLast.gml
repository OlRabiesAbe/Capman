/// @func inputLast()

/// @desc Returns the last input pressed of any type: keyboard, mouse, gamepad. Or undefined if no input is pressed.

/// @param gamepad_device The gamepad to check (default: 0)

/// @return {input/undefined}

/// @example inputLast(global.gamepads_connected[0]);

function inputLast(gp_num) {
	if (gp_num == undefined) gp_num = 0;
	
	var in = undefined;
	
	in = keyboard_key;

	if (in != vk_nokey) {
		var range = global.input_range;
		var is_letter = inRange(in, range.ord_letters.minimum, range.ord_letters.maximum);
		var is_number = inRange(in, range.ord_numbers.minimum, range.ord_numbers.maximum);
			
		if (is_letter or is_number) return chr(in);
		else return in;
	} else {
		in = gamepadLast(gp_num, false);
	}
	
	if (in == gp_none) in = mouse_button;
	
	if (in == mb_none) in = undefined;
	
	return in;
}