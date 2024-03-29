/// @description Functions

draw_set_font(font_alagard);

///=====FUNCTIONS
///===============
function _drawScore() 
{
	draw_set_halign(fa_left);
	draw_set_colour(_c_TEXTWHITE);
	var _str = "Score " + string(obj_logic_supermanager.p_getRoundScore());
	draw_text_transformed(16, 24, _str, 1/10, 1/10, 0);
}

function _drawTotalScore() 
{
	draw_set_halign(fa_left);
	draw_set_colour(_c_TEXTWHITE);
	if (obj_logic_gamemanager.p_getGameplayMode()) //if we're in gameplay, we need roundscore + totalscore
	{
		var _str = "T.Score " + string(obj_logic_supermanager.p_getCurTotalScore());
	}
	else //if we're not in gameplay (in score menu), totalscore has been updated so we can just use it
	{
		var _str = "T.Score " + string(obj_logic_supermanager.p_getTotalScore());
	}
	draw_text_transformed(16, 8, _str, 1/10, 1/10, 0);
}

//draws clock in top right
function _drawClock() 
{
	draw_set_halign(fa_left);
	draw_set_colour(_c_TEXTWHITE);
	var _str = "TIME " + string(obj_logic_gamemanager.p_getGameTimeSeconds());
	draw_text_transformed(room_width-112, 8, _str, 1/10, 1/10, 0);
}

//draws lives text in the bottom left
function _drawLives() 
{
	draw_set_halign(fa_left);
	draw_set_colour(_c_TEXTWHITE);
	var _str = "LIVES ";
	
	if obj_logic_supermanager.p_getLives() > 3 
	{
		_str += string(obj_logic_supermanager.p_getLives());
	} 
	else 
	{
		for (var i = 0; i < obj_logic_supermanager.p_getLives(); i++)
			_str += " |";
	}
	
	draw_text_transformed(16, room_height-40, _str, 1/10, 1/10, 0);
}

//draw debug messages at top of screen
function p_drawDebugText(_message) 
{
	if alarm[2] == -1 {
		alarm[2] = 5 * room_speed;
		_debugMessage = _message;
		_isDebugTextUp = true;
	}
	
	draw_set_color(c_black);
	draw_rectangle(0, 8, room_width, 40, false);
	
	draw_set_halign(fa_center);
	draw_set_colour(c_green);
	
	draw_text_transformed(room_width/2, 16, _debugMessage, 1/10, 1/10, 0);
}

//draw a little text on 1up. should float upwards.
function p_draw1up() 
{
	
	if alarm[1] == -1 
	{
		alarm[1] = room_speed * 2;
		_is1upTextUp = true;
		obj_logic_soundplayer.p_play1up();
	}
	
	draw_set_halign(fa_left);
	draw_set_colour(_c_TEXTWHITE);
	
	var _str = "+1 LIFE";
	var _strY = (room_height-64) - ((room_speed*2) - alarm[1]);
	draw_text_transformed(64, _strY, _str, 1/10, 1/10, 0);
}

//draw round #, currently unused
function _drawRoundNum() 
{
	draw_set_halign(fa_left);
	draw_set_colour(_c_TEXTWHITE);
	var _str = "ROUND :" + string(obj_logic_supermanager._roundIndex);
	draw_text_transformed(16, room_height-16, _str, 1/10, 1/10, 0);
}

//gameover screen. Should make it look more visually distinct from deadScreen
function _drawGameOverScreen() 
{
	//vars defining a box 528px by 576px
	var _left = room_width/4/2;
	var _top = room_height/4/2;
	//var _right = room_width - (room_width/4/2);
	//var _bottom = room_height - (room_height/4/2);
	
	//var _lvlScore = obj_logic_supermanager.p_getRoundScore();
	var _ttlScore = obj_logic_supermanager.p_getTotalScore();
	//var _timerScnds = obj_logic_gamemanager.p_getTimerSeconds();
	
						//background box
	draw_sprite(spr_textbox_win, -1, _left, _top);
	
	//death message
	draw_set_halign(fa_center);
	draw_set_colour(_c_TEXTRED);
	
	var _str = "GAME OVER";
	draw_text_transformed(room_width/2, _top+32, _str, 2, 2, 0);
	_str = "YOU'VE JOINED THE DEAD";
	draw_text_transformed(room_width/2, _top+64, _str, 2, 2, 0);
	
	
	draw_set_halign(fa_center);
	draw_set_colour(_c_TEXTWHITE);
	
	//total cum. score
	_str = "TOTAL SCORE " + string(_ttlScore);
	draw_text_transformed( (room_width/2), _top+(64*6), _str, 2, 2, 0);
							
}

