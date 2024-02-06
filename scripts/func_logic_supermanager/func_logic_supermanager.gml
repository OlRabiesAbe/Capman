// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


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