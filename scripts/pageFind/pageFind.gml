// This function is used by the menu system, you don't have to worry about it!
// Finds name, struct in a menu array

/// @func pageFind(arr)
/// @param {array} arr
/// @return {struct}

function pageFind(arr) {
	try {
		if (getlen(arr) > 1) {
			// Get number of presets
			var presets = getlen(arr) / 2;
			var mult = oMenu.menu_preset <= presets ? oMenu.menu_preset : 1;
		
			// Calculate position to get the value
			var pos = ((e_menu_element.val + 1) * mult) - 1;
		
			// Get values
			var name = arr[pos - 1];
			var item = arr[pos];
		} else {
			// If back button
			var name = arr[0];
			var item = undefined;
		}
		
		// Return values
		return {
			name: name,
			item: item
		}
	} catch(e) {
		return undefined;
	}
}