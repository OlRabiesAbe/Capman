/// @description Moving by calling _moveInDirection, runs every step when active

if obj_logic_gamemanager.p_getGameplayMode() 
{
	//outside room wrapping behavior
	move_wrap(true, true, sprite_width);

	_moveInDirection(_direction);
	alarm_set(1, 1);
}
