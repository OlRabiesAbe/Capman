/// @func drawInput(x, y, input, font, [scale], [col], [replace_col], [txt_scale], [left_origin])

/// @desc Draws an input to the screen as an icon
/// @desc Icon sprites can be changed in oInputManager's input sprites region

/// @param {real}	x				Icon x position
/// @param {real}	y				Icon y position
/// @param {input}	input			The input to be drawn
/// @param {font}	font			Text font
/// @param {real}	[scale]			Icon scale (default: 1)
/// @param {color}	[col]			Icon color theme (default: c_red)
/// @param {color}	[replace_col]	The color to be replaced with the theme color (default: $8c0ed)
/// @param {real}	[txt_scale]		Text scale (default: 1)
/// @param {bool}	[left_origin]	If true sprites will be drawn with the origin on the left (default: false)

/// @return {undefined} N/A

/// @example drawInput(x, y, inputLast(), fDefault, 1, c_red, c_fuchsia, 2, false);

function drawInput(x, y, input, font, scale, col, replace_col, txt_scale, left_origin) {
	if (scale == undefined) scale = 1;
	if (col == undefined) col = c_red;
	if (replace_col == undefined) replace_col = $8c0ed;
	if (txt_scale == undefined) txt_scale = 1;
	if (left_origin == undefined) left_origin = false;
	
	#region Draw input icon function
	
	static drawInputIcon = function(spr, xx, yy, scale, rot, col, replace_col, font, str, txt_scale, left_origin) {
		if (spr == undefined) exit;
		
		#region Shader stuff
		
		var sh = shChangeHighlightColor;
		
		var c = {
			r: color_get_red(col)		/ 255,
			g: color_get_green(col)	/ 255,
			b: color_get_blue(col)	/ 255
		}
		
		var replace_c = {
			r: color_get_red(replace_col)		/ 255,
			g: color_get_green(replace_col)	/ 255,
			b: color_get_blue(replace_col)	/ 255
		}
		
		shader_set(sh);
		
		// Get uniform handlers
		var un_col = shader_get_uniform(sh, "highlight_col");
		var un_rep_col = shader_get_uniform(sh, "replace_col");
		
		// Set the uniforms
		shader_set_uniform_f(un_col, c.r, c.g, c.b, 1.);
		shader_set_uniform_f(un_rep_col, replace_c.r, replace_c.g, replace_c.b, 1.);
		
		#endregion
		
		// Draw icon
		var spr_w_half = floor(sprite_get_width(spr) / 2);
		var spr_h_half = floor(sprite_get_height(spr) / 2);
		
		// Set origin
		sprite_set_offset(spr, spr_w_half, spr_h_half);
		
		// Left origin 
		xx += left_origin ? spr_w_half * scale : 0;
		
		// Draw sprite
		draw_sprite_ext(spr, 0, xx, yy, scale, scale, rot * -90, c_white, 1);
		
		shader_reset();
		
		// Draw text
		if (is_string(str)) {
			drawSetText(col, font);
			drawText(xx, yy, string_upper(str), txt_scale, false);
		}
	}
	
	#endregion
	
	var spr = undefined;
    var str = "";
    var rot = 0;
    
    var type = getInputType(input, true);
    
    switch type {
        #region Keys
        
        // Ord
        case e_input_subtype.unicode:
            spr = global.input_sprites.key.simple;
            str = inputToString(input);
            break;
        
        // Vk
        case e_input_subtype.vk:
        	str = inputToString(input);
        	
        	spr = global.input_sprites.key.wide;
        
        	var arrows = [vk_right, vk_left, vk_up, vk_down];
        	
        	if (contains(arrows, input)) {
    			spr = global.input_sprites.key.arrow;
    			str = "";
    			
    			switch input {
    				case vk_right:	rot = 0;	break;
    				case vk_down:	rot = 1;	break;
    				case vk_left:	rot = 2;	break;
    				case vk_up:		rot = 3;	break;
    			}
        	}
        	
        	delete arrows;
            break;
            
        #endregion
        
        #region Gamepad
        
        case e_input_subtype.gp:
            var gp_type = getGpInputSubtype(input);
            
            switch gp_type {
                #region Dpad
                
                case e_gp_input_subtype.dpad:
                    spr = global.input_sprites.gamepad.dpad;
                    
                    switch input {
                        case gp_padr:   rot = 0;    break;
                            
                        case gp_padd:   rot = 1;    break;
                            
                        case gp_padl:   rot = 2;    break;
                            
                        case gp_padu:   rot = 3;    break;
                    }
                    
                	break;
                
                #endregion
                
                #region Buttons
                
                case e_gp_input_subtype.button:
                    switch input {
                        case gp_a:  spr = global.input_sprites.gamepad.button.a;    break;
                            
                        case gp_b:  spr = global.input_sprites.gamepad.button.b;    break;
                            
                        case gp_x:  spr = global.input_sprites.gamepad.button.x;    break;
                            
                        case gp_y:  spr = global.input_sprites.gamepad.button.y;    break;
                    }
                    break;
                    
                #endregion
                
                #region Trigger 
                
                case e_gp_input_subtype.trigger:
                    switch input {
                        case gp_shoulderlb:  spr = global.input_sprites.gamepad.trigger.left;	break;
                            
                        case gp_shoulderrb:  spr = global.input_sprites.gamepad.trigger.right;	break;
                    }
                    break;
                
                #endregion
                
                #region Bumper
                
                case e_gp_input_subtype.bumper:
                    switch input {
                        case gp_shoulderl: spr = global.input_sprites.gamepad.bumper.left;	break;
                            
                        case gp_shoulderr: spr = global.input_sprites.gamepad.bumper.right;	break;
                    }
                    break;
                
                #endregion
                
            	#region Start
            	
            	case e_gp_input_subtype.start:
            		spr = global.input_sprites.gamepad.start;
            	
            	#endregion
            
            }
            break;
            
        #endregion
        
        #region Gamepad axis
            
        case e_input_subtype.gp_axis:
            spr = global.input_sprites.gamepad.axis;
            
            if (input == gp_axislr or input == gp_axisrr) rot = 0;
            if (input == gp_axisld or input == gp_axisrd) rot = 1;
            if (input == gp_axisll or input == gp_axisrl) rot = 2;
            if (input == gp_axislu or input == gp_axisru) rot = 3;
            
            break;
            
        #endregion
        
        #region Mouse
        
        case e_input_subtype.mouse:
            switch input {
                case mb_left:   spr = global.input_sprites.mouse.left;      break;
                    
                case mb_middle: spr = global.input_sprites.mouse.middle;    break;
                    
                case mb_right:  spr = global.input_sprites.mouse.right;     break;
            }
            
            break;
            
        #endregion
    }
    
    if (spr == global.input_sprites.key.wide and str == "") str = "?";
    
    drawInputIcon(spr, x, y, scale, rot, col, replace_col, font, str, txt_scale, left_origin);
}