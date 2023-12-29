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

// Handles roundwon 
if ( (!instance_exists(obj_pill) && _gameplayMode) 
		|| (keyboard_check(ord("A")) && _gameplayMode) ) 
{					//round is won, so we exit gameplay mode for score screen
	_gameplayMode = false;
	obj_logic_soundplayer.p_stopAllSounds();
	obj_logic_supermanager.p_updateStatsOnRoundEnd();
} 
else if (!_gameplayMode && keyboard_check(vk_space)) 
{					//player pressed space on the score screen, so we advance to next round/level
	if (alarm[1] == -1) 
		alarm[1] = 2 * room_speed;
}

//player is dead, flag supermanager to restart room.
if (!obj_player.p_isAlive) 
{
	if (alarm[2] == -1) 
		alarm[2] = 2 * room_speed;
}
