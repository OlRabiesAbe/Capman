#macro gp_none 0

/// @func gamepadLast(device, [mode])

/// @desc Gets last gamepad button that was pressed, similar to keyboard_key

/// @param {real} device	Gamepad device to check
/// @param {enum} [mode]	Input check mode CHECK_MODE.DOWN, PRESSED or RELEASED (default: DOWN)

/// @return {input}

/// @example gamepadLast(0, false);

function gamepadLast(device, mode) {
	if (mode == undefined) mode = CHECK_MODE.DOWN;
	
	if (device != undefined) {
		if (gamepad_is_connected(device)) {
			// Check for input
			var arr = global.gamepad_inputs;
			var num = array_length(arr);
	
			for (var i = 0; i < num; i++) {
				var gp = arr[i];
		
				if (gpCheck(gp, mode, device)) {
					return gp;
					break;
				}
			}
		}
	}
	
	return gp_none;
}