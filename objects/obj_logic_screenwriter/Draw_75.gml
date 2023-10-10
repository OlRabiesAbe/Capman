/// @description screen text

//score counter
_drawScore();

//clock
_drawClock();

//lives
_drawLives();
//_drawRoundNum();

//game won text
if obj_logic_gamemanager.p_getGameWon() {
	
	if alarm[0] == -1
		alarm[0] = room_speed * 6;
		
	_drawScoreScreen();
	
	if keyboard_check(vk_space) 
		_isScoreScreenProgressing = true;
}

//death text
if !obj_player.p_isAlive {
	_drawGameOverScreen();
}