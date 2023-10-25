/// @description Functions

/*
_pSystem = part_system_create_layer("Instance_Layer", false);
_particle1 = part_type_create();
part_type_shape(_particle1, pt_shape_pixel);
part_type_size(_particle1,1,1,-0.1,0);
part_type_speed(_particle1,0.50,2,-0.10,0);
part_type_life(_particle1,room_speed*10,room_speed*20); 
part_particles_create(_pSystem, room_width/2, room_height/2, _particle1, 100);
*/

//=====ROOM MANAGEMENT=====
//==========================
/*	Adjust game variables based on the round number.
 *	Called by obj_logic_supermanager at room-start
 */
function p_setRound (_roundIndex)
{
	//roundbased gameplay variable adjustement
	obj_enemy_zombie.p_moveSpeed += (0.2 * _roundIndex);
	_POWERPILLTIME -= _roundIndex * room_speed;
	_ELROYTIME -= _roundIndex * 10;
	
	//setting up the special pill
	with (obj_pill_special) 
	{
		
		switch(_roundIndex) {
			case 0:
				object_set_sprite(obj_pill_special, spr_pill_special_bread);
				_VALUE = 500;
				break;
			case 1:
				object_set_sprite(obj_pill_special, spr_pill_special_carrot);
				_VALUE = 1000;
				break;
			case 2: default:
				object_set_sprite(obj_pill_special, spr_pill_special_leek);
				_VALUE = 1500;
				break;
		}
	}
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
	with (obj_enemy_zombie) 
	{
		if obj_enemy_zombie.p_scared 
		{
			obj_enemy_zombie.p_moveSpeed *= 2;
			obj_enemy_zombie.p_scared = false;
			//the below line is an attempt to fix an issue related to enemies getting stuck on walls
			//doesnt fix the issue, but seems to reduce how often it happens
			//issue seems to occur at _moveSpeeds of 3.25 or higher
			obj_enemy_zombie.p_snapToGrid();
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