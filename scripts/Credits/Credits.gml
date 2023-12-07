/// @func Credits(string)

/// @desc Displays a scrolling credits screen when pressed

/// @param {string} string	The string to be displayed

/// @return {struct}

/// @example new Credits(credits_string);

/// @example new Credits(credits_string)

function Credits(str) : MenuElement() constructor {
	self.str = str;
	credit_y = undefined;
	
	static on_press = function() {
		gotoPage([]);
		oMenu.menu_extension = self;
		credit_y = gui_h;
		
		with (oMenu) break;
	}
	
	static step = function() {
		if (oMenu.in.back.pressed) {
			gotoPrevPage();
		}
		
		credit_y -= oMenu.item_look.credits.scrolling_speed;
	}
		
	static draw = function() {
		// Draw background
		var bg_look = oMenu.item_look.credits.bg;
		
		draw_set_color(bg_look.col);
		draw_set_alpha(bg_look.alpha);
		draw_rectangle(0, 0, gui_w, gui_h, false);
		draw_set_alpha(1);
		
		// Draw credits text
		var look = oMenu.item_look.credits.txt;
		
		drawSetText(look.col, look.font, fa_middle, fa_top);
		drawText(gui_w / 2, credit_y, str, look.scale, look.outline_col);
		
		// Go back if text is no longer on the screen
		var h = string_height(str) * look.scale;
		if (credit_y + h < 0 - (gui_h * 0.2)) gotoPrevPage();
		
		// Draw go back text
		var buf = oMenu.look.pos.buffer.x / 2;
		
		drawSetText(oMenu.look.col.selected.normal, oMenu.look.txt.small.font, fa_left, fa_bottom);
		drawText(buf, gui_h - buf / 2, "Press esc to exit", oMenu.look.txt.small.scale);
	}
}