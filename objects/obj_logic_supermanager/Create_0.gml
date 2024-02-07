/// @description Functions

/*	The _levelLoadAr is a list of hex numbers that represent the level progression in the game
 *	Format: 0xAB_C; A is Level #,
 *	B is a modifier for that Level (like new enemies or small layout changes,
 *	and C is Round #.
 *	For instance 0x11_3 is round 3 of level 1, with modifier 1 applied to the level.
 *	Rounds can only go up to 15 due to limitations of hex and this numbering system.
 *	Negative decimal values indicate cutscenes. For instance -100 is the end-of-game cutscene.
 */
_levelLoadAr = [0x00_0, 0x00_1, 0x00_2, 0x00_3, 0x00_4, 0x00_5, 0x00_6, 0x00_8, 0x00_A, 0x00_C, -100];


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
		
	// !instance_exists(obj_logic_scanlinedrawer)
	//	instance_create_layer(0, 0, "Logic", obj_logic_scanlinedrawer);
		
	if !instance_exists(obj_logic_soundplayer)
		instance_create_layer(0, 0, "Logic", obj_logic_soundplayer);
		
	if !instance_exists(obj_logic_particlemanager)
		instance_create_layer(0, 0, "Logic", obj_logic_particlemanager);
	
	obj_logic_gamemanager.p_setRound(_roundIndex);
}


/*	Advance to the next level or next round depending on _roundIndex
 */
function _advanceLevel() 
{
	var _levelLoadStruct = _parseLevelLoadHex(_levelLoadAr[_levelLoadIndex]);
	_levelLoadIndex++;
	
	_roundIndex = _levelLoadStruct.round;
	
	room_goto(_levelLoadStruct.room);
}


/// @function _parseLevelLoadHex(_hex);
/// @param {index} _hex A three digit hexadecimal representing what room and round to load next
/// @return {struct} _levelLoadStruct A struct containing a room, and two ints representing a room-modifier and round
/*		This func takes a three digit hex # from _levelLoadAr and returns it as a
 *		_levelLoadStruct, which contains values room (type room), modifier (type hex? int),
 *		and round (type hex? int). This is information about what room and round to load next.
 */
function _parseLevelLoadHex(_hex)
{
	//case: _hex is too large; out of bounds
	if (_hex > 0xFFF)
	{
		throw ("obj_logic_supermanager._parseLevelLoadHex(): LEVELLOAD HEX OOB");
	}
	
	//case: _hex is negative; its a cutscene
	//no cutscenes implemented yet
	if (_hex < 0)
	{
		switch(_hex)
		{
			case -100:
				_levelLoadStruct.room = room_mainmenu;
				break;
			default:
				throw ("obj_logic_supermanager._parseLevelLoadHex(): INVALID ROOM NUMBER");
				break;
		}
		_levelLoadStruct.modifier = -1;
		_levelLoadStruct.round = -1;
	}
	else 
	{
		//case: default. _hex is positive. assemble then return _levelLoadStruct.
		//needs values for room, modifier, & round; from _hex digits 100s 10s and 1s respectively
		var _levelLoadStruct = {};
	
		switch( floor(_hex div 0x100) )
		{
			case 0x0:
				_levelLoadStruct.room = room_forest_00;
				break;
			case 0x1:
				_levelLoadStruct.room = room_catacombs_00;
				break;
			case 0x2:
				_levelLoadStruct.room = room_city_00;
				break;
			default:
				throw ("obj_logic_supermanager._parseLevelLoadHex(): INVALID ROOM NUMBER");
				break;
		}
	
		//no use for modifier yet
		_levelLoadStruct.modifier = (_hex div 0x10) mod 0x10;
	
		_levelLoadStruct.round = _hex mod 0x10;
	}
	
	return _levelLoadStruct;
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
{
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
//_totalScore + _roundScore getter
function p_getCurTotalScore()
{
	return _totalScore + _roundScore;
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
}