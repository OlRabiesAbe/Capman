/// @desc Settings

/// @private
#macro gui_w display_get_gui_width()
/// @private
#macro gui_h display_get_gui_height()
/// @private
#macro mouse_gui_x device_mouse_x_to_gui(0)
/// @private
#macro mouse_gui_y device_mouse_y_to_gui(0)

#region Settings struct setup (system)
	
	// Menu save file name
	save_filename = "menu_save.json";
	
	// Load menu save
	global.settings = loadFromJson(save_filename);

#endregion

#region Audio settings (user)

	audio = {
		press:		snButtonPress,		// Button press
		shift:		snMenuShift,		// Settings shift
		move:		snMenuMove,			// Button change
		page_shift:	snMenuPageShift,	// Page shift
		back:		snMenuBack,			// Back button sound
		
		pause:		snPause,			// Pause game
		resume:		snResume,			// Resume game
		
		mouse_select: false				// (bool) Wether to play the move sound when selecting with mouse or not
	}

#endregion

#region Credits text (user)

var credits_string = 
	@"
A Beam Brain Production

Menu System Made By
Milan Varady
"

#endregion

#region Look settings (user)

	// Settings marked with the (A) tag can be set to auto (automatic)
	// If so the system will predict an appropriate size for the item
	#macro auto "automatic"
	
	// This variable changes the scale of automatic items
	// In most cases you do not want to change this!
	// But is so value in range of 0.8 - 1.2 is recommended
	auto_scale = 1;

	// Text style, color, and position settings
	look = {
		// Text
		txt: {
			// Used when drawing most of the things
			normal: {
				font:			font_alagard,	// Text font
				scale:			auto,		// (A) Text scale
				right_scale:	auto,		// (A) Right side text scale (slider, toggle...)
				outline_on:		true		// (bool) Whether the text should be outlined or not
			},
			
			// Used when drawing smaller things (e.g. Input icons, information text at the bottom)
			small: {
				font:		font_alagard,		// Text font
				scale:		auto,		// (A) Text scale
				outline_on:	true		// (bool) Whether the text should be outlined or not
			}
		},
		
		// Color
		col: {
			// Color used when an item is selected
			selected: {
				normal:		$003323B0,	// Default color
				intense:	$002CB8E0		// More intense color
			},
			
			// Color used when an item is not selected
			unselected:	{
				normal: 	$00EBE4C3,	// Default color
				dark:		$00EBE4C3		// More dark color
			}
		},
		
		// Position
		pos: {
			// Space between items
			buffer: {
				x:	auto,	// (A) Space between the things and the line in the middle
				y:	auto,	// (A) Space between items (vertically)
			},
			
			// The menu's position
			menu_pos: {
				x:	0,		// Whole menu's x offset from the middle
				y:	auto	// (A) Whole menu's y position (if set to auto menu will be in the middle)
			}
		}
	};
	
	// Look of idividual items
	item_look = {
		// Dividing line (line in the middle)
		div_line: {
			col: c_white	// Color of the line
		},
		
		// Button (in the middle)
		button: {
			w:			auto,		// (A) Button width
			h:			auto,		// (A) Button height
			y_buffer:	auto,		// (A) Space between buttons
			roundness:	0,		// (A) Corner roundness
			cir_prec:	24,			// Circle precision (Must be divisible by 4!)
			alpha:		0.6,		// Button's alpha
			
			text_only:	false,		// (bool) If set to true no background and outline will be drawn
			nine_slice:	spr_menu_button_small		// (sprite) If sprite is set it will be used for the button's background
		},
			
		// Toggle
		toggle: {
			buffer: auto		// (A) Space between the ON and OFF text
		},
		
		// Slider
		slider: {
			// Line
			line: {
				w:				auto,		// (A) The width of the line
				h:				auto,		// (A) The height of the line
			},
			
			// Marker (the circle that shows the current value)
			marker: {
				rad:			auto,								// (A) Circle radius
				circle_prec:	4,									// Circle precision (Must be divisible by 4!)
				col:			oMenu.look.col.unselected.normal	// Circle color
			}
		},
		
		// Controls
		controls: {
			x_offset: 0,		// The input menu's offset horizontally
			max_inputs: 4,		// Maximum number of inputs allowed
			
			// Icon (on the right side of the menu)
			icon: {
				scale:			auto,							// (A) Scale of the icon
				x_buffer:		auto,							// (A) Space between icons
				highlight_col:	oMenu.look.col.selected.normal,	// The color theme of the icon
				replace_col:	make_color_rgb(237, 0, 140),	// The color that is being replaced with the theme color
				
				// Text (when drawing keys)
				txt: {
					scale:		auto,							// (A) Text scale
					font:		oMenu.look.txt.small.font		// Text font
					
				}
			},
			
			// Selected item rectangle
			rect: {
				w:				auto,								// (A) Width
				h:				auto,								// (A) Height
				roundness:		auto,								// (A) Corner roundness
				col:			oMenu.look.col.unselected.normal,	// Color
				
				// Alpha values
				alpha: {
					unselected:	0.2,	// Unselected alpha
					selected:	0.5,	// Selected alpha
					edit:		0.8		// Edit mode alpha
				}
			},
			
			reset_button_name:	"Reset Defaults" 	// Reset defaults button name 
		},
		
		// Credits
		credits: {
			// Credits text
			txt: {
				font:			oMenu.look.txt.normal.font,			// Text font
				col:			oMenu.look.col.selected.normal,		// Text color
				scale:			auto,								// (A) Text scale
				outline_col:	c_black								// Outline color or false if you don't want an outline
			},
			
			// Background
			bg: {
				col:			c_black,							// Background color
				alpha:			0.8									// Background alpha
			},
			
			scrolling_speed:	auto								// (A) Text scrolling speed
		},
		
		// Back button
		back_button: {
			name: "Back"	// Previous menu page button name
		}
	};
	
