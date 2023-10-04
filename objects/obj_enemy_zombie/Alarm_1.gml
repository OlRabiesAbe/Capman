/// @description Moving by calling _moveInDirection
//@uses p_direction

if !obj_logic_gamemanager.p_getGameWon() 
{
	//outside room wrapping behavior
	move_wrap(true, true, sprite_width);


	_moveInDirection(_direction);
	alarm_set(1, 1);
}
