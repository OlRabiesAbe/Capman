/// @description Snap to grid, issue#1 fix
//runs once a second
//prevents enemy getting stuck on corners at high speeds.
//lowest speed I noticed the stucking happening is 3.25
//TODO: THIS IS A VERY BAD FIX
if !p_scared && p_moveSpeed > 3
	p_snapToGrid();

alarm_set(5, room_speed);