/// @description Player Death: set _gameIsOver to true
if (!_gameIsWon)
{
	_gameIsOver = true;
	p_restartLevel();
}