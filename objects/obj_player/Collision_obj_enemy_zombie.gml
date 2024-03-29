/// @description touched by enemy logic

if (p_isAlive && !other.p_scared)
{
	// the ghost needs to be almost right on top of the player to kill it,
	// so we have this extra check to make sure of that.
	if abs(other.x - x) < 16 && abs(other.y - y) < 16 {
		obj_logic_soundplayer.p_playThud();
		//replace current sprite with death explosion sprite
		sprite_index = spr_explosion;
		obj_logic_particlemanager.p_genDeathGlitterParticle(x, y);
		p_isAlive = false;
	}
}
