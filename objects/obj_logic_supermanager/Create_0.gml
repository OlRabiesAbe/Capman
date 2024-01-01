/// @description Functions

/*	These two functions add logic structs to a room to set
 *	it up for gameplay or a cutscene.
 */
 /*	Add to room and initialize various objects neccessary for gameplay
  */
function _initializeGameplayLogicStructs() 
{
	
	if !instance_exists(obj_logic_gamemanager)
		instance_create_layer(0, 0, "Logic", obj_logic_gamemanager);
	
	if !instance_exists(obj_logic_screenwriter)
		instance_create_layer(0, 0, "Logic", obj_logic_screenwriter);
		
	if !instance_exists(obj_logic_soundplayer)
		instance_create_layer(0, 0, "Logic", obj_logic_soundplayer);
		
	if !instance_exists(obj_logic_particlemanager)
		instance_create_layer(0, 0, "Logic", obj_logic_particlemanager);
	
	obj_logic_gamemanager.p_setRound(_roundIndex);
}

/*	Advance to the next level or next round depending on _roundIndex
 */
function p_advanceLevel() 
{
	 //goto next room if we hit the _ROUNDMAX
	 //the first if handles advancing out of a room. kinda Not used in current build.
	if _roundIndex >= _ROUNDMAX 
	{
		_roundIndex = 0;//reset round index
		_roomIndex++;
	
		if room_exists(room_next(room))
			room_goto_next();
	} 
	else 
	{  //goto next round
		_roundIndex++;
		room_restart();
	}
}

/*	Restart level when player dies
 */
function p_restartLevel()
{
	audio_stop_sound(snd_enemy_walk04);

	if (_lives > 0)
	{
		p_decrementLives();
		obj_logic_gamemanager.p_restartLevel();
	}
	else throw ("OUT OF LIVES");
	
}

/*	Update _totalClock, _totalScore, _lives1upCounter on round end.
 *	handled seperately from p_advanceLevel().
 */
function p_updateStatsOnRoundEnd() 
{
	_totalScore += _roundScore;
	_totalClock += obj_logic_gamemanager.p_getGameTimeSeconds();
	
	var _timeBonus = obj_logic_gamemanager.p_getTimerSeconds() * 100;
	_totalScore += _timeBonus;
	_lives1upCounter += _timeBonus;
}





//=====VAR GETTERS & SETTERS=====
//==========================
//_totalScore getter
function p_getTotalScore()
{
	return _totalScore;
}
//_roundScore getter
function p_getRoundScore()
{
	return _roundScore;
}
//_roundScore setter
function p_incrementRoundScore(_value) 
{
	_roundScore += _value;
	_lives1upCounter += _value;
}

// _lives Getter
function p_getLives() 
{
	return _lives;
}
//_lives setter
function p_incrementLives() 
{
	_lives++;
}
//_lives setter
function p_decrementLives() 
{
	_lives--;
}
//_lives1up getter
function p_getLives1up() 
{
	return _lives1upCounter;
}
