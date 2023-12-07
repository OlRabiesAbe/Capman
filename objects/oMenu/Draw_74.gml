/// @desc Pause surface
if (!paused) exit;

if (!surface_exists(pause_surf)) {
	if (pause_surf == -1) {
		// Deactivate all instances
		instance_deactivate_all(true);
		
		// Activate important objects
		array_push(active_objs, oMenu, oInputManager);
		
		for (var i = 0; i < getlen(active_objs); i++) {
			instance_activate_object(active_objs[i]);
		}
		
		// Pause all sounds
		audio_pause_all();
		
		// Pause sound
		if (audio.pause != undefined) audio_play_sound(audio.pause, 5, false);
	}
	
	// Draw to surface
    pause_surf = surface_create(gui_w, gui_h);
    surface_set_target(pause_surf);
    draw_surface(application_surface, 0, 0);
    surface_reset_target();
} else {
	var sett = pause_settings;
	
	// Draw the surface
    draw_surface(pause_surf, 0, 0);
	
	// Rectangle
    draw_set_alpha(sett.rect.alpha);
    draw_set_color(sett.rect.col);
    draw_rectangle(0, 0, gui_w, gui_h, false);
    draw_set_alpha(1);
    
    // Game paused text
    var txt_y = gui_h / 5;
    
    if (sett.txt.enabled) {
	    drawSetText(sett.txt.col, look.txt.normal.font);
	    drawText(gui_w / 2, txt_y, sett.txt.str, sett.txt.scale, sett.txt.outline_col);
    }
}