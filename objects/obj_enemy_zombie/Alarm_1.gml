/// @description Moving by calling _moveInDirection
//@uses p_direction


var _moveTicRate = 1;

//outside room wrapping behavior
move_wrap(true, true, sprite_width);

_moveInDirection(_direction);
alarm_set(1, _moveTicRate);

