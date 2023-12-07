// Draws button for menu object
// If you want a different kind of button feel free to change the code

/// @func drawButton(x, y, name)
/// @param {real}	x
/// @param {real}	y
/// @param {string} name
/// @return {undefined} N/A

function drawButton(x, y, name) {
	var look = oMenu.item_look.button
		
	var x1 = x - look.w / 2;
	var x2 = x + look.w / 2;
	var y1 = y - look.h / 2;
	var y2 = y + look.h / 2;
	
	
	var col = oMenu.col.unsel_sel;
		
	draw_set_color(col.c1);
	draw_set_alpha(look.alpha);
		
	
	if (!look.text_only) {
		if (look.nine_slice) {
			// Nine slice
			var w = abs(x1 - x2) / sprite_get_width(look.nine_slice);
			var h = abs(y1 - y2) / sprite_get_height(look.nine_slice);
			draw_sprite_ext(look.nine_slice, 0, x1, y1, w, h, 0, c_white, look.alpha);
		} else {
			// Button body
			draw_set_circle_precision(look.cir_prec);
	
			var rad = look.roundness;
	
			draw_roundrect_ext(x1, y1, x2, y2, rad, rad, false);	// Button
		
			draw_set_alpha(1);
		
			// Outline
			draw_set_color(col.c2);
			draw_roundrect_ext(x1, y1, x2, y2, rad, rad, true);		// Ouline
		
			draw_set_circle_precision(24);
		}
	}
		
	// Text
	var txt = oMenu.look.txt.normal;
	
	drawSetText(col.c1, txt.font, fa_center, fa_middle);
	drawText(x, y, name, txt.scale, txt.outline_on ? col.c2 : false);
}