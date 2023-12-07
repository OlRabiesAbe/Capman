/// @func contains(ds, item, [ds_type])

/// @desc Checks if a data structure contains an item

/// @desc Works with: arrays, strings, structs, ds_lists, ds_maps and ds_grids
/// @desc Does NOT work with: stacks, queues and priority queues
/// @desc If checking a struct or a map than the names/keys will be checked not the values!

/// @param {data_structure} data_structure   The data structure
/// @param {any}            item             The item to look for
/// @param {ds_type}        [ds_type]        (optional) Only if dealing with a ds

/// @return {bool}

function contains(ds, item, ds_type) {
    if (ds_type == undefined) {
        // Array
        if (is_array(ds)) {
            var num = getlen(ds);
            
        	for (var i = 0; i < num; i++) {
        		if (ds[i] == item) {
        			return true;
        			break;
        		}
        	}
        }
        
        // String
        if (is_string(ds)) if (string_pos(item, ds) != 0) return true;
        
        // Struct
        if (is_struct(ds)) if (variable_struct_get(ds, item) != undefined) return true;
    } else {
        // Dses
        switch ds_type {
            case ds_type_list:
                if (ds_list_find_index(ds, item) != -1) return true;
                break;
            
            case ds_type_map:
                if (ds_map_find_value(ds, item) != undefined) return true;
                break;
                
            case ds_type_grid:
                var size = getlen(ds)
                if (ds_grid_value_exists(ds, 0, 0, size.w - 1, size.h - 1, item)) return true;
                break;
        }
    }
    
    return false;
}