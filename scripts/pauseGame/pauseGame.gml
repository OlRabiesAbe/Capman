/// @func pauseGame([active_objs])

/// @desc This function pauses the game.

/// @param {array} [active_objs]  (optional) The list of objects to keep active after pausing

/// @return {undefined} N/A

/// @example pauseGame([oMenu, oInputManager]);

function pauseGame(active_objs) {
    with (oMenu) {
        menu_enabled = true;
        paused = true;
    }
    
    if (is_array(active_objs)) oMenu.active_objs = active_objs;
}