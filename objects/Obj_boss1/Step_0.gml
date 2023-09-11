switch(Boss_state){
	case"wait":
	//gives the player time to attack the foe. It will have different idle animations which will be random.
	#region functionality
		if(point_direction(x,y,Obj_player.x,Obj_player.y-4) >= 90){
			dir = 1;
		}else{
			dir = -1;	
		}
		wait_time -= 1;
		if(wait_time <= 0){
			Boss_state = choose("spit");
			if(_health <= 2){
				wait_time = wait_time_amount;
			}else{
				wait_time = 3*60;	
			}
			exposed = false;
		}
		exposed = true;
	#endregion
	break;
	case"jump":
	//goes up, beyond the screen, waits a bit, and goes back down close to the position of the player. 
		#region timers and such
		jump_time -= 1;
		if(jump_time <= 0){
			vsp -= 50;
			jump_time = 60;
		}
		if(y < -50){
			vsp = 0;
			wait = true;
		}
		if(wait = true){
			stomp_timer -= 1;
			switch(stomp_location){
				case 0:
					x = 110;
					warning.x = 112-16;
					warning.y = 576+16;
				break;
				case 1:
					x = 260;
					warning.x = 304-16;
					warning.y = 576+16;
				break;
				case 2:
					x = 460;
					warning.x = 496-16;
					warning.y = 576+16;
				break;
				case 3:
					x = Obj_player.x;
					warning.x = Obj_player.x;
					warning.y = 576+16;
				break;
			}
		}
		#endregion
		#region stomping function
			if(_health >= 3){
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
				warning.x = -100;
				if(!place_meeting(x,y-1,Obj_wall)){
					vsp += 40;
				}else{
					vsp = 0;	
				}
				wait = false;
				
				Boss_state = "wait";
				if(_health >= 3){
					stomp_timer = stomp_timer_amount;	
				}else{
					stomp_timer = 2*60;
				}
			}
		#endregion
	break;
	case"spit":
	/*waits a bit and creates an object that moves in an arch that goes towards the player.
		once the object lands, the object stops moving and changes its sprite. 
	*/
	if(x>232 && x<400){
		position = choose(0,1);	
	}else{
		position = 2;	
	}
	switch(position){
		case 0:
			if(x > 128){
				hsp -= 10;
				dir = 1;
			}else{
				hsp = 0;
				if(point_direction(x,y,Obj_player.x,Obj_player.y-4) >= 90){
					dir = 1;
				}else{
					dir = -1;	
				}
				spit_timer -= 1;
			}
		break;
		case 1:
			if(x < 512){
				hsp += 10;
				dir = -1;
			}else{
				if(point_direction(x,y,Obj_player.x,Obj_player.y-4) >= 90){
					dir = 1;
				}else{
					dir = -1;	
				}
				hsp = 0;
				spit_timer -= 1;
			}
		break;
		case 2:
			if(point_direction(x,y,Obj_player.x,Obj_player.y-4) >= 90){
				dir = 1;
			}else{
				dir = -1;	
			}
			spit_timer -= 1;
		break;
	}
	if(spit_timer <= 0){
		attack_time -= 1;
		//(the last place you left off. this is where you create the spit laser object. you need to create that and how it animates.)
		if(attack_time <= 0){
			if(_health <= 3){
				spit_time_amount = 3*60;
			}else{
				spit_time_amount = 1.5*60;
			}
			spit_timer = spit_time_amount;
			Boss_state = "wait";
		}
	}
	break;
	case"wall jump":
	/*probably the hardest thing. The boss climbs up the wall, waits a bit, then jumps downward, to the other wall.
	once it detects that it has reached the ground, then it stops the attack state and takes a break. 
	*/
	
	break;
	case"hit":
	//this makes the boss get pushed back and not be able to get hit again. 
	
	break;
	case"ded":
	
	break;
}
//gravity
if (vsp < 5) vsp += global.grv;

//collisions
//vertical collision
if (place_meeting(x,y+vsp,Obj_solid)){
	while (abs(vsp) > 0.1){
		vsp *= 0.5;
		if(!place_meeting(x,y+vsp,Obj_solid)) y += vsp
	}
	vsp = 0;
}

image_xscale = dir;

x += hsp;
y += vsp;