/// @description

if (!_gameIsWon) 
	_clock++;

// Speeds up all zombies after clock hits _ELROYTIME
if (ceil(_clock/60) > _ELROYTIME) 
{
	with (obj_enemy_zombie)
		p_becomeElroy();
}

// Handles roundwon screen
if ((!instance_exists(obj_pill) && !_gameIsWon) || (keyboard_check(ord("A")) && !_gameIsWon)) 
{					//round is won, so we exit gameplay mode for score screen
	_gameIsWon = true;
	_gameplayMode = false;
	obj_logic_soundplayer.p_stopAllSounds();
	obj_logic_supermanager.p_updateStatsOnRoundEnd();
} 
else if (_gameIsWon && keyboard_check(vk_space)) 
{					//player pressed space on the score screen, so we advance to next round/level
	if alarm[1] == -1 
		alarm[1] = 2 * room_speed;
}

//player is dead, but has lives, so we restart room.
if (!obj_player.p_isAlive) 
{
	if (obj_logic_supermanager.p_getLives() > 0) 
	{
		_roomDeathRestart();
	}
}
