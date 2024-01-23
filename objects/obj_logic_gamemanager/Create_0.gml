/// @description Functions


//=====ROOM MANAGEMENT=====
//==========================
/*	Adjust game variables based on the round number.
 *	Called by obj_logic_supermanager in Room Start
 *	This func probably due for some work. Ugly af.
 */
function p_setRound (_roundIndex)
{
	//modifying enemy vars according to round#
	if (_roundIndex <= 3) 
	{
		obj_enemy_zombie.p_moveSpeed += (0.2 * _roundIndex);
		obj_enemy_zombie._CHASETIME += (2 * _roundIndex * room_speed);
		obj_enemy_zombie._scattertime -= (0.5 * _roundIndex * room_speed);
	}
	else 
	{	//if (_roundIndex > 3)
		obj_enemy_zombie.p_moveSpeed += (0.2 * 3);
		obj_enemy_zombie._CHASETIME += (2 * 3 * room_speed);
		obj_enemy_zombie._scattertime -= (0.5 * 3 * room_speed);
		if (_roundIndex > 4)
		{	//no more scattering after round 5
			obj_enemy_zombie._scattertime = 1;
		}
	}
	
	//assigning stuff that will be unique for each enemy instance.
	for (var i = 0; i < instance_number(obj_enemy_zombie); i++;)
	{
		//assigning a waittime to each enemy. waittime is how long they have to wait til they can enter the maze
		var _enemy = instance_find(obj_enemy_zombie, i);
		_enemy._waittime = (i * 4 * room_speed) + 1;
		_enemy.alarm[3] = _enemy._waittime;
		
		//set enemy scatter target to a random obj_enemy_target
		_enemy._scattertarget = instance_find(obj_enemy_target, irandom(instance_number(obj_enemy_target) - 1));
	}
	
	_POWERPILLTIME -= _roundIndex / 2 * room_speed; //p_powerPacman() just returns if powerpilltime is zero or negative
	_ELROYTIME -= _roundIndex * 10; //it's fine if elroytime is negative
	
	//modifying the special pill according to round#	//I love modifying constants lmao
	switch (_roundIndex % 3) {
		case 0:
			obj_pill_special.sprite_index = spr_pill_special_bread;
			obj_pill_special._VALUE = 500;
			obj_pill_special._LIFESPAN = 15;
			break;
		case 1:
			obj_pill_special.sprite_index = spr_pill_special_carrot;
			obj_pill_special._VALUE = 1000;
			obj_pill_special._LIFESPAN = 11;
			break;
		case 2: default:
			obj_pill_special.sprite_index = spr_pill_special_leek;
			obj_pill_special._VALUE = 1500;
			obj_pill_special._LIFESPAN = 8;
			break;
	}
}

/*	Restart level after player death
 *	Called within supermanager.restartLevel()
 */
function p_restartLevel ()
{
	obj_logic_soundplayer.p_stopAllSounds()
	
	if (obj_logic_supermanager.p_getLives() > 0)
	{
		obj_logic_supermanager.p_decrementLives();
	}
	else 
	{
		throw ("OUT OF LIVES");
	}
	
	_gameIsWon = false;
	_gameIsOver = false;
	_gameplayMode = true;
	
	obj_player.p_reset();
	
	with (obj_enemy_zombie)
	{
		//disable all logic
		for (var i = 0; i < 12; i++) 
		{
			alarm[i] = -1;
		}
		
		//go invisible
		image_alpha = 0;
		
		//tele to OOB waiting room
		x = -16; 
		y = -16;
		
		//start Re-Alive sequence in waittime + 1 second
		alarm[4] = _waittime + room_speed;
	}
}

//=====ENEMY MANAGEMENT=====
//==========================
/*	Enables pacman power invincibility
 *	Called by powerpills when pacman eats them
*/
function p_powerPacman () 
{
	if (_POWERPILLTIME > 0) //round might progress to a point powerpilltime is negative
	{
		/*if pacman is already powered but ate a second power pill,
			we dont need to do any of this shit. just restart the timer.*/
		if (!obj_player.p_isPowered) 
		{
			obj_player.p_isPowered = true;
	
			with (obj_enemy_zombie) 
				p_toggleScared(true);
			
			obj_logic_soundplayer.p_toggleEnemyFearSound(true)
		}
	
		alarm[0] = _POWERPILLTIME;
	}
}

/*	Called by alarm[0] when pacman's power runs out.
 *	Also called by alarm[1] & alarm[2] for roundend
*/
function p_depowerPacman () 
{
	if (instance_exists(obj_player))
		obj_player.p_isPowered = false;
		
	with (obj_enemy_zombie) 
		p_toggleScared(false);
		
	obj_logic_soundplayer.p_toggleEnemyFearSound(false)
	
	alarm[0] = -1;
}





//=====VAR GETTERS & SETTERS=====
//==========================
//_score Getter
function p_getRoundScore() 
{
	return obj_logic_supermanager.p_getRoundScore();
}
//_score Setter
function p_incrementRoundScore(_value) 
{
	obj_logic_supermanager.p_incrementRoundScore(_value);
}

//_clock Getter, round timer in seconds
function p_getTimerSeconds() 
{
	return _ROOMTIMER - ceil(_clock / 60);
}
//_clock Getter, raw seconds
function p_getGameTimeSeconds() 
{
	return ceil(_clock / 60);
}
//_clock Getter, raw 
function p_getGameTimeSteps() 
{
	return _clock;
}

//_gameIsWon Getter
function p_getGameWon() 
{
	return _gameIsWon;
}
//_gameIsOver Getter
function p_getGameOver() 
{
	return _gameIsOver;
}
//_gameIsWon Getter
function p_getGameplayMode() 
{
	return _gameplayMode;
}