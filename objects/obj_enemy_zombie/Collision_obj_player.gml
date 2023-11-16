/// @description Eaten by player

if p_scared && p_isAlive 
{ 
	p_isAlive = false;
	//maybe i should implement a p_isAlive bool for enemies? using image_alpha is jank
	obj_logic_soundplayer.p_playThud(2);
	
	obj_logic_gamemanager.p_incrementRoundScore(_VALUE);
	
	//disable all other logic
	for (var i = 0; i < 12; i++) 
		alarm[i] = -1;
	
	//go invisible
	image_alpha = 0;
	
	//tele to OOB waiting room
	x = 16;
	y = 16;
	
	//start Re-Alive sequence in 5 seconds
	alarm[4] = 5 * room_speed;
}
