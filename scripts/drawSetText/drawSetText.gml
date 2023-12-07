/// @func drawSetText(col, font, [halign], [valign])

/// @desc Changes drawing color, font and alignment in one line

/// @param {color}			col			Color
/// @param {font}			font		Font
/// @param {font_alignment}	[halign]	Horizontal alignment (default: fa_centre)
/// @param {font_alignment}	[valign]	Vertical alignment (default: fa_middle)

/// @return {undefined} N/A

function drawSetText(col, font, ha, va) {
	if (ha == undefined) ha = fa_center;
	if (va == undefined) va = fa_middle;

	draw_set_color(col);
	draw_set_font(font);
	draw_set_halign(ha);
	draw_set_valign(va);
}