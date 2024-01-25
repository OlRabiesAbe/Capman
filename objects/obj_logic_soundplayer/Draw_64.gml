/// @description DEBUG displays _enemyNearness @ _elroyedEnemyPnt's location

if keyboard_check(ord("F"))
{
	draw_set_font(font_basic);
	draw_set_color(c_white);
	draw_text_transformed(_elroyedEnemyPnt.x, _elroyedEnemyPnt.y, string(_enemyNearness), 1, 1, 0);
}