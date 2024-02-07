/// @description Room init

//reset round score at start of room
_roundScore = 0;

_initializeGameplayLogicStructs();


instance_deactivate_layer("Instances_1");
layer_set_visible("Tiles_1", false);