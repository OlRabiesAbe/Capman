/// @description Adjust elroy fx volume & pitch, runs every quarter second
//TODO: this code only works for one elroyed enemy. Im not sure how it should work for multiple.


//player-enemy difference holds (difference in xy positions for player and enemy)
var _pedif =
{
	x : _elroyedEnemyPnt.x - _playerPnt.x, 
	y: _elroyedEnemyPnt.y - _playerPnt.y
}

//player-enemy C is gotten by applying the pythagorean to _pedif x & y
var _peC = sqrt( sqr(_pedif.x) + sqr(_pedif.y) );

//room C is the length of a diagonal line from opposite corners of the room
//it will never change, so it's stored permanently

//adjusted player-enemy C is _peC normalized to the room size. it ranges from ~0.65(far) to 0.0(close)
var _adjpeC = _peC / _roomC;

//_enemyNearness is a quantification of how near the elroyed enemy is to the player
//_enemyNearness ranges from ~0.6(near-ish) to ~0.8(very close).
//though it will usually be 0.0, if the enemy isnt relatively near to the player.
var _enemyNearness = 0.8 - _adjpeC;
if (_enemyNearness < 0.6) _enemyNearness = 0;

//adjust volume and pitch to _enemyNearness
audio_sound_gain(snd_enemy_elroy, global.settings.audio_sounds * _enemyNearness, 500);
audio_sound_pitch(snd_enemy_elroy, 0.5 + _enemyNearness);

//looping this alarm
alarm[0] = 0.25 * room_speed;