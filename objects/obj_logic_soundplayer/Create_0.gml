/// @description Functions

_playCoinGetSwap = false;

///=====FUNCTIONS
///===============
/*	Called by obj_enemy_zombies to play start playing their footstep sounds.
 *	Prevents overlap.
 */
function p_playEnemyFootsteps() 
{
	if obj_logic_gamemanager.p_getGameplayMode()
		if !audio_is_playing(snd_enemy_walk04)
			audio_play_sound(snd_enemy_walk04, 8, true);
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
			audio_play_sound(snd_enemy_fear, 8, true);
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
		audio_play_sound(snd_thud, 10, false);
}
function p_playThud(_pitch)
{
	if !audio_is_playing(snd_thud)
		audio_play_sound(snd_thud, 10, false, 1, 0, _pitch);
}

//play a coin sound
function p_playCoinGet()
{
	if !audio_is_playing(snd_capman_coinget00) && !audio_is_playing(snd_capman_coinget01)
	{
		if (!_playCoinGetSwap)
			_playCoinGetSwap = true;
		else if (_playCoinGetSwap)
			_playCoinGetSwap = false;
			
		if (_playCoinGetSwap)
			audio_play_sound(snd_capman_coinget00, 9, false);
		else 
			audio_play_sound(snd_capman_coinget01, 9, false);
	}
}
function p_playCoinGet(_pitch)
{
	if !audio_is_playing(snd_capman_coinget00)
		audio_play_sound(snd_capman_coinget00, 9, false, 2, 0, _pitch);
}

//play a 1up sound
function p_play1up()
{
	if !audio_is_playing(snd_capman_1up)
		audio_play_sound(snd_capman_1up, 10, false);
}
function p_play1up(_pitch)
{
	if !audio_is_playing(snd_capman_1up)
		audio_play_sound(snd_capman_1up, 10, false, 1, 0, _pitch);
}

//stop all sounds
function p_stopAllSounds()
{
	audio_stop_all();
}