/// @func ScriptRunner(method)

/// @desc Calls a method on press

/// @param {method}	method	The method wich will be run on press

/// @return {struct}

/// @example new ScriptRunner(function() { room_goto(rGame); })

function ScriptRunner(func) : MenuElement() constructor {
	self.func = func;
	
	static on_press = function() {
		// Call method
		func();
		with (oMenu) sn = oMenu.audio.press;
	}
}