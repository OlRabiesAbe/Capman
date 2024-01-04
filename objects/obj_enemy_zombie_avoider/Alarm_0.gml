/// @description Movement decision AI, runs every step when active


if (abs(x - obj_player.x) + abs(y - obj_player.y) < 256) 
{
	p_chase = false;
	alarm[2] = 6 * room_speed;
}

// Inherit the parent event
event_inherited();

