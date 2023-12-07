/// @func saveStringToFile(string, filename)

/// @desc Saves a string to a file.

/// @param {string} string		The string wich is going to be saved
/// @param {string} filename	The name under the file will be saved

/// @return {undefined} N/A

/// @example saveStringToFile();

function saveStringToFile(str, filename) {
	var buffer = buffer_create(string_byte_length(str)+1, buffer_fixed, 1);

	buffer_write(buffer, buffer_string,	str);
	buffer_save(buffer, filename);
	buffer_delete(buffer);
}