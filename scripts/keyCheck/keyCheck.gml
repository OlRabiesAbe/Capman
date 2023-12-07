/// @func keyCheck(key, [mode])

/// @desc Checks if a key is pressed or not

/// @param {vk/string}		key         The key to be checked. ord() is not accepted only vk and string (e.g. vk_left, "a", "1")
/// @param {enum}          [mode]		Input check mode CHECK_MODE.DOWN, PRESSED or RELEASED (default: DOWN)

/// @return {bool}

/// @example keyCheck(vk_right, CHECK_MODE.PRESSED);

function keyCheck(key, mode) {
    if (mode == undefined) mode = CHECK_MODE.DOWN;
    
	var input = false;
	
	if (is_string(key)) {
		if (string_length(key) == 1) key = ord(string_upper(key));
	}
	
	switch mode {
		case CHECK_MODE.DOWN:
			input = keyboard_check(key);
			break;
		
		case CHECK_MODE.PRESSED:
			input = keyboard_check_pressed(key);
			break;
			
		case CHECK_MODE.RELEASED:
			input = keyboard_check_released(key);
			break;
	}

	return input;
}