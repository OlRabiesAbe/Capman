/// @description Movement decision AI, runs every step when active

//init coords. Never actually tries to path here
var _targetCoords = [0, 0];
var _validMoveArray = [0, 0, 0, 0];
var _idealMoveArray = [0, 0, 0, 0];


//setting up our pathfinging structs
if (p_chase && !p_scared)
{
	_targetCoords = _getPlayerLocation(); //target the player\
} 
else 
{											//dont target the player: scatter logic
	_targetCoords = [_scattertarget.x, _scattertarget.y];
}

//generating pathing decision arrays
_validMoveArray = _getValidMoveArray();
_idealMoveArray = _getIdealMoveArray(_targetCoords);


/*	use our two movearrays to figure out which way we want to go
	first we look for move that we like and is valid */
var _directionFound = false;

for (i = 0; i < array_length(_idealMoveArray); i++) 
{
	if _idealMoveArray[i] && _validMoveArray[i] 
	{
		_direction = _parseMoveArrayIndexToDirectionalString(i);
		
		_directionFound = true;
		break;
	}
}

/*	if !_directionFound, we didnt find a move we liked that we could take. 
	So, we just need to find a move that's valid. */
if !_directionFound 
{
	for (i = 0; i < array_length(_validMoveArray); i++) 
	{
		if _validMoveArray[i]  
		{
			_direction = _parseMoveArrayIndexToDirectionalString(i);
			break;
		}
	}
}

//looping alarm[0]
alarm_set(0, 1);