/// @description screen text

//score counter
_drawScore();

//clock
_drawClock();

//lives
_drawLives();

if _isDebugTextUp
	p_drawDebugText(); //the error is in error. Doesnt need a param here.
	
if _is1upTextUp
	p_draw1up();

///Should maybe move the below blocks out of here.
///Don't want screenwriter deciding shit for itself.
///gamemanager should call these funcs when IT wants them done.

//game won text
if obj_logic_gamemanager.p_getGameWon() {
	
	if alarm[0] == -1
		alarm[0] = room_speed * 6;
		
	_drawScoreScreen();
	
	if keyboard_check(vk_space) 
		_isScoreScreenProgressing = true;
}

//death text
if !obj_player.p_isAlive && obj_logic_supermanager.p_getLives() == 0 {
	_drawGameOverScreen();
} else if !obj_player.p_isAlive {
	_drawDeadScreen();
}