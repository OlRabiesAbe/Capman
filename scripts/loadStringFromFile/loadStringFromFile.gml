/// @func loadStringFromFile(filename)

/// @desc Loads a string from a file. If the file does not exists retruns undefined.

/// @param {string} filename	The file to load

/// @return {string/undefined}

/// @example loadStringFromFile("save.json");

function loadStringFromFile(filename){
	try {
		var buffer = buffer_load(filename);
		var str = buffer_read(buffer, buffer_string);
		buffer_delete(buffer);
		
		return str;
	} catch(error) {
		show_debug_message("###!!! Cannot load file: " + filename + " Reason: " + error.message + " UNDEFINED");
		return undefined;
	}
}