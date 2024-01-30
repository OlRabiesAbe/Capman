/// @description Functions and init

///=====INIT CODE
///===============

_particleSystem = part_system_create_layer("Particle_Layer", false);

//bone particles for scared enemy zombies
_particleBone = part_type_create();		
part_type_sprite(_particleBone, spr_bone00, true, true, true);
part_type_size(_particleBone, 1, 1.5, 0, 0);
part_type_speed(_particleBone, 1, 1.5, 0, 0);
part_type_direction(_particleBone, 60, 120, 0, 0);
part_type_gravity(_particleBone, 0.05, 270);
part_type_life(_particleBone, room_speed, room_speed*1.5); 

//ascending dust particles for player death
_particleGlitter = part_type_create();
part_type_size(_particleGlitter, 6, 8, 0, 0);
part_type_speed(_particleGlitter, 6, 8, -0.5, 0);
part_type_direction(_particleGlitter, 0, 180, 0, 25);
part_type_gravity(_particleGlitter, 0.5, 90);
part_type_life(_particleGlitter, room_speed*3, room_speed*3);

//ascending dust particles for enemy elroy
_particleSmoke = part_type_create();
part_type_size(_particleSmoke, 6, 8, 0.1, 0);
part_type_speed(_particleSmoke, 0.1, 0.5, -0.5, 0);
part_type_direction(_particleSmoke, 70, 110, 0, 1);
part_type_gravity(_particleSmoke, 0.5, 90);
part_type_colour1(_particleSmoke, #212528);
part_type_life(_particleSmoke, room_speed, room_speed*1.5);


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

//generate burst of glitter dust particles.
//meant for player death.
function p_genDeathGlitterParticle(_x, _y)
{
	part_particles_create(obj_logic_particlemanager._particleSystem, _x, _y, 
							obj_logic_particlemanager._particleGlitter, 30);
}

//generate smoke particles
//meant for enemy elroy.
function p_genElroySmokeParticle(_x, _y)
{
	part_particles_create(obj_logic_particlemanager._particleSystem, _x, _y, 
							obj_logic_particlemanager._particleSmoke, 1);
}