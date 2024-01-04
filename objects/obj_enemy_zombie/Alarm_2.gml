/// @description Toggle _chase to start/end Scatter logic, runs every _CHASETIMER/_SCATTERTIMER when active

if p_chase 
{
	p_chase = false;
	alarm_set(2, _SCATTERTIME);
} 
else if !p_chase 
{
	p_chase = true;
	alarm_set(2, _CHASETIME);
}
