/// @description Functions


//=====ROOM MANAGEMENT=====
//==========================
/*	Adjust game variables based on the round number.
 *	Called by obj_logic_supermanager at room-start
 */
function p_setRound (_roundIndex)
{
	if (_roundIndex < 2) {
		obj_enemy_zombie.p_moveSpeed += (0.2 * _roundIndex);
		obj_enemy_zombie._CHASETIME += (2 * _roundIndex * room_speed);
	}
	
	_POWERPILLTIME -= _roundIndex * room_speed; //p_powerPacman() just returns if powerpilltime is zero or negative
	_ELROYTIME -= _roundIndex * 10; //it's fine if elroytime is negative
	
	//setting up the special pill
	//I love modifying constants lmao
	switch(_roundIndex % 3) {
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
	//obj_logic_screenwriter.p_drawDebugText("round is " + string(_roundIndex));
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
	if instance_exists(obj_player)
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
//_gameIsWon Getter
function p_getGameplayMode() 
{
	return _gameplayMode;
}