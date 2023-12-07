/// @func inRange(val, min, max)

/// @desc Checks if a value is in a certain range

/// @param {real} val	The value being checked
/// @param {real} min	Bottom range
/// @param {real} max	Top range

/// @return {bool}

function inRange(val, _min, _max) {
	return (val >= _min and val <= _max);
}