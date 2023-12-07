/// @func inputSystem(inputs)

/// @desc This constructor creates a new input system.

/// @param {struct} inputs  The inputs in this format {name1: [in1, in2, in3...], name2: [in1, in2, in3...]...}

/// @return {struct} The input system

/// @example
/// ```gml
/// in_sys = new InputSystem({
///     right:  [vk_right,  "d", gp_padr, gp_axislr],
///     left:   [vk_left,   "a", gp_padl, gp_axisll],
///     jump:   [vk_up,     "w", gp_a],
///     shoot:  [vk_space,  gp_shoulderrb, gp_x]
/// });
/// ```

function InputSystem(inputs) constructor {
    self.inputs = inputs;
    
    gamepad_device = 0;
    
    /// @func check([gamepad_device])
    /// @desc Checks for the inputs. Retrurns a struct of each with a down, pressed, and released value. (e.g. right: {down: true, pressed: false, released: true)
    /// @param {real} [gamepad_device]  Gamepad device (default: 0)
    /// @return {struct}
    /// @example in = in_sys.check();

    static check = function(gp_num) {
        if (is_real(gp_num)) gamepad_device = gp_num;
        
        // Create empty input struct
        var in_strc = {};
        
    	// Loop through the inputs
    	var names = variable_struct_get_names(inputs)
    	var len = getlen(names);
    	
    	for (var i = 0; i < len; i++) {
    	    var name = names[i];
    	    var arr = inputs[$ name];
    	    
    	    // Check for input  
    		var input = inputCheck(arr, CHECK_MODE.DOWN, gamepad_device);
    		var input_pressed = inputCheck(arr, CHECK_MODE.PRESSED, gamepad_device);
			var input_released = inputCheck(arr, CHECK_MODE.RELEASED, gamepad_device)
    	
    		// Add input to struct
    		in_strc[$ (name)] = {
    		    down:		input,
    		    pressed:	input_pressed,
				released:	input_released
    		};
    	}
    	
    	// Return input struct
    	return in_strc;
    	
    	// Delete input struct
    	delete in_strc;
    }
    
    /// @func save(filename)
    /// @desc Saves the inputs to a file.
    /// @param {string} filename    The name under the file will be saved
    /// @return {undefined} N/A
    /// @example in_sys.save();
    
    static save = function(filename) {
        if (is_string(filename)) saveToJson(inputs, filename);
    }
    
    /// @func load(filename)
    /// @desc Loads a saved input file.
    /// @param {string} filename    The file to load
    /// @return {undefined} N/A
    /// @example in_sys.load();
    
    static load = function(filename) {
        if (is_string(filename)) {
            var loaded_inputs = loadFromJson(filename);
            
            if (is_struct(loaded_inputs) and getlen(loaded_inputs) > 0) inputs = loaded_inputs;
            
            delete loaded_inputs;
        }
    }
    
    /// @func describe()
    /// @desc Lists the currents inputs to the output window. Good for debugging purposes.
    /// @return {undefined} N/A
    /// @example in_sys.describe();
    
    static describe = function() {
        var str = json_stringify(inputs);
        str = string_replace(str, "{ ", "inputs {\n\t");
        str = string_replace_all(str, "], ", "],\n\t");
        str = string_replace(str, " }", "\n}")
        
        print(str);
    }
    
    /// @func clear()
    /// @desc Clears the input struct
    /// @return {undefined} N/A
    /// @example in_sys.clear();
    
    static clear = function() {
        inputs = {};
    }
}