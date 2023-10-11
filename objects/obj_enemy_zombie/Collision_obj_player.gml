/// @description Eaten by player

if p_scared {
	
	obj_logic_soundplayer.p_playThud(2);
	
	if alarm[4] <= 0
		obj_logic_gamemanager.p_incrementScore(_VALUE);
	
	//disable all other logic
	for (var i = 0; i < 12; i++) 
		alarm[i] = -1;
	
	//go invisible
	image_alpha = 0;
	
	//tele to waiting room
	var _nearest_door =  instance_nearest(x, y, obj_enemy_door);
	x = _nearest_door.x;
	y = _nearest_door.y;
	
	//start Re-Alive sequence in 5 seconds
	alarm[4] = 5 * room_speed;
}
