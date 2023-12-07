/// @func roundToN(num, decimal_places)

/// @desc Rounds a number to n decimal places

/// @param {real} num               The number to round
/// @param {real} decimal_places    The number of decimal places to round to

/// @return {real}

function roundToN(num, dec) {
    return real(string_format(num, 0, dec));
}