#endregion

#region Animation settings (user)
	
	anim = {
		// Button in the middle
		button: {
			anim_on:		true,	// (bool) Animation on
			travel_dis:		auto,	// (A) Travel distance (downwards)
			speed:			0.3		// Travel speed
		},
		
		// Buttons on the left side
		sidebar: {
			anim_on:		true,	// (bool) Animation on
			travel_dis: 	auto,	// (A) Travel distance (to the left)
			speed:			0.3		// Travel speed
		}
	};
	
#endregion
	
#region Scrolling settings (user)
	
	scrolling = {
		speed:		0.2,	// Scrollig speed
		disappear:	true	// (bool) Whether items should disappear when they go above menu start position or not
	};

#endregion

#region Pause settings (user)

	pause_settings = {
		menu_ypos:		auto,		// (A) The menu's y position when the game is paused
		
		// Rectangle
		rect: {
			col:		c_black,	// Color
			alpha:		0.8			// Alpha (opacity)
		},
		
		// Text
		txt: {
			enabled:	true,						// (bool) Whether the text is enabled or not
			col:		look.col.selected.normal,	// Text color
			outline_col:look.col.unselected.normal,	// Outline color or undefined if the outline is not needed
			scale:		auto,						// Text scale
			str:		"Game Paused"				// The text to be drawn
		}
	}

#endregion

#region Menu array (user)


	menu = [
		
		["Start", new ScriptRunner( function() { 
										menuModePause(); 
										menuSetPreset(e_menu_presets.pause_menu);
										room = room_forest_00
										}),

		"Resume", new ScriptRunner(resumeGame)],
		
		["Settings", [
	        ["Audio", [
	            ["Sounds",      new Slider([0, 1], 1,           "audio_sounds")],
	            ["Music",       new Slider([0, 1], 1,           "audio_music")]
	        ]],

	        ["Graphics", [
	            ["Window Mode", new Shift(["Windowed", "Fullscreen"], 1, "window_mode")]
	        ]],

	        //["Controls", new Controls(global.input_sys, "input_save.json", true, ["right", "left", "up", "down"])]
	    ]],
		
		["Quit",    new ScriptRunner(game_end)]
	];


	
	
	enum e_menu_presets {
		title_screen,
		pause_menu
	}

#endregion

#region Input setup (user)

	in_sys = new InputSystem({
		up:		["W",		vk_up,		gp_padu,	gp_axislu],		// Move up
		down:	["S",		vk_down,	gp_padd,	gp_axisld],		// Move down
		right:	["D",		vk_right,	gp_padr,	gp_axislr],		// Move right
		left:	["A",		vk_left,	gp_padl,	gp_axisll],		// Move left
		enter:	[vk_space,	vk_enter,	gp_a],						// Press button
		click:	[mb_left],											// Mouse click
		back:	["Q",		vk_escape,	gp_b],						// Previous page
		
		pause:	[vk_escape,	"p", gp_start, gp_select]				// Pause/Resume
	});

#endregion

#region Automatic values (system)

// Get font height
text_height = {};

var updateTextHeight = function() {
	text_height.normal = fontGetHeight(look.txt.normal.font, look.txt.normal.scale == auto ? 1 : look.txt.normal.scale);
	text_height.small = fontGetHeight(look.txt.small.font, look.txt.small.scale == auto ? 1 : look.txt.small.scale);
}

