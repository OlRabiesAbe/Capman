/// @description Toggle _chase to start Scatter logic

if p_chase 
{
	p_chase = false;
	alarm_set(2, _SCATTERTIME);
} 
else if !p_chase 
{
	p_chase = true;
	alarm_set(2, _SCATTERTIME * 3);
}
