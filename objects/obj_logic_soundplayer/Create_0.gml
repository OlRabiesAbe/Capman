/// @description Functions

/*	Called by obj_enemy_zombies to play start playing their footstep sounds.
 *	Prevents overlap.
*/
function p_playEnemyFootsteps() 
{
	if _gameplayMode
		if !audio_is_playing(snd_enemy_walk04)
			audio_play_sound(snd_enemy_walk04, 8, true);
}

function p_toggleEnemyFearSound(_toggle)
{
	if _gameplayMode 
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

function p_playThud()
{
	if _gameplayMode 
		if !audio_is_playing(snd_thud)
			audio_play_sound(snd_thud, 10, false);
}

function p_playCoinGet()
{
	if _gameplayMode 
		if !audio_is_playing(snd_capman_coinget)
			audio_play_sound(snd_capman_coinget, 9, false);
}

function p_stopAllSounds()
{
	audio_stop_all();
}