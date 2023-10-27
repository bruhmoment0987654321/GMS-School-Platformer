 switch(Boss_state){
	case"wait":
	//gives the player time to attack the foe. It will have different idle animations which will be random.
	#region functionality
		if(hsp != 0) && (dash){
			hsp = lerp(hsp,0,friction_);	
			with (instance_create_depth(x,y,depth+1,Obj_trail)){
				sprite_index = other.sprite_index;
				image_blend = #b2b2b2;
				image_alpha = 0.9;
			}
		}
		if(point_direction(x,y,Obj_player.x,Obj_player.y-4) >= 90){
			dir = 1;
		}else{
			dir = -1;	
		}
		wait_time -= 1;
		if(wait_time <= 0){
			switch(pre_boss_state){
				case "":
					Boss_state = choose("dash/clone","jump","spit");
				break;
				case "jump":
					Boss_state = choose("dash/clone","spit");
				break;
				case "spit":
					Boss_state = choose("dash/clone","jump");
				break;
				case "dash/clone":
					Boss_state = choose("jump","spit");
				break;
			}
			
			if(_health < lowered_health){
				wait_time = 2*60;
			}else{
				wait_time = wait_time_amount;	
			}
		}
		if(place_meeting(x,y,Obj_player)) && (Obj_player.state == Obj_player.statedash){
			Boss_state = "hit";
			if(_health < lowered_health){
				wait_time = 2*60;
			}else{
				wait_time = wait_time_amount;	
			}
		}
		
	#endregion
	break;
	case"jump":
	//goes up, beyond the screen, waits a bit, and goes back down close to the position of the player. 
		#region timers and such
			var goup = false;
			jump_time -= 1;
			if(move = false){
				sprite_index = Spr_boss1_jump;
				image_index = 1;
			}
			if(jump_time <= 0){
				move = true;
				goup = true;
				jump_time = 60;
			}
			if(goup){
				image_index += 2;
				vsp -= 40;	
			}
			if(y < -50){
				vsp = 0;
				wait = true;
			}
			if(wait = true){
				stomp_timer -= 1;
				switch(stomp_location){
					case 0:
						x = 105;
						warning.x = 112-16;
						warning.y = 576+16;
					break;
					case 1:
						x = 290;
						warning.x = 304-16;
						warning.y = 576+16;
					break;
					case 2:
						x = 490;
						warning.x = 496-16;
						warning.y = 576+16;
					break;
					case 3:
						if(Obj_player.x >= 75){
							x = Obj_player.x;
						}else{
							x = Obj_player.x + (sprite_width/2) - 5;
						}
						if(Obj_player.x <= 568){
							x = Obj_player.x;
						}else{
							x = Obj_player.x -(sprite_width/2) + 5;
						}
						warning.x = Obj_player.x;
						warning.y = Obj_player.y-16;
					break;
				}
			}
		#endregion
		#region stomping function
			if(_health > lowered_health){
				if(Obj_player.x > 0 && Obj_player.x < 220){
					stomp_location = 0;
				}
				if(Obj_player.x > 221 && Obj_player.x < 415){
					stomp_location = 1;
				}
				if(Obj_player.x > 416 && Obj_player.x < 640){
					stomp_location = 2;
				}
			}else{
				stomp_location = 3;	
			}
			if(stomp_timer <= 0){
				sprite_index = Spr_boss1_fall;
				warning.x = -100;
				if(!place_meeting(x,y-1,Obj_wall)){
					vsp += 40;
				}
				wait = false;
				Boss_state = "wait";
				dash = false;
				pre_boss_state = "jump";
				if(_health > lowered_health){
					stomp_timer = stomp_timer_amount;	
				}else{
					stomp_timer = 2*60;
				}
			}
		#endregion
	break;
	case"spit":
	/*waits a bit and creates an object that moves in an arch that goes towards the player.
	once the object lands, the object stops moving and changes its sprite. */
		#region turning on directions and all that.
			wait = true;
			if(point_direction(x,y,Obj_player.x,Obj_player.y-4) >= 90){
				dir = 1;
			}else{
				dir = -1;	
			}
			if(wait){
				spit_timer -= 1;	
			}
	#endregion
		#region The spit functionality and resetin timers
			if(spit_timer <= 0){
				var spit_amount;
				if(_health >= 3){
					spit_amount = 10;	
				}else{
					spit_amount = 20;
				}
		
				repeat(spit_amount){
					var laser_spit = instance_create_layer(x,y-32,"Spit",Obj_spit_ball);
					laser_spit.speed = random_range(4,6);
					if(dir > 0) laser_spit.direction = 120 + random_range(-15,5); else if(dir < 0) laser_spit.direction = 60 + random_range(-5,15);
					laser_spit.gravity = 0.1;
				}
				spit_time_amount = 60;
				spit_timer = spit_time_amount;
				Boss_state = "wait";
				wait = false;
				dash = false;
				pre_boss_state = "spit";
			}
	#endregion
	break;
	case"dash/clone":
	/*probably the hardest thing. It'll act like the slime, where he dashes, even down to the trail effect. But, it'll be a bit slower
	and the sliem will chase the player. its going to be for about 5 seconds. Once the boss has only 2 health left, this state changes. 
	The boss will transform itself into one of 2 enemies. The bigman, and the bat. The bat will move up and down, kinda like a sin wave. 
	The big man will hold up one leg and stomp the ground, making you hide in between his legs. */
	if(_health > lowered_health){
		#region the dashing part
		var max_hsp = 10;
		 if(point_direction(x,y,Obj_player.x,Obj_player.y-4) >= 90){
			dir = 1;
		}else{
			dir = -1;	
		}
		with (instance_create_depth(x,y,depth+1,Obj_trail)){
			sprite_index = other.sprite_index;
			image_blend = #b2b2b2;
			image_alpha = 0.9;
		}
		if(dash_timer >= 0){
			hsp -= 0.1 * (dir);
			hsp = clamp(hsp,-max_hsp,max_hsp);
		}else{
			dash_timer = 5*60;	
			Boss_state = "wait";
			pre_boss_state = "dash/clone";
			dash = true;
		}
		dash_timer--;
		#endregion
	}else{
		#region the clone part
			var max_hsp = 3;
			if(wait2){
				if(x > 400) && (x < 450){
					dir = 1;
					hsp = 0;
					attack_time--;
				}else if(x < 400){
					dir = -1;
					hsp += 1;
					hsp = clamp(hsp,-max_hsp,max_hsp);
				}else if(x > 450){
					dir = 1;
					hsp -= 1;
					hsp = clamp(hsp,-max_hsp,max_hsp);
				}
			}
			if(attack_time <= 0){
				sprite_index = Spr_sliem_bat_transform;
				if(image_index > 16){
					sprite_index = Spr_sliem_bat;
					wait2 = false;
					bounce = true;
					attack_time = 60;
				}
			}
			if(bounce){
				if(place_meeting(x,y+1,Obj_solid)){
					if(point_direction(x,y,Obj_player.x,Obj_player.y-4) >= 90){
						dir = 1;
					}else{
						dir = -1;	
					}
					bounce_amount += 1;
					var direction_;
					var height = 3;
					if(dir > 0) direction_ = 95; else if(dir < 0) direction_ = 85;
					hsp += lengthdir_x(height*bounce_amount,direction_);
					vsp += lengthdir_y(height*bounce_amount,direction_);
					
				}
				if(bounce_amount >= bounce_amount_max){
					bounce = false;
					bounce_amount = 0;
				}
			}else{
				if(y < 250){
					x = room_width/2;
					y = 230;
					sprite_index = Spr_boss1_idle;
					stomp2_timer--;
					vsp = 0;
					hsp = 0;
					warning.x = room_width/2;
					warning.y = 592;
				}
				if(stomp2_timer <= 0){
					if(!place_meeting(x,y+1,Obj_solid)){
						warning.x = -100;
						vsp += 40;
					}else{
						vsp = 0;
						with(instance_create_layer((x-sprite_width/2),y,"Shockwave",Obj_shockwave)){
							image_xscale *= -1;
							dir = -1;
						}
						var waveright = instance_create_layer((x+sprite_width),y,"Shockwave",Obj_shockwave);
						wait2 = true;
						Boss_state = "wait";
						pre_boss_state = "dash/clone";
						dash = false;
						stomp2_timer = 2*60;
					}
				}	
			}

		#endregion
	}
	break;
	case"hit":
	//this makes the boss get pushed back and not be able to get hit again until the next wait state. 

		#region the functions of the hit state
		if(_health = lowered_health){
			Boss_state = "scream";	
		}
		if(wait == false){
			var height = 12;
			var left_angle = 35;
			var right_angle = 145;
			if (Obj_player.x<x){
				hsp += lengthdir_x(height,left_angle);
				vsp += lengthdir_y(height,left_angle);
				
			}else{
				hsp += lengthdir_x(height,right_angle);
				vsp += lengthdir_y(height,right_angle);
				
			}
			if(place_meeting(x,y+1,Obj_solid)){
				wait = true;	
			}
		}else{
			hit_timer--;
		}
		if(hit_timer <=0){
			if(_health > 0){
				switch(pre_boss_state){
					case "":
						Boss_state = choose("dash/clone","jump","spit");
					break;
					case "jump":
						Boss_state = choose("dash/clone","spit");
					break;
					case "spit":
						Boss_state = choose("dash/clone","jump");
					break;
					case "dash/clone":
						Boss_state = choose("jump","spit");
					break;
				}
			
				hit_timer = 2*60;
				wait = false;
			}else if(_health = lowered_health){
				Boss_state = "scream";
			}else{
				Boss_state = "ded";			
			}
		}
		#endregion
	break;
	case "scream":

		if(point_direction(x,y,Obj_player.x,Obj_player.y-4) >= 90){
			dir = 1;
		}else{
			dir = -1;	
		}
		scream_timer--;
		var max_hsp = 4;
		if(scream_timer <= 0){
			if(x<160){
				hsp += 1;
				hsp = clamp(hsp,-max_hsp,max_hsp);
			}else if(x>511){
				hsp -= 1;
				hsp = clamp(hsp,-max_hsp,max_hsp);
			}else{
				sprite_index = Spr_boss1_scream_o;	
				hsp = 0;
				if(image_index >= 7 && image_index <= 12){
					global.camShake = 5;	
				}
				if(image_index > 17){
					sprite_index = Spr_boss1_idle;
					Boss_state = "dash/clone";
				}
			}
		}
	break;
	case"ded":
	//the boss has no health, probably does an animation, and transitions to a cutscene.
		#region the part of the death state
		with(Obj_player){
			if(hascontrol){
				hascontrol = false;
				SlideTransition(TRANS_MODE.NEXT);
			}
		}
		#endregion
	break;
}
#region other things that are part of the boss and not lock in states
	//gravity 
	if (vsp < 5) vsp += global.grv;
	#region collisions
	//horizontal collisions
	if (place_meeting(x+hsp,y,Obj_solid)){
		while (abs(hsp) > 0.1){
			hsp *= 0.5;
			if(!place_meeting(x+hsp,y,Obj_solid)) x += hsp
		}
		hsp = 0;
		
	}
	//vertical collision
	if(place_meeting(x,y+vsp,Obj_solid)){
		while (abs(vsp) > 0.1){
			vsp *= 0.5;
			if(!place_meeting(x,y+vsp,Obj_solid)) y += vsp
		}
		vsp = 0;
	}
	#endregion
	
	if(last_sprite != sprite_index){
		image_index = 0;
		last_sprite = sprite_index;
		//for some reason, this makes the falling animation glitch a lil. fix it please :}
	}

	image_xscale = dir;
	x += hsp;
	y += vsp;
#endregion