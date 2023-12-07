// Types enum
enum e_input_type {
	keyboard,
	gamepad,
	mouse
}

// Subtype enum
enum e_input_subtype {
	vk,
	unicode,
	gp,
	gp_axis,
	mouse
}

/// @param array

function getInputRange(_arr) {
	var _min = undefined;
	var _max = undefined;
	var num = array_length(_arr)
	
	for (var i = 0; i < num; i++) {
		var val = _arr[i];
		
		if (_min == undefined or val < _min) _min = val;
		if (_max == undefined or val > _max) _max = val;
	}
	
	show_debug_message("###!!! Input Range Is: " + string(_min) + " - " + string(_max));
	
	return {
		small: _min,
		big: _max
	}
}

/// @param input
/// @param [subtype]

function getInputType(_input, _sub) {
	var type = undefined;
	var subtype = undefined;
	var range = global.input_range;
	
	if (is_real(_input)) {
		// Mouse
		if (within(_input, range.mouse.small, range.mouse.big)) {
			type = e_input_type.mouse;
			subtype = e_input_subtype.mouse;
		} else
		
		// Gamepad
		if (within(_input, range.gamepad.small, range.gamepad.big)) {
			type = e_input_type.gamepad;
			subtype = e_input_subtype.gp;
		} else
	
		// Keyboard
		if (within(_input, range.key.small, range.key.big)) {
			type = e_input_type.keyboard;
			subtype = e_input_subtype.vk;
		}
	} else {
		if (is_string(_input)) {
			if (string_length(_input) == 1) {
				// Ord
				type = e_input_type.keyboard;
				subtype = e_input_subtype.unicode;
			} else {
				// Gamepad axis
				var str_last = string_char_at(_input, string_length(_input));
		
				if (str_last == "+" or str_last == "-") {
					type = e_input_type.gamepad;
					subtype = e_input_subtype.gp_axis;
				}
			}
		}
	}
	
	return _sub ? subtype : type;
}