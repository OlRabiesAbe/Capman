/// @description touched by enemy logic

if p_isAlive && !p_isPowered {
	// the ghost needs to be right on top of the player to kill it,
	// so we have this extra check to make sure of that.
	if abs(other.x - x) < 16 && abs(other.y - y) < 16 {
		obj_logic_soundplayer.p_playThud();
		p_isAlive = false;
	}
} 
