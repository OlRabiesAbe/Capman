/// @description touched by enemy logic

if (p_isAlive && !p_isPowered)
{
	// the ghost needs to be almost right on top of the player to kill it,
	// so we have this extra check to make sure of that.
	if abs(other.x - x) < 16 && abs(other.y - y) < 16 {
		obj_logic_soundplayer.p_playThud();
		obj_logic_particlemanager.p_genDeathGlitterParticle(x, y);
		p_isAlive = false;
		//go invisible, REPLACE WITH ANIM
		image_alpha = 0;
	}
} 
