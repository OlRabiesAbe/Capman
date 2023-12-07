/// @func convertList(ds_list/array)

/// @desc Converts a ds_list into an array and vice versa

/// @param {ds_list/array}  ds_list/array    The list/array to be converted

/// @return {ds_list/array}

function convertList(ds) {
    if (is_array(ds)) {
        var len = getlen(ds);
        
        var ls = ds_list_create();
        
        for (var i = 0; i < len; i++) {
            ds_list_add(ls, ds[i]);
        }
        
        return ls;
    } else {
        var len = getlen(ds, ds_type_list);
        
        var arr = array_create(len);
        
        for (var i = 0; i < len; i++) {
            arr[i] = ds[| i];
        }
        
        return arr;
    }
}