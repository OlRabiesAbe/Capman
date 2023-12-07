/// @func Slider(range_array, default_val, save_key)

/// @desc Changes a value in a range slider

/// @param {array}	range_array		The values range like this: [min_val, max_val]
/// @param {real}	default_val		Default value if save file doesn't exists
/// @param {string} save_key		The name under the value is being stored in the settings struct

/// @return {struct}

/// @example new Slider([0, 1], 0.3, "volume_master")

function Slider(range_arr, default_val, save_key) : MenuElement() constructor {
	self.save_key	= save_key;
	val				= getSettingsValue(default_val);
	range			= range_arr;
	dragged			= false;
	
	// Move value
	static on_select = function() {
		static mv_spd = 0;
		
		if (!dragged) {
			var hinput = oMenu.hinput;
			mv_spd = lerp(mv_spd, (range[1] / 100) * sign(hinput), 0.08);
			
			if (hinput == 0) mv_spd = 0;
		
			moveSettingsValue(mv_spd, range, undefined);
		}
	}
	
	static draw = function(x, y) {
		var circle_pos	= (val - range[0]) / (range[1] - range[0]);
		var percent		= floor((circle_pos * 100));
		var look		= oMenu.item_look.slider;
		var c1			= oMenu.col.dkunsel_selint.c1;
		var c2			= oMenu.col.unsel_sel.c1;
		
		// Line
		draw_line_width_color(x, y, x + look.line.w, y, look.line.h, c1, c2);
		
		// Circle
		var marker_x = x + (circle_pos * look.line.w);
		
		// Mouse drag
		var grab_w = look.marker.rad * 1.5;
		
		if (isMouseInButton(marker_x, y, { w: grab_w, h: grab_w }) and oMenu.in.click.pressed) {
			dragged = true;
		} else if (oMenu.in.click.released) {
			dragged = false;
		}
		
		if (dragged) {
			marker_x = clamp(mouse_gui_x, x, x + look.line.w);
			setSettingsValue(save_key, lerp(range[0], range[1], ((marker_x - x) / look.line.w)), range);
		}
		
		draw_set_circle_precision(look.marker.circle_prec);
		draw_circle_color(marker_x, y, look.marker.rad, look.marker.col, look.marker.col, false);
		
		draw_set_circle_precision(24);	// Set back to default
		
		
		// Precentage text
		var txt_col = merge_color(c1, c2, circle_pos);
		draw_set_halign(fa_left);
		draw_set_color(txt_col);
		
		drawText(x + (look.line.w * 1.1), y, string(percent) + "%", oMenu.look.txt.normal.right_scale, false);
	}
}