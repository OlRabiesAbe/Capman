/// @description Room init

//reset round score at start of room
_roundScore = 0;

if (room == room_cutscene) 
{
	_initializeCutsceneLogicObjs();
}
else if (room == room_mainmenu) 
{
	/*do nothing*/;
}
else 
{
	_initializeGameplayLogicObjs();
	_initUnmoddedLevel(); 
	_modifyLevel(_modifierIndex);  //modifier of zero means no mods
}

