/// @description

_clock++;

if !instance_exists(obj_pill) && !_gameIsWon {
	_advanceLevel();
}

if !obj_player.p_isAlive {
	_roomRestart();
}

if p_getGameTimeSeconds() > 50 {
	_enemyBecomeElroy();
}