/// @description Eaten by player logic

if p_scared && p_isAlive 
{ 
	p_isAlive = false;
	
	obj_logic_soundplayer.p_playThud(2);
	
	if (p_elroy) //deactive elroy sound on death if you're the elroy
	{
		p_moveSpeed /= 1.25;
		_scattertime = 7 * room_speed; //enable perma chase
		p_chase = false;
		p_elroy = false;
		obj_logic_soundplayer.p_deactivateEnemyElroySound()
		
		obj_logic_gamemanager.p_restartElroyTimer();
	}
	
	obj_logic_gamemanager.p_incrementRoundScore(_VALUE);
	
	//disable all other logic
	for (var i = 0; i < 12; i++) 
	{
		alarm[i] = -1;
	}
	
	//go invisible
	image_alpha = 0;
	
	//tele to OOB waiting room
	x = -16; 
	y = -16;
	
	//start Re-Alive sequence in 5 seconds
	alarm[4] = _waittime;
}