updateTextHeight();

// Atomate function
var automate = function(struct, name, val) {
	if (struct[$ name] == auto) struct[$ name] = roundToN(val, 1) * auto_scale;
}

// Atomate stuff

// Text scale
automate(look.txt.normal,		"scale",	(gui_h / 14) / text_height.normal);
updateTextHeight();
automate(look.txt.small,		"scale",	text_height.normal * 0.5 / text_height.small);
automate(look.txt.normal,		"right_scale",	look.txt.normal.scale * 0.8);

// X and y buffer
automate(look.pos.buffer,		"x",		gui_w / 28);
automate(look.pos.buffer,		"y",		text_height.normal * 1.3);

// Get the width of the sides
var r_side_w = ((gui_w / 2) - look.pos.menu_pos.x - (look.pos.buffer.x * 2));

// Button
automate(item_look.button,		"w",		gui_w / 2.6);
automate(item_look.button,		"h",		text_height.normal * 1.2);
automate(item_look.button,		"y_buffer",	item_look.button.h * 1.3);
automate(item_look.button,		"roundness",item_look.button.h * 0.4);

// Toggle
automate(item_look.toggle,		"buffer",	r_side_w * 0.2);

// Slider
automate(item_look.slider.line, "w",		r_side_w * 0.6);
automate(item_look.slider.line, "h",		text_height.normal * 0.14);
automate(item_look.slider.marker,"rad",		item_look.slider.line.h);

// Controls
var icon_h = sprite_get_height(global.input_sprites.key.simple);

automate(item_look.controls.icon,		"x_buffer",	r_side_w / item_look.controls.max_inputs);
automate(item_look.controls.icon,		"scale",	text_height.normal / icon_h);
automate(item_look.controls.icon.txt,	"scale",	((icon_h * item_look.controls.icon.scale) * 0.6) / (text_height.small));
automate(item_look.controls.rect,		"w",		item_look.controls.icon.x_buffer * 0.9);
automate(item_look.controls.rect,		"h",		sprite_get_height(global.input_sprites.key.simple) * item_look.controls.icon.scale * 1.2);
automate(item_look.controls.rect,		"roundness",oMenu.item_look.button.roundness);

// Credits
draw_set_font(item_look.credits.txt.font);
var str_w = undefined;
if (variable_instance_exists(id, "credits_string")) str_w = string_width(credits_string);
automate(item_look.credits.txt,	"scale",			str_w != undefined ? ((gui_w / str_w) * 0.8) : look.txt.normal.scale * 0.6);

automate(item_look.credits,		"scrolling_speed",	gui_h / 400)

// Animation
automate(anim.button,		"travel_dis",	item_look.button.h * 0.2);
automate(anim.sidebar,		"travel_dis",	look.pos.buffer.y);

// Pause
draw_set_font(look.txt.normal.font);
var str_w = string_width(pause_settings.txt.str);

automate(pause_settings.txt,	"scale",		(gui_w / 3) / str_w);
automate(pause_settings,		"menu_ypos",	pause_settings.txt.enabled ? (gui_h / 5 + look.pos.buffer.y * 2) : (look.pos.menu_pos.y));

// Clean up
delete text_height;

#endregion

#region Other stuff (system)
	
	#region Functions (system)
	
	function col2(selected, c1, c2) {
		return selected ? {c1: c2, c2: c1} : {c1: c1, c2: c2};
	}
	
	function saveMenu() {
		saveToJson(global.settings, save_filename);
	}
	
	#endregion
	
	#region Other vars (system)
	
	menu_enabled = true;
	pause_enabled = false;
	menu_preset = 1;
	
	enum e_menu_element {
		name,
		val
	}
	
	// Animation
	enum e_anim_state {
		idle,
		increase,
		decrease,
		stop
	}
	
	enum e_anim_type {
		button,
		sidebar
	}
	
	enum e_input_mode {
		mouse,
		keyboard
	}
	
	sidebar_elements = ["Slider", "Toggle", "Shift", "Input"];
	
	page = menu;
	active_objs = [];
	paused = false;
	pause_surf = -1;
	menu_option = 0;
	menu_option_prev = menu_option;
	mouse_pos_prev = [mouse_gui_x, mouse_gui_y];
	prev_pages = ds_stack_create();
	inputting = false;
	sn = undefined;
	menu_extension = undefined;
	anim_array = [];
	scrolling_y = undefined;
	scrolling_y_to = 0;
	in_column = 0;
	input_mode = e_input_mode.keyboard;
	
	#endregion

#endregion