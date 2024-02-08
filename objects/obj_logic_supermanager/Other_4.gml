/// @description Room init

//reset round score at start of room
_roundScore = 0;

_initializeGameplayLogicStructs();

_initUnmoddedLevel(); 
_modifyLevel(_modifierIndex);  //modifier of zero means no mods