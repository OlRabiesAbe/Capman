// This function is used by the menu system, you don't have to worry about it!

/// @func getSettingsValue(default_val)
/// @param {any} default_val
/// @return {any}

function getSettingsValue(default_val) {
	if (variable_struct_get(global.settings, save_key) == undefined) {
		variable_struct_set(global.settings, save_key, default_val);
	}
	
	return variable_struct_get(global.settings, save_key);
}