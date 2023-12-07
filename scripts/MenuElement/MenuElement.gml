/// @func MenuElement()

/// @desc Parent constructor of all other elements

/// @return {struct}

/// @private

function MenuElement() constructor {
	/// @func setSettingsValue(value_key, val)
	/// @param {string} value_key
	/// @param {real}	val
	/// @return {undefined} N/A
	/// @private
	
	static setSettingsValue = function(value_key, new_val, range_arr=[0, 1]) {
		global.settings[$ value_key] = roundToN(new_val, 2);
		val = clamp(new_val, range_arr[0], range_arr[1]);
	}
	
	/// @func moveSettingsValue(amount, range_arr, sound)
	/// @param {real}	amount
	/// @param {array}	range_arr
	/// @param {sound}	[sound]
	/// @return {undefined} N/A
	/// @private
	
	static moveSettingsValue = function(amount, range_arr, sound) {
		var new_val = val + amount;
		
		if (amount != 0) {
			if (inRange(new_val, range_arr[0], range_arr[1]) and sound != undefined) oMenu.sn = sound;
			
			
			val = clamp(new_val, range_arr[0], range_arr[1]);
			setSettingsValue(save_key, val, range_arr);
		}
	}
}