var ls = global.axis_val_ls;
var map = global.axis_last_val;

var num = ds_list_size(ls);

for (var i = 0; i < num; i++) {
	var arr = ls[| i];
	
	var key = arr[0];
	var val = arr[1];
	
	map[? key] = val;
}

ds_list_clear(ls);