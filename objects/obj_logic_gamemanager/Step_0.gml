/// @description

//inc clock
if (_gameplayMode) 
	_clock++;

// Speeds up chaser zombies after clock hits _ELROYTIME
if (p_getGameTimeSeconds() > _ELROYTIME) 
{
	with (obj_enemy_zombie_chaser)
		p_becomeElroy();
}

//round is won, so set gameplayMode to false
if ( (!instance_exists(obj_pill) && _gameplayMode) 
		|| (keyboard_check(ord("A")) && _gameplayMode) ) 
{					//round is won, so we exit gameplay mode for score screen
	_gameplayMode = false;
	obj_logic_soundplayer.p_stopAllSounds();
	obj_logic_supermanager.p_updateStatsOnRoundEnd();
} 
//player pressed space on the score screen, so call alarm[1]
//to set gameIsWon true, so we advance to next round/level
else if (!_gameplayMode && keyboard_check(vk_space)) 
{					
	if (alarm[1] == -1) 
		alarm[1] = 2 * room_speed;
}

//player is dead, so call alarm[2] to reset room
if (!obj_player.p_isAlive) 
{
	if (alarm[2] == -1) 
		alarm[2] = 2 * room_speed;
}
