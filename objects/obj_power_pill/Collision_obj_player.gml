/// @description call p_powerPacman

obj_logic_gamemanager.p_incrementScore(_VALUE);
obj_logic_gamemanager.p_powerPacman();
audio_play_sound(snd_capman_coinget, 10, false);
instance_destroy(_myLight);
instance_destroy();