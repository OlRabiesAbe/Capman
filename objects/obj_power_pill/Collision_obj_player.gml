/// @description call p_powerPacman

obj_logic_gamemanager.p_incrementScore(_VALUE);
obj_logic_gamemanager.p_powerPacman();
obj_logic_soundplayer.p_playCoinGet(2);
instance_destroy(_myLight);
instance_destroy();