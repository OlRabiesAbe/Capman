/// @description

if !_gameIsWon 
	_clock++;


/*	This is called by this obj when the game is won.
 *	Tells supermanager to advance the level
 */
if (!instance_exists(obj_pill) && !_gameIsWon) || keyboard_check(ord("A")){
	_gameIsWon = true;
	_gameplayMode = false;
	obj_logic_soundplayer.p_stopAllSounds();
} 
else if (_gameIsWon && keyboard_check(vk_space)) {
	if alarm[1] == -1 
		alarm[1] = 2 * room_speed;
}

if !obj_player.p_isAlive && !_gameIsWon {
	_roomDeathRestart();
}

if ceil(_clock/60) > _ELROYTIME {
	_enemyBecomeElroy();
}