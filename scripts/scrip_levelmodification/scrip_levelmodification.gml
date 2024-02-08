// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/*	Initialize unmodded version of a level by deactivating all modifications.
 *	AFAIK you can't deactivate instance layers in the layer/room editors, so we need to do it this way.
 */
function _initUnmoddedLevel(){
	for (var i = 0; i < 0x10; i++)
	{
		instance_deactivate_layer("Mod_Inst_" + string(i));
		layer_set_visible("Mod_Tiles_" + string(i), false);
	}
}

/*	Apply level modifications.
 *	Done by simply enabling the layers associated with the _modifierIndex
 */
function _modifyLevel(_modifier)
{
	if (_modifier == 0) return; //modifier of zero means no mods
	
	instance_activate_layer("Mod_Inst_" + string(_modifier));
	layer_set_visible("Mod_Tiles_" + string(_modifier), true);
}