/// @func Toggle(default_val, save_key)

/// @desc Toggles a value ON or OFF. The settings struct value is a boolian value (0 or 1).

/// @param {real}	default_val		Default value if save file doesn't exists
/// @param {string} save_key		The name under the value is being stored in the settings struct

/// @return {struct}

/// @example new Toggle(1, "blood_effects")

function Toggle(default_val, save_key) : MenuElement() constructor {
	self.save_key	= save_key;
	val				= getSettingsValue(default_val);
	
	static on_select = function() {
		moveSettingsValue(oMenu.hinput_pressed, [0, 1], oMenu.audio.shift);
	}
	
	static draw = function(x, y) {
		var look = oMenu.item_look.toggle;
		var txt_scale = oMenu.look.txt.normal.right_scale;
		
		// Mouse
		if (oMenu.in.click.pressed) {
			var txt_x = x + oMenu.look.pos.buffer.x;
			
			if (isMouseInButton(txt_x, y, { w: look.buffer, h: oMenu.look.pos.buffer.y })) moveSettingsValue(-1, [0, 1], oMenu.audio.shift);
			else if (isMouseInButton(txt_x + look.buffer, y, { w: look.buffer, h: oMenu.look.pos.buffer.y })) moveSettingsValue(1, [0, 1], oMenu.audio.shift);
		}
		
		var c1 = oMenu.col.unsel_sel.c1;
		var	c2 = oMenu.look.col.unselected.dark;
		
		draw_set_color(val == 0 ? c1 : c2);
		drawText(x, y, "off", txt_scale, false);

		draw_set_color(val == 1 ? c1 : c2);
		drawText(x + look.buffer, y, "on", txt_scale, false);
	}
}