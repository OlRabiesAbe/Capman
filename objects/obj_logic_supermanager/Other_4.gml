/// @description Room init

switch(_roomIndex) {
	case 0: case 1:
		_initializeGameplayLogicStructs();
		break;
	case 2: default:
		_initializeCutsceneLogicStructs();
		break;
}

