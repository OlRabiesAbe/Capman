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
 /*	Add to room and initialize objects neccessary for cutscene rooms
  */
function _initializeCutsceneLogicStructs() 
{
	if !instance_exists(obj_logic_cutscenemanager)
		instance_create_layer(0, 0, "Logic", obj_logic_cutscenemanager);
	
	if !instance_exists(obj_logic_soundplayer)
		instance_create_layer(0, 0, "Logic", obj_logic_soundplayer);
}

/*	Advance to the next level or next round depending on _roundIndex
 */
function p_advanceLevel() 
{
	 //goto next room if we hit the _ROUNDMAX
	if _roundIndex >= _ROUNDMAX || instance_exists(obj_logic_cutscenemanager)
	{
		_roundIndex = 0;//reset round index
		_roomIndex++;
	
		if room_exists(room_next(room))
			room_goto_next();
	} 
	else 
	{  //goto next round
		_roundIndex++;
		p_restartRoom();
	}
}

/*	Update _totalClock, _totalScore, _lives1upCounter on round end.
 *	I think Needs to be handled seperately from p_advanceLevel().
 */
function p_updateStatsOnRoundEnd() 
{
	_totalScore += _roundScore;
	_totalClock += obj_logic_gamemanager.p_getGameTimeSeconds();
	
	var _timeBonus = obj_logic_gamemanager.p_getTimerSeconds() * 100;
	_totalScore += _timeBonus;
	_lives1upCounter += _timeBonus;
}

/*	Restart this room. Is this func needed?
 *	Currently exists just to keep the room restarting under supermanager's control
 */
function p_restartRoom() 
{
	room_restart();
}


//=====VAR GETTERS & SETTERS=====
//==========================
//_totalScore getter
function p_getTotalScore()
{
	return _totalScore;
}
//_totalScore + _roundScore getter
function p_getCurTotalScore()
{
	return _totalScore + _roundScore;
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
