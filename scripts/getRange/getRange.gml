/// @func getRange(iter, [ds_type])

/// @desc Retruns the minimum an maximum values of any iterable data structure
/// @desc Works with arrays, ds_lists, ds_grids, ds_maps and structs
/// @desc Do NOT works with stacks, strings, queues and priority queues

/// @param {data_strucure}	iter 		Iterable data structure
/// @param {ds_type}		[ds_type]	(optional) Only if dealing with a ds

/// @return {stuct} A struct with a minimum and maximum value

function getRange(iter, ds_type) {
	static range = function(_min, _max) constructor {
		minimum = _min;
		maximum = _max;
	}
	
	del = false;
	
	// Turn ds maps to arrays
	if (ds_type == ds_type_map) {
		iter = ds_map_values_to_array(iter);
		ds_type = undefined;
	}
	
	if (ds_type == undefined) {
		// Turn it into a list
		if (is_array(iter)) {
			iter = convertList(iter);
			ds_type = ds_type_list;
			
			del = true;
		}
		
		// Turn struct to list
		if (is_struct(iter)) {
			var names = variable_struct_get_names(iter);
			var len = getlen(names);
			var ls = ds_list_create();
			
			for (var i = 0; i < len; i++) {
				ds_list_add(ls, iter[$ names[i]]);
			}
			
			iter = ls;
			
			ds_type = ds_type_list;
			del = true;
		}
	}
	
	if (ds_type != undefined) {
		// Dses
		var len = getlen(iter, ds_type) - 1;
		
		switch ds_type {
			case ds_type_list:
				ds_list_sort(iter, true);
				var rng = new range(iter[| 0], iter[| len]);
				if (del) ds_list_destroy(iter)
				return rng;
				delete rng
				break;
				
			case ds_type_grid:
				return new range(ds_grid_get_min(iter, 0, 0, len.w, len.h), ds_grid_get_max(iter, 0, 0, len.w, len.h));
		}
	}
}