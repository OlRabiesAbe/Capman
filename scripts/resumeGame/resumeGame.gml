/// @func resumeGame([keep_menu_active])

/// @desc This function resumes the game

/// @param {bool} [keep_menu_active] If true the menu will remain active after resuming the game (default: false)

/// @return {undefined} N/A

/// @example resumeGame(true);

function resumeGame(keep_menu_active) {
	if (keep_menu_active == undefined) keep_menu_active = false;
	
	with (oMenu) {
		saveMenu();

		paused = false;

		surface_free(pause_surf);
		pause_surf = -1;
	}
	
	instance_activate_all();
	if (!keep_menu_active) oMenu.menu_enabled = false;
	
	audio_resume_all();
			
	// Resume sound
	if (oMenu.audio.resume != undefined) audio_play_sound(oMenu.audio.resume, 5, false);
}
