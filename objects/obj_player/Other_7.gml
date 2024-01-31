/// @description Halt spr_explosion after one play

if (sprite_index == spr_explosion)
{
	sprite_set_speed(sprite_index, 0, spritespeed_framespersecond);
}