/// @description call p_powerPacman

obj_logic_gamemanager.p_incrementRoundScore(_VALUE);
obj_logic_gamemanager.p_powerPacman();
obj_logic_soundplayer.p_playShock();
instance_destroy(_myLight);
instance_destroy();