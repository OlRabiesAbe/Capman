/// @description Player dead, tell supermanager to restart room

p_depowerPacman();
audio_stop_sound(snd_enemy_walk04);

obj_logic_supermanager.p_restartRoom();

alarm[2] = -1;