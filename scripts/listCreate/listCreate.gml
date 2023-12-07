/// @func listCreate(items...)

/// @desc Creates a list and adds items to it in one line

/// @param {any} items...

/// @return {ds_list} The list created

function listCreate() {
	var ls = ds_list_create();
	
	for (var i = 0; i < argument_count; i++) {
		ds_list_add(ls, argument[i]);	
	}
	
	return ls;
}