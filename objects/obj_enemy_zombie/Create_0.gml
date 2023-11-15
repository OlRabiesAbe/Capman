/// @description enemy initialization and functions

///=====INIT
///================
_spriteArray = [spr_enemy_zombie_left, spr_enemy_zombie_up, 
					 spr_enemy_zombie_right, spr_enemy_zombie_right, spr_enemy_zombie_lit];


//randomize _WAITTIME
_WAITTIME += irandom(6) * room_speed;
//begin entering level in _WAITTIME frames
alarm_set(3, _WAITTIME);


///=====FUNCTIONS
///================
/*	check if this inst is able to move in the provided direction
 *	Not very good, buggy.
 *	Contains a magicnumber, _checkdist
 *	@param: string like up down left or right
 *	@return: boolean
*/
function _checkCollisionInDirection (direction) 
{
	var _checkdist = 16;
	switch (direction) 
	{
		case "left":
			if place_free(x - _checkdist, y)
				return true;
			break;
		case "right":
			if place_free(x + _checkdist, y)
				return true;
			break;
		case "up":
			if place_free(x, y - _checkdist)
				return true;
			break;
		case "down":
			if place_free(x, y + _checkdist)
				return true;
			break;
		default:
			return false;
	}
	return false;
}

/*	generate an array representing which directions this obj is allowed to move in.
 *	Array like [boolean, boolean, boolean, boolean] where it represents the validity
 *	of directions in the order [left up right down].
 *	@uses: p_direction, _checkCollisionInDirection()
 *	@return: boolean[]
*/
function _getValidMoveArray () 
{
	
	var _moveArray = [0, 0, 0, 0];
	
	_moveArray[0] = (_direction != "right") && _checkCollisionInDirection("left");
	_moveArray[1] = (_direction != "down") && _checkCollisionInDirection("up");
	_moveArray[2] = (_direction != "left") && _checkCollisionInDirection("right");
	_moveArray[3] = (_direction != "up") && _checkCollisionInDirection("down");
	
	return _moveArray;
}

/*	generate array representing whether moving in each direction is desirable (brings us closer to _targetCoords).
 *	Array like [boolean, boolean, boolean, boolean] where it represents the preferability
 *	of directions in the order [left up right down].
 *	@param: array[] like [int, int]
 *	@return: boolean[]
*/
function _getIdealMoveArray (_targetCoords) 
{
	var _moveArray = [0, 0, 0, 0];
	
	_moveArray[0] = _targetCoords[0] <= x;
	_moveArray[1] = _targetCoords[1] <= y;
	_moveArray[2] = _targetCoords[0] >= x;
	_moveArray[3] = _targetCoords[1] >= y;
	
	return _moveArray;
}

/*	move this inst in a direction.
 *	Also changes the sprite_index to match the movement
 *	Called by alarm[1] every step
 *	@uses: p_moveSpeed
 *	@changes: x, y, sprite_index
 *	@param: string like up down left or right
 *	@return: void
*/
function _moveInDirection (_dir) 
{
	switch (_dir) 
	{
		case "left":
			sprite_index = _spriteArray[0];
			x = x - p_moveSpeed;
			break;
		case "up":
			sprite_index = _spriteArray[1];
			y = y - p_moveSpeed;
			break;
		case "right":
			sprite_index = _spriteArray[2];
			x = x + p_moveSpeed;
			break;
		case "down":
			sprite_index = _spriteArray[3]; //same sprite as _spriteArray[2]
			y = y + p_moveSpeed;
			break;
	}
	
	if (p_scared) _applyScaredVFX();
}

/*	Runs whenever _moveInDirection() is called && p_scared.
 *	needa change the sprite to the scared one if pacman is powerpilled.
 *	obj_logic_gamemanager.alarm[0] handles deactivating pacman's power,
 *	so we check its value here to figure out what sprite we should use.
 *	@uses: obj_logic_gamemanager.alarm[0]
 *	@changes: sprite_index
 *	@returns: void
 */
function _applyScaredVFX() 
{
	if obj_logic_gamemanager.alarm[0] > room_speed
	{ 
		//pacman is powered, use the lit sprite
		sprite_index = _spriteArray[4];
	}
	else if obj_logic_gamemanager.alarm[0] > 0 && obj_logic_gamemanager.alarm[0] < room_speed
	{
		if ceil(obj_logic_gamemanager.alarm[0] / 3 ) % 2 == 0
			//if there's one second left on the power pill, flash the sprite
			sprite_index = spr_enemy_zombie_lit;
	}
	
	if (obj_logic_gamemanager.alarm[0] % room_speed == room_speed - 1)
		obj_logic_particlemanager.p_genBoneParticle(x, y);
}

/*	parsing movearray-index to directional-string
 *	@param: int between 0 and 3 inclusive
 *	@return: string like up down left or right
*/
function _parseMoveArrayIndexToDirectionalString (_index) 
{
	switch(_index) { 
		case 0:
			return "left";
			break;
		case 1:
			return "up";
			break;
		case 2:
			return "right";
			break;
		case 3:
			return "down";
			break;
		default: 
			return "";
	}
}
/*	parsing directional-string to movearray-index
 *	@param: string like left up right or down
 *	@return: int between 0 and 3 inclusive, or -1 if invalid
*/
function _parseDirectionalStringToMoveArrayIndex (_string) 
{
	switch(_string) { 
		case "left":
			return 0;
			break;
		case "up":
			return 1;
			break;
		case "right":
			return 2;
			break;
		case "down":
			return 3;
			break;
		default: 
			return -1;
	}
}

/* does what it says on the box
	@return: coordinate array like [x, y]
*/
function _getPlayerLocation () 
{
	return [obj_player.x, obj_player.y];
}

/*	returns the location the player is going based on its direction
	@return: coordinate array like [x, y]
*/
function _getPlayerAnticipatedLocation () 
{
	var _xy = [0,0];
	var _anticipation = 4 * 32;
	switch (obj_player.p_getDirection()) 
	{
		case "left":
			_xy = [obj_player.x - _anticipation, obj_player.y];
			break;
		case "right":
			_xy = [obj_player.x + _anticipation, obj_player.y];
			break;
		case "up":
			_xy = [obj_player.x, obj_player.y - _anticipation];
			break;
		case "down":
			_xy = [obj_player.x, obj_player.y + _anticipation];
			break;
	}
	return _xy;
}

/*	Snap this inst to the 16 * 16 grid.
 */
function p_snapToGrid() 
{
	x = round(x / 16) * 16;
	y = round(y / 16) * 16;
}
