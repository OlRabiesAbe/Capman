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
	if instance_exists(obj_logic_gamemanager) {
		_totalScore += obj_logic_gamemanager.p_getScore(); //add score
		_totalScore += obj_logic_gamemanager.p_getTimerSeconds() * 100; //add time bonus
		_totalClock += obj_logic_gamemanager.p_getGameTime();
	}
	
	if _roundIndex >= _ROUNDMAX  || instance_exists(obj_logic_cutscenemanager) {
		_roundIndex = 0;
		_roomIndex++;
	
		if room_exists(room_next(room))
		{
		    room_goto_next();
		}
	} else {
		_roundIndex++;
		room_restart();
	}
}

/*	Restart this room
 */
function p_restartRoom() 
{
	if instance_exists(obj_logic_gamemanager) {
		_totalScore += obj_logic_gamemanager.p_getScore(); //add score
		_totalScore += obj_logic_gamemanager.p_getTimerSeconds() * 100; //add time bonus
		_totalClock += obj_logic_gamemanager.p_getGameTime();
	}
	
	room_restart();
}
