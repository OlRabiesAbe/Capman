/// @func menuModeTitle([preset], [room])

/// @desc This function will set the menu into title mode. Which means that the menu will be enabled and pausing disabled.

/// @param {real} [preset]  (optional) The preset to change to
/// @param {real} [room]    (optional) Room to go to

/// @return {undefined} N/A

/// @example menuModeTitle(e_menu_presets.title, rTitle);

function menuModeTitle(preset, room) {
    if (preset != undefined) menuSetPreset(preset);
    if (room != undefined) room_goto(room);
    
	menuPauseEnable(false); 
	menuEnable(true); 
	resumeGame(true);
}