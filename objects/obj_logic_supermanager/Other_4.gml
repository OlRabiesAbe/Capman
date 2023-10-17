/// @description Room init

_roundScore = 0;

switch(_roomIndex) {
	case 0: case 1: case 2: 
		_initializeGameplayLogicStructs();
		break;
	default:
		_initializeCutsceneLogicStructs();
		break;
}

