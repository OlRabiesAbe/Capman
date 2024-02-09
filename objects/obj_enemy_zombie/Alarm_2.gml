/// @description Toggle _chase to start/end Scatter logic, runs every _CHASETIMER/_SCATTERTIMER when active

if (p_chase && _scattertime > 0)
{
	p_chase = false;
	alarm_set(2, _scattertime);
} 
else if (!p_chase)
{
	p_chase = true;
	_scattertime -= 1.5 * room_speed;
	alarm_set(2, _chasetime);
}
