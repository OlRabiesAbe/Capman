/// @description Script to enter maze, runs once

path_start(path_enemy_door, 1, path_action_stop, true);

alarm_set(0, 1);
alarm_set(1, 2);
alarm_set(2, _SCATTERTIME);
alarm_set(5, room_speed);

p_toggleScared(false);

obj_logic_soundplayer.p_playEnemyFootsteps();