/// @description Player dead, tell supermanager to restart room

p_depowerPacman();

audio_stop_sound(snd_enemy_walk04);

if (obj_logic_supermanager.p_getLives() > 0)
{
	obj_logic_supermanager.p_decrementLives();
	obj_logic_supermanager.p_restartRoom(); //do i want to do things this way?
}											// supermanager tells, it's not supposed to be told.
else throw ("OUT OF LIVES");				//should only have public getters...

alarm[2] = -1;