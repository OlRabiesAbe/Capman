/// @description check time to see if lifespan is up

//flash sprite when 3 secs to deletion
if (obj_logic_gamemanager.p_getGameTimeSeconds() + 3 > _LIFESPAN)
{
	if (obj_logic_gamemanager.p_getGameTimeSteps() % 25 == 0)
	{
		visible = !visible;		//toggling visible every 25 steps
	}
}

//delete this when lifespan is up
if (obj_logic_gamemanager.p_getGameTimeSeconds() > _LIFESPAN)
	instance_destroy();