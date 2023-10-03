/// @description player movement logic

//no moving if not alive
if p_isAlive
{
	/*convert key presses to a string 
	represeting the direction the player wants to move.*/
	_updateDirectionStored();

	//can i move in the desired direction?
	if _checkCollisionInDirection(_directionStored)
		_direction = _directionStored;//if so, that's the new direction

	//and now we move
	_moveInDirection(_direction);

	//outside room wrapping behavior
	//NOTE: move_wrap needs to be in a Step, not an Out of Bounds. 
	//Out of Bounds only triggers once I think.
	move_wrap(true, true, sprite_width);

}