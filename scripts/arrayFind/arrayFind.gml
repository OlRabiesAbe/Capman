/// @func arrayFind(array, item)

/// @desc Finds a value in an array and returns its index.

/// @param {array}  array   The array
/// @param {any}    item    Item to find
/// @param {bool}   [all]   Whether to find all of the occurrences or just the first. All will be returned in an array. (default: false)

/// @return {real/array}

function arrayFind(array, item, _all) {
    if (_all == undefined) _all = false;
    
    var len = getlen(array);
    var ind_arr = [];
    
    for (var i = 0; i < len; i++) {
        if (array[i] == item) {
            if (!_all) {
                delete ind_arr;
                return i;
            } else {
                array_push(ind_arr, i);
            }
        }
    }
    
    return ind_arr;
}