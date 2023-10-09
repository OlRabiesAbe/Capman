/// @description Functions

function _drawScore() 
{
	draw_set_halign(fa_left);
	draw_set_colour(c_white);
	var _str = string(obj_logic_gamemanager.p_getTotalScore() + obj_logic_gamemanager.p_getScore());
	draw_text(16, 24, "SCORE " + _str);
	draw_text(16, 8, "TOTAL ");
}

function _drawClock() 
{
	draw_set_halign(fa_left);
	draw_set_colour(c_white);
	var _str = string(obj_logic_gamemanager.p_getGameTimeSeconds());
	draw_text(room_width-128, 16, "TIME " + _str);
}

function _drawLives() 
{
	draw_set_halign(fa_left);
	draw_set_colour(c_white);
	var _str = " ";
	for (var i = 0; i < obj_logic_supermanager.p_getLives(); i++)
		_str += " O";
	draw_text(16, room_height-32, "LIVES " + _str);
}

function _drawRoundNum() 
{
	draw_set_halign(fa_left);
	draw_set_colour(c_white);
	var _str = string(obj_logic_supermanager._roundIndex);
	draw_text(16, room_height-16, "ROUND :" + _str);
}

function _drawGameWonScreen()
{
	draw_set_colour(c_black);
	draw_rectangle((room_width/2)-64, (room_height/2-16), (room_width/2)+64, (room_height/2+64), false);
	
	draw_set_halign(fa_center);
	draw_set_colour(c_yellow);
	var _str = "WINRAR";
	draw_text_transformed(room_width/2, room_height/2, _str, 2, 2, 0);
}

function _drawGameOverScreen() 
{
	draw_set_colour(c_black);
	draw_rectangle(64, 128, room_width-64, room_height-128, false);
	
	draw_set_halign(fa_center);
	draw_set_colour(c_red);
	var _str = "YOU'VE JOINED THE DEAD";
	draw_text_transformed(room_width/2, room_height/2, _str, 2, 2, 0);
}

function _drawScoreScreen()
{
	//vars defining a box 528px by 576px
	var _left = room_width/4/2;
	var _top = room_height/4/2;
	var _right = room_width - (room_width/4/2);
	var _bottom = room_height - (room_height/4/2);
	
	var _lvlScore = obj_logic_gamemanager.p_getScore();
	var _ttlScore = obj_logic_gamemanager.p_getTotalScore();
	var _timerScnds = obj_logic_gamemanager.p_getTimerSeconds();
	
	//black background
	draw_sprite(spr_textbox_win, -1, _left, _top);
	
	//headline text
	draw_set_halign(fa_center);
	draw_set_colour(c_yellow);
	var _str = "AREA SURVIVED";
	draw_text_transformed(room_width/2, _top+32, _str, 2, 2, 0);
	_str = "YOUR QUEST PROGRESSES";
	draw_text_transformed(room_width/2, _top+64, _str, 2, 2, 0);
	
	//total score
	draw_set_halign(fa_center);
	draw_set_colour(c_white);
	_str = string(_lvlScore);
	draw_text_transformed(room_width/2, _top+(64*2), "LEVEL SCORE:" + _str, 1.5, 1.5, 0);
	
	//ingame time
	_str = string(_timerScnds);
	draw_text_transformed(room_width/2, _top+(64*3), "TIME REMAINING:" + _str, 1.5, 1.5, 0);
	
	_str = string(_timerScnds*100);
	draw_text_transformed((room_width/2), _top+(64*3.5), "TIME REMAINING BONUS:" + _str, 1.5, 1.5, 0);
	
	_str = string(_lvlScore+(_timerScnds*100));
	draw_text_transformed((room_width/2), _top+(64*4.5), "SUM SCORE:" + _str, 1.5, 1.5, 0);
	
	_str = string(_ttlScore+_lvlScore+(_timerScnds*100));
	draw_text_transformed((room_width/2), _top+(64*5.5), "TOTAL SCORE:" + _str, 1.5, 1.5, 0);
	
	if _isScoreScreenProgressing
		draw_set_colour(c_red);
	draw_text(room_width/2, _bottom-32, "PRESS SPACE TO PROCEED");
}