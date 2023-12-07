/// @func drawText(x, y, str, [scale], [outline_col])

/// @desc Draws text with a certain scale and outline

/// @param {real} 			x					Text x position
/// @param {real} 			y					Text y position
/// @param {string}			str					String to be drawn
/// @param {real} 			[scale]				Text scale (default: 1)
/// @param {color}			[outline_col]		The color of the outline or if nothing is passed in no outline will be drawn

/// @return {undefied}		N/A

function drawText(xx, yy, str, scale, oc) {
	if (str == undefined) str = "";
	if (scale == undefined) scale = 1;
	
	var before_col = draw_get_color();

	// Draw outline
	if (oc != undefined) {
		draw_set_color(oc);
		
		draw_text_transformed(xx + scale,	yy,			str, scale, scale, 0);
		draw_text_transformed(xx - scale,	yy,			str, scale, scale, 0);
		draw_text_transformed(xx,			yy + scale, str, scale, scale, 0);
		draw_text_transformed(xx,			yy - scale, str, scale, scale, 0);
	}

	// Draw text
	draw_set_color(before_col);
	draw_text_transformed(xx, yy, str, scale, scale, 0);
}