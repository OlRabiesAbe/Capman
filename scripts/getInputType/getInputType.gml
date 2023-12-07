// Types enum
enum e_input_type {
	keyboard,
	gamepad,
	mouse
}

// Subtype enum
enum e_input_subtype {
	/// @member vk_constants
	vk,
	/// @member Unicode charaters (a-z, 1-9)
	unicode,
	/// @member Gamepad
	gp,
	/// @member Gamepad sticks
	gp_axis,
	/// @member Mouse
	mouse
}

/// @func getInputType(input, [subtype])

/// @desc Returns the type of any input. Can be e_input_type.keyboard, gamepad and mouse.

/// @param {input}	input		The input to get the type of
/// @param {bool}	[subtype]	Whether the type should be more or less detailed. If true it can return e_input_subtype.vk, uicode, gp, gp_axis and mouse.

/// @return {enum}

/// @example getInputType(inputLast());

function getInputType(input, sub) {
	if (sub == undefined) sub = false;
	
	var type = undefined;
	var subtype = undefined;
	var range = global.input_range;
	
	if (is_real(input)) {
		// Mouse
		if (inRange(input, range.mouse.minimum, range.mouse.maximum)) {
			type = e_input_type.mouse;
			subtype = e_input_subtype.mouse;
		} else
		
		// Gamepad
		if (inRange(input, range.gamepad.minimum, range.gamepad.maximum)) {
			type = e_input_type.gamepad;
			subtype = e_input_subtype.gp;
		} else
	
		// Keyboard
		if (inRange(input, range.key.minimum, range.key.maximum)) {
			type = e_input_type.keyboard;
			subtype = e_input_subtype.vk;
		}
	} else {
		if (is_string(input)) {
			if (string_length(input) == 1) {
				// Ord
				type = e_input_type.keyboard;
				subtype = e_input_subtype.unicode;
			} else {
				// Gamepad axis
				var str_last = string_char_at(input, string_length(input));
		
				if (str_last == "+" or str_last == "-") {
					type = e_input_type.gamepad;
					subtype = e_input_subtype.gp_axis;
				}
			}
		}
	}
	
	return sub ? subtype : type;
}