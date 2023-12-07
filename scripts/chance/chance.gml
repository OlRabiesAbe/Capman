/// @func chance(percent)

/// @desc Returns true or false based on the chance

/// @param {float} percent	Chance as a float, so 0% is 0.0, 75% is 0.75, and 100% is 1.0

/// @return {bool}

function chance(percent) {
	return percent > random(1);
}