/// @description initialization


//capman's sprites are stored in this array for ease of access
_spriteArray = [spr_capman_0, spr_capman_1, spr_capman_2, spr_capman_3,
				spr_capman_lit_0, spr_capman_lit_1, spr_capman_lit_2, spr_capman_lit_3];
alarm_set(5, room_speed);

/*	move player in a  direction
	@uses: _MOVESPEED
	@param: string like up down left right
	@return: void
*/
function _moveInDirection (direction) 
{
	switch (direction) 
	{
		case "left":
			_spriteArrayIndex = 1;
			x = x - p_moveSpeed;
			break;
		case "right":
			_spriteArrayIndex = 0;
			x = x + p_moveSpeed;
			break;
		case "up":
			_spriteArrayIndex = 2;
			y = y - p_moveSpeed;
			break;
		case "down":
			_spriteArrayIndex = 3;
			y = y + p_moveSpeed;
			break;
	}
	if p_isPowered
		_spriteArrayIndex += 4;
	sprite_index = _spriteArray[_spriteArrayIndex];
}


/*	check if player is able to move in a direction
	@uses: p_moveSpeed
	@param: string like up down left right
	@return: boolean
*/
function _checkCollisionInDirection (direction) 
{
	switch (direction) 
	{
		case "left":
			if place_free(x - (p_moveSpeed), y)
				return true;
			break;
		case "right":
			if place_free(x + (p_moveSpeed), y)
				return true;
			break;
		case "up":
			if place_free(x, y - (p_moveSpeed))
				return true;
			break;
		case "down":
			if place_free(x, y + (p_moveSpeed))
				return true;
			break;
		default:
			return false;
	}
}


/*	convert key presses to a string 
	represeting the direction the player wants to move,
	then updates _directionStored accordingly
	@changes: _directionStored 
	@return: void 
*/
function _updateDirectionStored () 
{
	if keyboard_check(vk_left)
	{
	    _directionStored = "left";
	}
	else if keyboard_check(vk_right)
	{
	    _directionStored = "right";
	}
	else if keyboard_check(vk_up)
	{
	    _directionStored = "up";
	}
	else if keyboard_check(vk_down)
	{
	    _directionStored = "down";
	}
}


//_direction Getter
function p_getDirection ()
{
	return _direction;
}