/// @description Functions

//=====ROOM MANAGEMENT=====
//==========================
/*	Adjust game variables based on the round number.
 *	Called by obj_logic_supermanager at room-start
 */
function p_setRound (_roundIndex)
{
	obj_enemy_zombie.p_moveSpeed += (0.2 * _roundIndex);
	_POWERPILLTIME -= _roundIndex * room_speed;
	_ELROYTIME += _roundIndex * 10;
	
	//setting up the special pill
	with (obj_pill_special) 
	{
		_VALUE += 500 * _roundIndex;  //changing a constant yeah yeah i know
		
		/*for some reason _roundIndex is really fucking weird here
			this line causes obj_pill_special to become a carrot on round ONE,
			not round ZERO, which is the first. It's fucked up */
		if _roundIndex == 0 
			object_set_sprite(obj_pill_special, spr_pill_special_carrot);
	}
}

/*	Advances level via alarm[1]
 *	Called in Step when game is won
 */
function _roomWinAdvance() 
{
	_gameIsWon = true;
	obj_logic_soundplayer.p_stopAllSounds();
	if alarm[1] == -1 
		alarm[1] = 5 * room_speed;
}

/*	This is called by this obj when the player is dead.
 *	Tells supermanager to restart the level
 */
function _roomDeathRestart() 
{
	if alarm[2] == -1 
		alarm[2] = 5 * room_speed;
}



//=====ENEMY MANAGEMENT=====
//==========================
/*	Enables pacman power invincibility
 *	Called by powerpills when pacman eats them
*/
function p_powerPacman () 
{
	/*if pacman is already powered but ate a second power pill,
		we dont need to do any of this shit. just restart the timer.*/
	if !obj_player.p_isPowered 
	{
		obj_player.p_isPowered = true;
	
		_toggleEnemyScared();
			
		obj_logic_soundplayer.p_toggleEnemyFearSound(true)
	}
	
	alarm[0] = _POWERPILLTIME;
}

/*	Called by alarm[0] when pacman's power runs out.
 *	Also called by alarm[1] & alarm[2] for roundend
*/
function p_depowerPacman () 
{
	if instance_exists(obj_player)
		obj_player.p_isPowered = false;
		
	_toggleEnemyScared();
		
	obj_logic_soundplayer.p_toggleEnemyFearSound(false)
	
	alarm[0] = -1;
}

/* Toggles enemy fear behavior when pacman eats a power pill or one runs out
 * Called by p_powerPacman & p_depowerPacman
 */
function _toggleEnemyScared()
{
	if instance_exists(obj_enemy_zombie) 
	{
		if obj_enemy_zombie.p_scared 
		{
			obj_enemy_zombie.p_moveSpeed *= 2;
			obj_enemy_zombie.p_scared = false;
			//the below line is an attempt to fix an issue related to enemies getting stuck on walls
			//doesnt fix the issue, but seems to reduce how often it happens
			//issue seems to occur at _moveSpeeds of 3.25 or higher
			with obj_enemy_zombie p_snapToGrid();
		} 
		else 
		{
			obj_enemy_zombie.p_moveSpeed /= 2;
			obj_enemy_zombie.p_scared = true;
		}
	}
}

/* Speeds up all zombies after clock hits _ELROYTIME
 * Called in this obj's Step
 */
function _enemyBecomeElroy() {
	with (obj_enemy_zombie)
	{
		if !obj_enemy_zombie.p_elroy 
		{
			obj_enemy_zombie.p_moveSpeed *= 1.25
			obj_enemy_zombie.p_elroy = true;
		}
	}
}



//=====VAR GETTERS & SETTERS=====
//==========================
//_score Getter
function p_getScore() 
{
	return _score;
}
//_score Setter
function p_setScore(_amount) 
{
	_score = _amount;
}
//_score Setter
function p_incrementScore(_value) 
{
	_score += _value;
}
//_gameIsWon Getter
function p_getGameWon() 
{
	return _gameIsWon;
}
//_clock Getter, round timer in seconds
function p_getTimerSeconds() 
{
	return _ROOMTIMER - ceil(_clock / 60);
}
//_clock Getter, raw ms
function p_getGameTime() 
{
	return _clock;
}
//_clock Getter, raw seconds
function p_getGameTimeSeconds() 
{
	return ceil(_clock / 60);
}