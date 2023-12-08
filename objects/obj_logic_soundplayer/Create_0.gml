/// @description Functions


///=====FUNCTIONS
///===============
/*	Called by obj_enemy_zombies to play start playing their footstep sounds.
 *	Prevents overlap.
 */
function p_playEnemyFootsteps() 
{
	if obj_logic_gamemanager.p_getGameplayMode()
		if !audio_is_playing(snd_enemy_walk04)
			audio_play_sound(snd_enemy_walk04, 8, true, global.settings.audio_sounds);
}

/*	Toggles enemy footsteps and enemy fear. One to the other.
 *	True = fear sound on; False = footstep sound on
 */
function p_toggleEnemyFearSound(_toggle)
{
	if obj_logic_gamemanager.p_getGameplayMode() 
	{
		if _toggle
		{
			audio_play_sound(snd_enemy_fear, 8, true, global.settings.audio_sounds);
			audio_pause_sound(snd_enemy_walk04);
		} 
		else 
		{
			audio_stop_sound(snd_enemy_fear);
			audio_resume_sound(snd_enemy_walk04);
		}
	}
}

//Play a thud sound
function p_playThud()
{
	if !audio_is_playing(snd_thud)
		audio_play_sound(snd_thud, 10, false, global.settings.audio_sounds);
}

//play a coin sound
function p_playCoinGet()
{
	_playCoinGetSwap = !_playCoinGetSwap;
	
	if !audio_is_playing(snd_capman_coinget)
	{
		if (_playCoinGetSwap)
			audio_play_sound(snd_capman_coinget, 9, false, global.settings.audio_sounds);
		else 
			p_playCoinGetPitched(2);
	}
}

//play a coin sound with a pitch modifier
function p_playCoinGetPitched(_pitch)
{
	if !audio_is_playing(snd_capman_coinget)
		audio_play_sound(snd_capman_coinget, 9, false, global.settings.audio_sounds, 0, _pitch);
}

//play an electrick shock sound
function p_playShock()
{
	if !audio_is_playing(snd_shock)
		audio_play_sound(snd_shock, 10, false, global.settings.audio_sounds);
}

//play a 1up sound
function p_play1up()
{
	if !audio_is_playing(snd_capman_1up)
		audio_play_sound(snd_capman_1up, 10, false, global.settings.audio_sounds);
}

//stop all sounds
function p_stopAllSounds()
{
	audio_stop_all();
}