/// @description Room init

//reset round score at start of room
_roundScore = 0;

switch(_roomIndex) {
	case 0: case 1: case 2: 
		_initializeGameplayLogicStructs();
		break;
	default:
		_initializeCutsceneLogicStructs();
		break;
}

