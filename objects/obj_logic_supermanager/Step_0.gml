/// @description 1up handling

if _lives1upCounter >= 10000 
{
	_lives1upCounter -= 10000;
	p_incrementLives();
	obj_logic_screenwriter.p_draw1up();
}

if obj_logic_gamemanager.p_getGameWon()
{
	p_advanceLevel();
}

if obj_logic_gamemanager.p_getGameOver()
{
	p_restartLevel();
}