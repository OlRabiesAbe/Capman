/// @func print(values...)

/// @desc Prints out one or more values to the output window. Can print out data structures if supplyed in an array with the ds_type.

/// @param {any} values...

/// @return {undefined} N/A

function print() {
	for (var i = 0; i < argument_count; i++) {
		try {
			var item = argument[i];
			
			// Ds stuff
			var dses = [ds_type_list, ds_type_grid, ds_type_map];
			if (is_array(item) and getlen(item) == 2 and contains(dses, item[1])) {
				var type = item[1];
				item = item[0];
				
				switch type {
					case ds_type_list:
						item = "List " + string(item) + ": " + string(convertList(item));
						break;
						
					case ds_type_grid:
						print("Grid " + string(item) + ": ");
					
						var w = ds_grid_width(item);
						var h = ds_grid_height(item);
						
						for (var yy= 0; yy < h; yy++) {
							var str = "[ ";
							
							for (var xx = 0; xx < w; xx++) {
								str = str + string(item[# xx, yy]) + (xx != w - 1 ? ", " : "");
							}
							
							str = str + " ]";
							
							print(str);
						}
						
						print("");
						
						exit;
						break;
						
					case ds_type_map:
						item = "Map " + string(item) + ": " + json_encode(item)
						break;
				}
			}
			
			// Print
			show_debug_message(string(item));
		} catch(e) {
			show_debug_message("### Print error: " + e.message);
		}
	}
}