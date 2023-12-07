/// @func approach(value, [target], [amount])

/// @desc Moves a value by an amount towards a target value but not beyond it

/// @param {real} value		The value being moved
/// @param {real} [target]	The target value (default: 0)
/// @param {real} [amount]	The amount in wich the value is moved towards the target (defalut: 1)

/// @return {real}			The moved value

function approach(value, target, amount) {
	if (target == undefined) target = 0;
	if (amount == undefined) amount = 1;
	
	// Makeing sure amount is not negative
	amount = abs(amount);
	
	// Moving value towards target by amount but not beyond it
	if (value < target) {
		return min(value + amount, target);
	}
	else {
	    return max(value - amount, target);
	}
}