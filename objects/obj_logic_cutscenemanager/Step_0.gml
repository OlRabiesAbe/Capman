/// @description Insert description here
// You can write your code in this editor

//check for user input
//if input, disable current layers, enable next layer - similar to how supermanager level modding works
	//_cutsceneIndex indicates which layers to have enabled
	//instead of directly enabling next layer, call an alarm that will do it.
//how will it know when it's reached the final layer?
	//the room's hexcode should store this information
//has var to tell supermanager to advance room.
//might need a slightly different system for in-game cutscenes then.
//could just have a seperate var for "cutscene done: resume gameplay"

//purely for sake of not cluttering supermanager, i want to put detailed cutscene data in here.
//which cutscene to play will be invoked by supermanager, but what that cutscene actually is wil be stored in here

/*cutscene_slide Object = {
	image: Sprite,
	time: Int (steps),
	x: Int,
	y: Int,
	

*/
