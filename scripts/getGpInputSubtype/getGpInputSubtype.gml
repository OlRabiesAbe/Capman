enum e_gp_input_subtype {
	/// @member Gamepad button (e.g. a, b, x, y)
    button,
    /// @member Dpad
    dpad,
    /// @member Analog sticks
    axis,
    /// @member Triggers (e.g. gp_shoulderrb, gp_shoulderlb)
    trigger,
    /// @member Bumpers (e.g. gp_shoulderr, gp_shoulderl)
    bumper,
    /// @member Start button (e.g. gp_start, gp_select)
    start
}

/// @func getGpInputSubtype

/// @desc Returns the sub type of the gamepad input, which can be e_gp_input_subtype.button, dpad, axis, trigger, bumper and start. The enum can be found in the function.

/// @param {input} input	The input to get the type

/// @return {enum}

/// @example getGpInputSubtype(gamepadLast());

function getGpInputSubtype(in) {
    if (getInputType(in) == e_input_type.gamepad) {
        switch in {
			default:
				if (in == gp_axislr
                    or in == gp_axisll
                    or in == gp_axisrr
                    or in == gp_axisrl) {
                        return e_gp_input_subtype.axis;
                    }
				break;
			
            case gp_face1:
            case gp_face2:
            case gp_face3:
            case gp_face4:
                return e_gp_input_subtype.button;
                break;
                
            case gp_padr:
            case gp_padu:
            case gp_padl:
            case gp_padd:
                return e_gp_input_subtype.dpad;
                break;
                
            case gp_shoulderl:
            case gp_shoulderr:
                return e_gp_input_subtype.bumper;
                break;
                
            case gp_shoulderlb:
            case gp_shoulderrb:
                return e_gp_input_subtype.trigger;
                break;
                
            case gp_start:
            case gp_select:
            	return e_gp_input_subtype.start;
            	break;
        }
    } else {
        return undefined
    }
}