/// @func inputCheck(input/arr, [mode], [gamepad_device])

/// @desc Checks one or more inputs of any type, returns true if any of them are pressed.

/// @param {input/array}		input/arr				One input or an array of inputs of any type
/// @param {enum}				[mode]					Input check mode CHECK_MODE.DOWN, PRESSED or RELEASED (default: DOWN)
/// @param {real}				[gamepad_device]		Damepad device to check (default: 0)

/// @return {bool}

/// @example inputCheck([vk_right, "d", gp_axislr, gp_padr], CHECK_MODE.PRESSED, global.gamepads_connected[0]); 

function inputCheck(inp, mode, gp_num) {
	if (mode == undefined) mode = CHECK_MODE.DOWN;
	if (gp_num == undefined) gp_num = 0;
	
	var arr = is_array(inp) ? inp : [inp];
	
	var input = false;
	
	var len = getlen(arr);
	
	for (var i = 0; i < len; i++) {
		var in = arr[i];
		
		if (in == 0 or in == undefined) continue;
		
		var type = getInputType(in);
		
		switch (type) {
			case e_input_type.keyboard:
				input = keyCheck(in, mode);
				break;
				
			case e_input_type.gamepad:
				input = gpCheck(in, mode, gp_num);
				break;
				
			case e_input_type.mouse:
				input = mbCheck(in, mode);
				break;
		}
		
		if (input) break;
	}
	
	return input;
}

/// @enum Input checking modes

enum CHECK_MODE {
	/// @member Returns true while the input is held down
	DOWN,
	/// @member Returns true at the moment when the input is pressed
	PRESSED,
	/// @member Returns true at the moment when the input is released
	RELEASED
}