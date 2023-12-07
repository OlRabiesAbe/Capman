/// @desc Set gp device nums
var type	= async_load[? "event_type"];
var ind		= async_load[? "pad_index"];

if (ind != undefined) {
	if (type == "gamepad discovered") {
		// Add gamepads
		
		for (var i = 0; i < 12; i++) {
			if (global.gamepads_connected[i] == -1) {
				global.gamepads_connected[i] = ind;
				break;
			}
		}
		
		gamepad_set_axis_deadzone(ind, gamepad_deadzone);
	
		show_debug_message("Gamepad Connected: " + string(ind));
	} else {
		// Remove gamepads
		
		var pos = arrayFind(global.gamepads_connected, ind);
		global.gamepads_connected[pos] = -1;
		
		show_debug_message("Gamepad Disconnected: " + string(ind));
	}
}