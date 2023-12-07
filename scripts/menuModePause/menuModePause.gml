/// @func menuModePause([preset], [room])

/// @desc This function will set the menu into pause screen mode. Which means that the menu will be disabled and pausing enabled.

/// @param {real} [preset]  (optional) The preset to change to
/// @param {real} [room]    (optional) Room to go to

/// @return {undefined} N/A

/// @example menuModePause(e_menu_presets.pause_menu, rGame);

function menuModePause(preset, room) {
    if (preset != undefined) menuSetPreset(preset);
    if (room != undefined) room_goto(room);
    
	menuPauseEnable(true); 
	menuEnable(false);
}