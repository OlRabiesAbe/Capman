/// @description Functions and init

_particleSystem = part_system_create_layer("Particle_Layer", false);

function p_toggleEnemyParticles(_bool) {
	
	if instance_exists(obj_enemy_zombie) {
		if _bool {
			with (obj_enemy_zombie) {
				
				_particleBone = part_type_create();
				
				part_type_sprite(_particleBone, spr_bone00, true, true, true);
				part_type_size(_particleBone, 1.5, 2.5, 0, 0);
				part_type_speed(_particleBone, 1, 2, 0, 0);
				part_type_direction(_particleBone, 45, 135, 0, 0);
				part_type_gravity(_particleBone, 0.05, 270);
				part_type_life(_particleBone, room_speed, room_speed*1.5); 
				
				part_particles_create(obj_logic_particlemanager._particleSystem, 
										obj_enemy_zombie.x, obj_enemy_zombie.y, _particleBone, 1);
										
				//obj_logic_screenwriter.p_drawDebugText("p_toggleEnemyParticles() successful");
			}
		}
		
		else {
			with (obj_enemy_zombie) {
				
				part_type_destroy(_particleBone);
				//obj_logic_screenwriter.p_drawDebugText("p_toggleEnemyParticles() successful");
			}
		}
	}
	
}

//Debug function, not used
/*function p_generateEnemyParticles() {

				_particleBone = part_type_create();
				
				part_type_sprite(_particleBone, spr_bone00, true, true, true);
				part_type_size(_particleBone, 1.5, 2.5, 0, 0);
				part_type_speed(_particleBone, 1, 2, 0, 0);
				part_type_direction(_particleBone, 45, 135, 0, 0);
				part_type_gravity(_particleBone, 0.05, 270);
				part_type_life(_particleBone, room_speed, room_speed*1.5); 
				
				part_particles_create(obj_logic_particlemanager._particleSystem, 
										room_width/2, room_height/2, _particleBone, 1);
										
				obj_logic_screenwriter.p_drawDebugText("p_generateEnemyParticles() activated!");
	
}*/