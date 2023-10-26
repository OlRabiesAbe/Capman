/// @description Insert description here
// You can write your code in this editor
/*
_pSystem = part_system_create_layer("Instance_Layer", false);
_particleBone = part_type_create();
part_type_shape(_particleBone, pt_shape_pixel);
part_type_size(_particleBone,1,1,-0.1,0);
part_type_speed(_particleBone,0.50,2,-0.10,0);
part_type_life(_particleBone,room_speed*10,room_speed*20); 
part_particles_create(_pSystem, room_width/2, room_height/2, _particleBone, 100);
*/

_particleSystem = part_system_create_layer("Particle_Layer", false);

function p_toggleEnemyParticles(_bool) {
	
	if instance_exists(obj_enemy_zombie) {
		if _bool {
			with (obj_enemy_zombie) {
				
				_particleBone = part_type_create();
				part_type_shape(_particleBone, pt_shape_pixel);
				part_type_size(_particleBone,1,1,-0.1,0);
				part_type_speed(_particleBone,0.50,2,-0.10,0);
				part_type_life(_particleBone,room_speed*10,room_speed*20); 
				part_particles_create(obj_logic_particlemanager._particleSystem, 
										obj_enemy_zombie.x, obj_enemy_zombie.y,_particleBone, 100);
				//obj_logic_screenwriter.p_drawDebugText("particles are partifified!");
			}
		}
		
		else {
			with (obj_enemy_zombie) {
				part_type_destroy(_particleBone);
			}
		}
	}
	
}