/// @func getlen(iter, [ds_type])

/// @desc Retruns the length of any iterable data structure. Grid length is returned in a struct with a w (width), and h (height) value

/// @param {data_structure} iterable
/// @param {ds_type}        [ds_type] (optional) Only if getting the length of a ds

/// @return {real} Length of the iterable

function getlen(iter, ds_type) {
    if (ds_type == undefined) {
        if (is_array(iter)) return array_length(iter);
        if (is_string(iter)) return string_length(iter);
        if (is_struct(iter)) return variable_struct_names_count(iter);
    } else {
        switch ds_type {
            case ds_type_list:
                return ds_list_size(iter);
                break;
            
            case ds_type_map:
                return ds_map_size(iter);
                break;
                
            case ds_type_stack:
                return ds_stack_size(iter);
                break;
                
            case ds_type_queue:
                return ds_queue_size(iter);
                break;
                
            case ds_type_grid:
                return {
                    w: ds_grid_width(iter),
                    h: ds_grid_height(iter)
                }
                break;
                
            case ds_type_priority:
                return ds_priority_size(iter);
                break;
        }
    }
}