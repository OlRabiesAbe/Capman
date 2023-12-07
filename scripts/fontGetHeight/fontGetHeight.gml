/// @func fontGetHeight(font, [scale])

/// @desc Gets a fonts height. Might not be 100% accurate!

/// @param {font} font      The font to get the height of
/// @param {real} [scale]   (Optional) Font height will be mulitiplied with this number (default: 1)

function fontGetHeight(font, scale) {
    if (scale == undefined) scale = 1;
    
    var font_before = draw_get_font();
    
    draw_set_font(font);
    var h = string_height("MW");
    draw_set_font(font_before);
    
    return h * scale;
}