/// @description Functions and init

///=====INIT CODE
///===============

_particleSystem = part_system_create_layer("Particle_Layer", false);

//bone particles for enemy zombies
_particleBone = part_type_create();		
part_type_sprite(_particleBone, spr_bone00, true, true, true);
part_type_size(_particleBone, 1, 1.5, 0, 0);
part_type_speed(_particleBone, 1, 1.5, 0, 0);
part_type_direction(_particleBone, 60, 120, 0, 0);
part_type_gravity(_particleBone, 0.05, 270);
part_type_life(_particleBone, room_speed, room_speed*1.5); 



///=====FUNCTIONS
///===============

//generate 1-2 bone parts at given xy coords
function p_genBoneParticle(_x, _y) 
{
	switch(irandom(2)) 
	{ //randomise particle bone sprite
		case 0:
			part_type_sprite(obj_logic_particlemanager._particleBone, spr_bone00, true, true, true);
			break;
		case 1:
			part_type_sprite(obj_logic_particlemanager._particleBone, spr_bone01, true, true, true);
			break;
		case 2: default:
			part_type_sprite(obj_logic_particlemanager._particleBone, spr_bone02, true, true, true);
			break;
	}
			
	part_particles_create(obj_logic_particlemanager._particleSystem, _x, _y, 
							obj_logic_particlemanager._particleBone, 1+irandom(1));
}