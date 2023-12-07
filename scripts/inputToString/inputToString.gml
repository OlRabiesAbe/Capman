/// @func inputToString(input)

/// @desc Turns any input into a string describing the input

/// @param {input}	input	The input to convert

/// @return {string}

/// @example inputToString(inputLast());

function inputToString(in) {
	var str = "";

	if (in == undefined) exit;
	
	var type = getInputType(in, true);

	switch (type) {
		case e_input_subtype.vk:
			switch (in) {

				case vk_up:			str = "Up";				break;
				case vk_down:		str = "Down";			break;
				case vk_left:		str = "Right";			break;
				case vk_right:		str = "Left";			break;
				case vk_space:		str = "Space";			break;
				case vk_shift:		str = "Shift";			break;
				case vk_control:	str = "Ctrl";			break;
				case vk_alt:		str = "Alt";			break;
				case vk_tab:		str = "Tab";			break;
				case vk_add:		str = "Add";			break;
				case vk_backspace:	str = "Bksp";			break;
				case vk_decimal:	str = "Dec";			break;
				case vk_delete:		str = "Alt";			break;
				case vk_divide:		str = "Div";			break;
				case vk_end:		str = "End";			break;
				case vk_enter:		str = "Enter";			break;
				case vk_escape:		str = "Esc";			break;
				case vk_home:		str = "Home";			break;
				case vk_insert:		str = "Ins";			break;
				case vk_lalt:		str = "Alt";			break;
				case vk_lcontrol:	str = "Ctrl";			break;
				case vk_lshift:		str = "Shift";			break;
				case vk_multiply:	str = "Mult";			break;
				case vk_pagedown:	str = "Pg Dn";			break;
				case vk_pageup:		str = "Pg Up";			break;
				case vk_pause:		str = "Pause";			break;
				case vk_printscreen: str = "PrtScr";		break;
				case vk_ralt:		str = "Alt";			break;
				case vk_rcontrol:	str = "Ctrl";			break
				//case vk_return:		str = "Return";			break;
				case vk_rshift:		str = "Shift";	break;
				case vk_subtract:	str = "-";		break;
	
				case vk_f1:			str = "F1";				break;
				case vk_f2:			str = "F2";				break;
				case vk_f3:			str = "F3";				break;
				case vk_f4:			str = "F4";				break;
				case vk_f5:			str = "F5";				break;
				case vk_f6:			str = "F6";				break;
				case vk_f7:			str = "F7";				break;
				case vk_f8:			str = "F8";				break;
				case vk_f9:			str = "F9";				break;
				case vk_f10:		str = "F10";			break;
				case vk_f11:		str = "F11";			break;
				case vk_f12:		str = "F12";			break;
	
				case vk_numpad0:	str = "Num 0";			break;
				case vk_numpad1:	str = "Num 1";			break;
				case vk_numpad2:	str = "Num 2";			break;
				case vk_numpad3:	str = "Num 3";			break;
				case vk_numpad4:	str = "Num 4";			break;
				case vk_numpad5:	str = "Num 5";			break;
				case vk_numpad6:	str = "Num 6";			break;
				case vk_numpad7:	str = "Num 7";			break;
				case vk_numpad8:	str = "Num 8";			break;
				case vk_numpad9:	str = "Num 9";			break;
				
				// Extra
				case vk_left_cmd:	str = "Cmd";			break;
				case vk_right_cmd:	str = "Cmd";			break;
				case vk_semicolon:	str = ";";				break;
				case vk_comma:		str = ",";				break; 
				case vk_dot:		str = ".";				break;
				case vk_equal:		str = "=";				break;
				case vk_slash:		str = "/";				break;
				case vk_backslash:	str = "\\";				break;
				case vk_singlequote: str = "'";				break;
				case vk_backtick:	str = "`";				break;
				case vk_pilcrow:	str = "§";				break;
				case vk_opening_square_bracket:	str = "[";	break;
				case vk_closing_square_breacket:str = "]";	break;
			}
			break;
		
		case e_input_subtype.gp:
			switch (in) {
				case gp_face1:		str = "A/Cross";		break;
				case gp_face2:		str = "B/Circle";		break;
				case gp_face3:		str = "X/Square";		break;
				case gp_face4:		str = "Y/Triangle";		break;
	
				case gp_padu:		str = "Pad Up";			break;
				case gp_padd:		str = "Pad Down";		break;
				case gp_padl:		str = "Pad Left";		break;
				case gp_padr:		str = "Pad Right";		break;
	
				case gp_shoulderl:	str = "L";				break;
				case gp_shoulderlb:	str = "LB";				break;
				case gp_shoulderr:	str = "R";				break;
				case gp_shoulderrb:	str = "RB";				break;
	
				case gp_start:		str = "Start"			break;
				case gp_select:		str = "Select"			break;
	
				case gp_stickl:		str = "LSB"				break;
				case gp_stickr:		str = "RSB"				break;
			}
			break;
			
		case e_input_subtype.mouse:
			switch (in) {
				case mb_left:	str = "LMB";			break;
				case mb_right:	str = "RMB";			break;
				case mb_middle:	str = "MMB";			break;
			}
			break
				
		case e_input_subtype.unicode:
			str = in;
			break;
			
		case e_input_subtype.gp_axis:
			if		(in == gp_axislu) str = "LS Up";
			else if (in == gp_axislr) str = "LS Right";
			else if (in == gp_axisld) str = "LS Down";
			else if (in == gp_axisll) str = "LS Left";
			else if (in == gp_axisru) str = "RS Up";
			else if (in == gp_axisrr) str = "RS Right";
			else if (in == gp_axisrd) str = "RS Down";
			else if (in == gp_axisrl) str = "RS Left";
			break;
	}

	return str;
}