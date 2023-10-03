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
	//_drawGameWonScreen();
	_drawScoreScreen();
}

//death text
if !obj_player.p_isAlive {
	_drawGameOverScreen();
}