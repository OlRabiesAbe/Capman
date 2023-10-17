/// @description Functions

/*	These two functions add logic structs to a room to set
 *	it up for gameplay or a cutscene.
 */
function _initializeGameplayLogicStructs() 
{
	
	if !instance_exists(obj_logic_gamemanager)
		instance_create_layer(0, 0, "Logic", obj_logic_gamemanager);
	
	obj_logic_gamemanager.p_setRound(_roundIndex);
	
	if !instance_exists(obj_logic_screenwriter)
		instance_create_layer(0, 0, "Logic", obj_logic_screenwriter);
		
	if !instance_exists(obj_logic_soundplayer)
		instance_create_layer(0, 0, "Logic", obj_logic_soundplayer);
}

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
	if instance_exists(obj_logic_gamemanager)
	{
		_totalScore += _roundScore; //update total score
		
		_totalScore += obj_logic_gamemanager.p_getTimerSeconds() * 100; //add time bonus
		_lives1upCounter += obj_logic_gamemanager.p_getTimerSeconds() * 100; //add time bonus
		
		_totalClock += obj_logic_gamemanager.p_getGameTimeSeconds();
	}
	
	if _roundIndex >= _ROUNDMAX || instance_exists(obj_logic_cutscenemanager) 
	{
		_roundIndex = 0;
		_roomIndex++;
	
		if room_exists(room_next(room))
			room_goto_next();
	
	} 
	else 
	{
		_roundIndex++;
		p_restartRoom();
	}
}

/*	Restart this room
 */
function p_restartRoom() 
{
	room_restart();
}


//=====VAR GETTERS & SETTERS=====
//==========================
function p_getTotalScore()
{
	return _totalScore;
}
function p_getRoundScore()
{
	return _roundScore;
}
function p_incrementRoundScore(_value) 
{
	_roundScore += _value;
	_lives1upCounter += _value;
}

/* _lives Getter
 */
function p_getLives() 
{
	return _lives;
}

/* _lives Incrementers & Decrementers
 */
function p_incrementLives() 
{
	_lives++;
}
function p_incrementLives(_amount) 
{
	_lives += _amount;
}
function p_decrementLives() 
{
	_lives--;
}
//_lives1upCounter is a bucket for doling out 1ups. obj_logic_gamemanager handles it.
/*function p_getLives1upCounter()
{
	return _lives1upCounter;
}
function p_incLives1upCounter()
{
	return _lives1upCounter;
}
function p_resetLives1upCounter()
{
	_lives1upCounter -= 10000;
}*/