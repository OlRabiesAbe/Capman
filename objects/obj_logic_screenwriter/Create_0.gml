/// @description Functions

function _drawScore() 
{
	draw_set_halign(fa_left);
	draw_set_colour(_c_TEXTWHITE);
	var _str = "SCORE " + string(obj_logic_supermanager.p_getRoundScore());
	draw_text(16, 16, _str);
}

function _drawClock() 
{
	draw_set_halign(fa_left);
	draw_set_colour(_c_TEXTWHITE);
	var _str = "TIME " + string(obj_logic_gamemanager.p_getGameTimeSeconds());
	draw_text(room_width-112, 16, _str);
}

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
			_str += " O";
	}
	
	draw_text(16, room_height-32, _str);
}

//draw a little text on 1up. should float upwards.
///TEXT NOT DISPLAYING
function p_draw1up() {
	
	if alarm[1] == -1 
	{
		alarm[1] = 5 * room_speed;
		obj_logic_soundplayer.p_play1up();
	}
	
	draw_set_halign(fa_left);
	draw_set_colour(_c_TEXTWHITE);
	
	var _str = "+ 1 LIFE";
	var _strY = (room_height-64) - ((5*room_speed)-alarm[1]);
	draw_text(16, _strY, _str);
}

function _drawRoundNum() 
{
	draw_set_halign(fa_left);
	draw_set_colour(_c_TEXTWHITE);
	var _str = "ROUND :" + string(obj_logic_supermanager._roundIndex);
	draw_text(16, room_height-16, _str);
}

function _drawGameOverScreen() 
{
	//vars defining a box 528px by 576px
	var _left = room_width/4/2;
	var _top = room_height/4/2;
	var _right = room_width - (room_width/4/2);
	var _bottom = room_height - (room_height/4/2);
	
	var _lvlScore = obj_logic_supermanager.p_getRoundScore();
	var _ttlScore = obj_logic_supermanager.p_getTotalScore();
	var _timerScnds = obj_logic_gamemanager.p_getTimerSeconds();
	
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

function _drawDeadScreen() 
{
	//vars defining a box 528px by 576px
	var _left = room_width/4/2;
	var _top = room_height/4/2;
	var _right = room_width - (room_width/4/2);
	var _bottom = room_height - (room_height/4/2);
	
	var _lvlScore = obj_logic_supermanager.p_getRoundScore();
	var _ttlScore = obj_logic_supermanager.p_getTotalScore();
	var _timerScnds = obj_logic_gamemanager.p_getTimerSeconds();
	
						//background box
	draw_sprite(spr_textbox_win, -1, _left, _top);
	
	//death message
	draw_set_halign(fa_center);
	draw_set_colour(_c_TEXTRED);
	
	var _str = "YOU DIED";
	draw_text_transformed(room_width/2, _top+64, _str, 2, 2, 0);
	
	draw_set_halign(fa_center);
	draw_set_colour(_c_TEXTWHITE);
	
	//total cum. score
	_str = "TOTAL SCORE " + string(_ttlScore);
	draw_text_transformed( (room_width/2), _top+(64*6), 
							_str, 2, 2, 0);
							
	//points til 1up
	_str = "POINTS TIL 1UP " + string(10000 - obj_logic_supermanager.p_getLives1up() + _lvlScore);
	draw_text_transformed( (room_width/2), _top+(64*7), _str, 1.5, 1.5, 0);
}

function _drawScoreScreen()
{
	//vars defining a box 528px by 576px
	var _left = room_width/4/2;
	var _top = room_height/4/2;
	var _right = room_width - (room_width/4/2);
	var _bottom = room_height - (room_height/4/2);
	
	var _lvlScore = obj_logic_supermanager.p_getRoundScore();
	var _ttlScore = obj_logic_supermanager.p_getTotalScore();
	var _timerScnds = obj_logic_gamemanager.p_getTimerSeconds();
	
	//background box
	draw_sprite(spr_textbox_win, -1, _left, _top);
	
	//headline text
	draw_set_halign(fa_center);
	draw_set_colour(_c_TEXTYELLOW);
	
	var _str = "AREA SURVIVED";
	draw_text_transformed(room_width/2, _top+32, _str, 2, 2, 0);
	_str = "YOUR QUEST PROGRESSES";
	draw_text_transformed(room_width/2, _top+64, _str, 2, 2, 0);
	

	if alarm[0] % room_speed == 0
		obj_logic_soundplayer.p_playCoinGet(7-(alarm[0]/room_speed));
		
	draw_set_halign(fa_center);
	draw_set_colour(_c_TEXTWHITE);
	
	//total score
	if alarm[0] < 5 * room_speed 
	{
		
		_str = "LEVEL SCORE " + string(_lvlScore);
		draw_text_transformed( room_width/2, _top+(64*2), _str, 1.5, 1.5, 0);
	}
	
	//ingame time
	if alarm[0] < 4 * room_speed 
	{
		_str = "TIME REMAINING " + string(_timerScnds);
		draw_text_transformed( room_width/2, _top+(64*3), _str, 1.5, 1.5, 0);
	}
	
	//time bonus
	if alarm[0] < 3 * room_speed 
	{
		_str = "TIME REMAINING BONUS " + string(_timerScnds*100);
		draw_text_transformed( (room_width/2), _top+(64*3.5), _str, 1, 1, 0);
	}
	//level score + time bonus
	if alarm[0] < 2 * room_speed 
	{
		_str = "SUM LEVEL SCORE " + string(_lvlScore+(_timerScnds*100));
		draw_text_transformed( (room_width/2), _top+(64*4.5), _str, 1.5, 1.5, 0);
	}
	
	//total cum. score
	if alarm[0] < 1 * room_speed 
	{
		_str = "TOTAL SCORE " + string(_ttlScore);
		draw_text_transformed( (room_width/2), _top+(64*6), _str, 2, 2, 0);
	}
	
	//points til 1up
	if alarm[0] < 1 * room_speed 
	{
		_str = "POINTS TIL 1UP " + string(10000 - obj_logic_supermanager.p_getLives1up());
		draw_text_transformed( (room_width/2), _top+(64*7), _str, 1, 1, 0);
	}
	
	draw_set_colour(_c_TEXTYELLOW);
	if (_isScoreScreenProgressing) draw_set_colour(_c_TEXTRED);
	
	_str = "PRESS SPACE TO PROCEED";
	draw_text_transformed(room_width/2, _bottom-64, _str, 1.5, 1.5, 0);
	
}