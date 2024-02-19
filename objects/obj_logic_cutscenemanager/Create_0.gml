/// @description Insert description here
// You can write your code in this editor

callme = function (_spr, _frame)
{
	draw_sprite(_spr, _frame, 55, 115);
}

obj = {
	spr: spr_cutscene_00,
	frame: 0
};



function _setCutscene(_index) 
{
	_cutsceneIndex = _index;
}