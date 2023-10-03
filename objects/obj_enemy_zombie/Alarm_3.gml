/// @description Script to enter maze

path_start(path_enemy_door, 1, path_action_stop, true);


alarm_set(0, 1);
alarm_set(1, 2);
alarm_set(2, _SCATTERTIME);
alarm_set(3, -1);
alarm_set(5, room_speed);

obj_logic_soundplayer.p_playEnemyFootsteps();