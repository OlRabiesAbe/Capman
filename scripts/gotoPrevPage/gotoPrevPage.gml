/// @func gotoPrevPage()
/// @return {undefined} N\A

function gotoPrevPage() {
    with (oMenu) {
    	var arr = ds_stack_pop(prev_pages);
    	page = arr[0];
    	menu_option = arr[1];
    	
    	sn = audio.back;
    	
    	// Call menu extension cleanup
    	if (menu_extension != undefined) {
    		if (variable_struct_exists(menu_extension, "cleanup")) {
    			if (is_method(menu_extension.cleanup)) menu_extension.cleanup();
    		}
    	}
    	
    	// Reset stuff
    	menu_extension = undefined;
    	anim_array = [];
    	scrolling_y = undefined;
    	
    	// Save
    	saveToJson(global.settings, save_filename);
    }
}