//dead, but not gameover CURRENTLY DISABLED 
function _drawDeadScreen() 
{
	//vars defining a box 528px by 576px
	var _left = room_width/4/2;
	var _top = room_height/4/2;
	//var _right = room_width - (room_width/4/2);
	//var _bottom = room_height - (room_height/4/2);
	
	var _lvlScore = obj_logic_supermanager.p_getRoundScore();
	var _ttlScore = obj_logic_supermanager.p_getTotalScore();
	//var _timerScnds = obj_logic_gamemanager.p_getTimerSeconds();
	
						//background box
	draw_sprite(spr_textbox_win, -1, _left, _top);
	
	//death message
	draw_set_halign(fa_center);
	draw_set_colour(_c_TEXTRED);
	
	var _str = "YOU DIED";
	draw_text_transformed(room_width/2, _top+64, _str, 2/10, 2/10, 0);
	
	draw_set_halign(fa_center);
	draw_set_colour(_c_TEXTWHITE);
	
	//total cum. score
	_str = "TOTAL SCORE " + string(_ttlScore);
	draw_text_transformed( (room_width/2), _top+(64*6), 
							_str, 2/10, 2/10, 0);
							
	//points til 1up
	_str = "POINTS TIL 1UP " + string(10000 - obj_logic_supermanager.p_getLives1up() + _lvlScore);
	draw_text_transformed( (room_width/2), _top+(64*7), _str, 1.5/10, 1.5/10, 0);
}

//round win screen
function _drawScoreScreen()
{
	//this ugly piece of code makes the box flash after the player presses space
	if (_isScoreScreenProgressing && current_time % 500 > 250)
		{}
	else 
	{
		//vars defining a box 528px by 576px
		var _left = room_width/4/2;
		var _top = room_height/4/2;
		//var _right = room_width - (room_width/4/2);
		var _bottom = room_height - (room_height/4/2);
	
		var _lvlScore = obj_logic_supermanager.p_getRoundScore();
		var _ttlScore = obj_logic_supermanager.p_getTotalScore();
		var _timerScnds = obj_logic_gamemanager.p_getTimerSeconds();
	
		//background box
		draw_sprite(spr_textbox_win, -1, _left, _top);
		
		_top += 16;
	
		//headline text
		draw_set_halign(fa_center);
		draw_set_colour(_c_TEXTYELLOW);
		if (_isScoreScreenProgressing) draw_set_colour(_c_TEXTRED);
	
		var _str = "AREA SURVIVED";
		draw_text_transformed(room_width/2, _top+32, _str, 2/10, 2/10, 0);
		_str = "Your quest progresses.";
		draw_text_transformed(room_width/2, _top+64, _str, 2/10, 2/10, 0);
	

		if (alarm[0] % room_speed == 0)
			obj_logic_soundplayer.p_playCoinGetPitched(7-(alarm[0]/room_speed));
		
		draw_set_halign(fa_center);
		draw_set_colour(_c_TEXTWHITE);
		if (_isScoreScreenProgressing) draw_set_colour(_c_TEXTRED);
	
		//total score
		if alarm[0] < 5 * room_speed 
		{
		
			_str = "Level score " + string(_lvlScore);
			draw_text_transformed( room_width/2, _top+(64*2.5), _str, 1.5/10, 1.5/10, 0);
		}
	
		//ingame time
		if alarm[0] < 4 * room_speed 
		{
			_str = "Time remaining " + string(_timerScnds);
			draw_text_transformed( room_width/2, _top+(64*3), _str, 1.5/10, 1.5/10, 0);
		}
	
		//time bonus
		if alarm[0] < 3 * room_speed 
		{
			_str = "Time remaining bonus " + string(_timerScnds*100);
			draw_text_transformed( (room_width/2), _top+(64*3.5), _str, 1.5/10, 1.5/10, 0);
		}
		//level score + time bonus
		if alarm[0] < 2 * room_speed 
		{
			draw_text_transformed( (room_width/2), _top+(64*4), "____________", 1.5/10, 1.5/10, 0);
			_str = "Sum level score " + string(_lvlScore+(_timerScnds*100));
			draw_text_transformed( (room_width/2), _top+(64*4.5), _str, 1.5/10, 1.5/10, 0);
		}
	
		//total cum. score
		if alarm[0] < 1 * room_speed 
		{
			_str = "== TOTAL SCORE " + string(_ttlScore) + " ==";
			draw_text_transformed( (room_width/2), _top+(64*6), _str, 2/10, 2/10, 0);
		}
	
		//points til 1up
		if alarm[0] < 1 * room_speed 
		{
			_str = "Points til next 1up " + string(10000 - obj_logic_supermanager.p_getLives1up());
			draw_text_transformed( (room_width/2), _top+(64*6.5), _str, 1/10, 1/10, 0);
		}
	
		draw_set_colour(_c_TEXTYELLOW);
		if (_isScoreScreenProgressing) draw_set_colour(_c_TEXTRED);
	
		_str = "PRESS SPACE TO PROCEED";
		draw_text_transformed(room_width/2, _bottom-64, _str, 1.5/10, 1.5/10, 0);
	}
}