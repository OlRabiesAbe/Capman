/// @description Advance slide or exit room

if _slidearray_index + 1 >= array_length(_slidearray) 
{
	obj_logic_supermanager.p_advanceLevel();
} 
else _slidearray_index++;

alarm[0] = 5 * room_speed;