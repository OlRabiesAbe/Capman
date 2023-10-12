/// @description Room init

switch(_roomIndex) {
	case 0: case 1: case 2: 
		_initializeGameplayLogicStructs();
		break;
	default:
		_initializeCutsceneLogicStructs();
		break;
}

