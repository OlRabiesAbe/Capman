
gamepad_deadzone = 0.1;

#region Create maps (system)

global.axis_last_val = ds_map_create();
global.axis_val_ls = ds_list_create();

#endregion

#region Macros (system)

#macro gp_axislr	string(gp_axislh) + "+"
#macro gp_axisll	string(gp_axislh) + "-"
#macro gp_axislu	string(gp_axislv) + "-"
#macro gp_axisld	string(gp_axislv) + "+"

#macro gp_axisrr	string(gp_axisrh) + "+"
#macro gp_axisrl	string(gp_axisrh) + "-"
#macro gp_axisru	string(gp_axisrv) + "-"
#macro gp_axisrd	string(gp_axisrv) + "+"

#macro gp_a			gp_face1
#macro gp_b			gp_face2
#macro gp_x			gp_face3
#macro gp_y			gp_face4

#macro vk_left_cmd      92
#macro vk_right_cmd     91
#macro vk_semicolon     186
#macro vk_comma         188
#macro vk_dot           190
#macro vk_equal         24
#macro vk_slash         191
#macro vk_backslash     220
#macro vk_singlequote   222
#macro vk_pilcrow       10
#macro vk_backtick      2
#macro vk_opening_square_bracket    219
#macro vk_closing_square_breacket   221

#endregion

#region Input sprites (user)

// Here you can change the input sprites which are drawn by the drawInput() function. 

global.input_sprites = {
	key: {
		simple: sInpButton,
		wide:	sInpButtonWide,
		arrow:	sInpArrowKey
	},
	
	mouse : {
		left:	sInpMouseLeft,
		right:	sInpMouseRight,
		middle: sInpMouseMiddle
	},
	
	gamepad: {
		dpad:	sInpGamepadDpad,
		axis:	sInpGamepadAxis,
		start:	sInpGamepadStart,
		
		button: {
			a:	sInpGamepadButtonA,
			b:	sInpGamepadButtonB,
			x:	sInpGamepadButtonX,
			y:	sInpGamepadButtonY
		},
		
		trigger: {
			right:	sInpGamepadRightTrigger,
			left:	sInpGamepadLeftTrigger
		},
		
		bumper: {
			right:	sInpGamepadRightBumper,
			left:	sInpGamepadLeftBumper
		}
	}
};

#endregion

#region Get input ranges (system)

var keys = [vk_add, vk_alt, vk_anykey, vk_backspace, vk_control, vk_decimal, vk_delete, vk_divide, vk_down, vk_end, vk_enter, vk_escape,
			vk_f1, vk_f2, vk_f3, vk_f4, vk_f5, vk_f6, vk_f7, vk_f8, vk_f9, vk_f10, vk_f11, vk_f12, vk_home, vk_insert, vk_lalt, vk_lcontrol,
			vk_left, vk_lshift, vk_multiply, vk_nokey, vk_numpad0, vk_numpad1, vk_numpad2, vk_numpad3, vk_numpad4, vk_numpad5, vk_numpad6,
			vk_numpad7, vk_numpad8, vk_numpad9, vk_pagedown, vk_pageup, vk_pause, vk_printscreen, vk_ralt, vk_rcontrol, vk_return, vk_right,
			vk_rshift, vk_shift, vk_space, vk_subtract, vk_tab, vk_up, vk_left_cmd, vk_right_cmd, vk_semicolon, vk_comma, vk_dot, vk_equal, 
			vk_slash, vk_backslash, vk_singlequote, vk_pilcrow, vk_backtick, vk_opening_square_bracket, vk_closing_square_breacket];
			
var gamepad = [gp_axislh, gp_axislv, gp_axisrh, gp_axisrv, gp_face1, gp_face2, gp_face3, gp_face4, gp_padd, gp_padl, gp_padr, gp_padu, gp_select, 
				gp_shoulderl, gp_shoulderlb, gp_shoulderr, gp_shoulderrb, gp_start, gp_stickl, gp_stickr];

var mouse = [mb_any, mb_left, mb_middle, mb_none, mb_right];

global.keyboard_inputs = keys;
					

global.input_range = {
	key:			getRange(keys),
	gamepad:		getRange(gamepad),
	mouse:			getRange(mouse),
	ord_letters:	getRange([ord("A"), ord("Z")]),
	ord_numbers:	getRange([ord("0"), ord("9")])
};

// Debugging
//print("###########\nInput ranges\n", "Key", global.input_range.key, "Gamepad", global.input_range.gamepad, "Mouse", global.input_range.mouse, "\n\n");

#endregion

#region Gamepad last array (system)

global.gamepad_inputs = [gp_axislu, gp_axisld, gp_axislr, gp_axisll, gp_axisru, gp_axisrd, gp_axisrr, gp_axisrl];

//global.gamepad_inputs = array_create(array_length(gamepad) + array_length(axes));

var num = array_length(gamepad);
array_copy(global.gamepad_inputs, array_length(global.gamepad_inputs), gamepad, 0, num);

#endregion

#region Gamepads connected (system)

global.gamepads_connected = array_create(12, -1);

#endregion

#region Cleanup (system)

delete keys;
delete gamepad;
delete mouse;

#endregion