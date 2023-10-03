/// @description

_clock++;


/*	This is called by this obj when the game is won.
 *	Tells supermanager to advance the level
 */
if (!instance_exists(obj_pill) && !_gameIsWon) || keyboard_check(ord("A")){
	_roomWinAdvance();
}

if !obj_player.p_isAlive {
	_roomDeathRestart();
}

if p_getGameTimeSeconds() > _ELROYTIME {
	_enemyBecomeElroy();
}