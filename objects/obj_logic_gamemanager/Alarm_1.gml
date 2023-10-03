/// @description Game won, tell supermanager to advance room

p_depowerPacman();

obj_logic_soundplayer.p_stopAllSounds();

obj_logic_supermanager.p_advanceLevel();