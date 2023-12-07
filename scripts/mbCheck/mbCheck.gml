/// @func mbCheck(mouse_button, [mode])

/// @desc Checks if a mouse button is pressed or not

/// @param {mb}     mouse_button    Mouse button to check for
/// @param {enum}   [mode]			Input check mode CHECK_MODE.DOWN, PRESSED or RELEASED (default: DOWN)

/// @return {bool}

/// @example mbCheck(mb_left, CHECK_MODE.PRESSED);

function mbCheck(mb, mode) {
    if (mode == undefined) mode = CHECK_MODE.DOWN;
    
	var input = false;
	
	switch mode {
		case CHECK_MODE.DOWN:
			input = mouse_check_button(mb);
			break;
		
		case CHECK_MODE.PRESSED:
			input = mouse_check_button_pressed(mb);
			break;
			
		case CHECK_MODE.RELEASED:
			input = mouse_check_button_released(mb);
			break;
	}

	return input;
}