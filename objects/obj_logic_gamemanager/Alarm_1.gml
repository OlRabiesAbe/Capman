/// @description Player Won Game: set _gameIsWon to true

//supermanager checks _gameIsWon every step by calling gamemanager.p_getGameWon()
//if it returns true, it advances to the next level/round by calling supermanager._advanceLevel()
_gameIsWon = true;