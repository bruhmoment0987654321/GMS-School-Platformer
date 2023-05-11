//horizontal speed variables 
hsp = 0; //current horizontal speed
max_hsp = 3; //the max horizontal speed you go
walksp = 0.7; //how fast the player goes
walk_multiplier = 1; //its a normal walking speed when walking
run_multiplier = 1.6; //this multiplies the amount you walk while you're running
running = false; // checks if you're running at all or holding the run button

//friction
friction_ = 0.2; //this slows you down if you're not moving
//vertical speed variables
vsp = 0; //current vertical speed
vsp_max = 9; //max speed when falling
vspjump = -6.5; //how high the player jumps
grace_timer = 10; //can we jump?
grace_jump_time = grace_timer;
jump_buffer = 10; //number of grace period frames between player pressing jump and hitting the ground when they will still jump
jump_buffer_timer = jump_buffer;
global.grv = 0.3; //gravity

//dash variables
candash = false; //resets when touching ground
dashdistance = 82; // how far the dash goes
dashtime = 10; // the amount of time the dash is used
dashlimit = 2; // the limit of dash presses

//shoot variables
shoot_meter = 100;

//health & other variables
global.HP = 1; //how much health the player has
tears = 0; //crying particles
invincibility = false; //if you got hit or not and gives you iframes
invincible_timer = room_speed*1.5; //how long the iframes last
blinktimer = invincible_timer; //the player flashes white when hit
slime_splat = 0; //used when you die and game over screen
xscale = 1; //for gummy effect
yscale = 1; //for gummy effect
hascontrol = true; //giving the player control or not
imageblend = c_white; //controling the color of the player

stateFree = function(){
	
	if(hascontrol){
		#region walking
		if(run){
			running = true;	
		}else{
			running = false;	
		}
		//horizontal movement
		var move = right - left;
		if (move !=0){
			var multiplier = walk_multiplier;
			if(run) && (place_meeting(x,y+1,Obj_solid)) || (place_meeting(x,y+1,Obj_moveplath)){
				multiplier = run_multiplier;
			}
			move *= multiplier;
			hsp += move*walksp;
			max_hsp = 3;
			
			
			hsp = clamp(hsp,-(max_hsp*multiplier),(max_hsp*multiplier));
		}else{
			if(image_xscale = 1){
				if(hsp < 0.1){
					hsp = 0;	
				}
			}
			if(image_xscale = -1){
				if(hsp > -0.1){
					hsp = 0;	
				}
			}
			hsp = lerp(hsp,0,friction_);
		}
	
		vsp += global.grv;
		vsp = clamp(vsp,-vsp_max,vsp_max);
		#endregion
	
		//jump
		#region Jump Input Buffering
		if (place_meeting(x,y+1,Obj_solid)) || (place_meeting(x,y+1,Obj_moveplath)){
		    is_on_ground = true;
		    grace_timer = grace_jump_time;
		}else{
		    is_on_ground = false;
		    grace_timer--;
		}
		if (jump){
			jump_buffer_timer = jump_buffer;
		}

		if (jump_buffer_timer > 0){
			jump_is_inside_buffer = true;
		}else{
			jump_is_inside_buffer = false;
		}
		if (jump_buffer = 0){
			jump_is_inside_buffer = jump;
		}
		if(jump_is_inside_buffer){
			if (is_on_ground || grace_timer >0){
			        vsp = vspjump;
			        grace_timer = 0;
			        jump_buffer_timer = 0;
			    }
			    jump_buffer_timer--;
			}
		#endregion
	
		if(!jump_held){
			vsp = max(vsp,(vspjump/3));
		}
		#region shoot inputs
		if(object_index != Obj_slime){
			if(shoot){
				
			}
		}
		#endregion
		#region dash input
		if(object_index != Obj_boy){
			if(dash) && (dashlimit > 0){
					global.camShake = 1.5;
					candash = false;
					grace_timer = 0;
					if(move != 0){
						dashdirection = point_direction(0,0, right-left,down-up);
					}else if(up||down){
						dashdirection = point_direction(0,0,0,down-up);	
					}else{
						dashdirection = point_direction(0,0,sign(image_xscale),0);		
					}
					dashdistance = 82;
					dashsp = dashdistance/dashtime;
					dashenergy = dashdistance;
					state = statedash;
			}
		}
		#endregion
	}else{
		left = 0;
		right = 0;
		jump = 0;
		dash = 0;
	}
	
	#region collisions
	//horizontal collision
	if (place_meeting(x+hsp,y,Obj_solid)){
		while (abs(hsp) > 0.1){
			hsp *= 0.5;
			if(!place_meeting(x+hsp,y,Obj_solid)) x += hsp
		}
		hsp = 0;
	}

	//vertical collision
	if (place_meeting(x,y+vsp,Obj_solid)){
		if(vsp>0) dashlimit = 2; candash = true;
		while (abs(vsp) > 0.1){
			vsp *= 0.5;
			if(!place_meeting(x,y+vsp,Obj_solid)) y += vsp
		}
		vsp = 0;
	}
	
	#region getting unstuck on that dang solid blocks
			if(place_meeting(x,y,Obj_solid)){
				for(var i = 0; i < 1000; ++i){
					//right
					if(!place_meeting(x+i,y,Obj_solid)){
						x += i;
						break;
					}
					//left
					if(!place_meeting(x-i,y,Obj_solid)){
						x -= i;
						break;
					}
					//up 
					if(!place_meeting(x,y-i,Obj_solid)){
						y -= i;
						break;
					}
					//down
					if(!place_meeting(x,y+i,Obj_solid)){
						y += i;
						break;
					}					
					//top left
					if(!place_meeting(x+i,y-i,Obj_solid)){
						x += i;
						y -= i;
					}
					//top right
					if(!place_meeting(x-i,y-i,Obj_solid)){
						x -= i;
						y -= i;
					}
					//bottom left
					if(!place_meeting(x+i,y+i,Obj_solid)){
						x += i;
						y += i;
					}
					//bottom right
					if(!place_meeting(x-i,y+i,Obj_solid)){
						x -= i;
						y += i;
					}
				}
			
			}
		#endregion 
	
	x += hsp; 
	y += vsp;
	#endregion
	
	
	

}
statedash = function(){
	#region dashing
		if(hascontrol){
			//move via the dash
			hsp = lengthdir_x(dashsp,dashdirection);
			vsp = lengthdir_y(dashsp,dashdirection);
	
			//trail effect
			with (instance_create_depth(x,y,depth+1,Obj_trail)){
				sprite_index = other.sprite_index;
				image_blend = #09E444;
				image_alpha = 0.9;
			}
		}
	#endregion
	#region collisions
		//horizontal collision 
		if (place_meeting(x+hsp,y,Obj_solid)){
			while(abs(hsp) > 0.1){
				hsp *= 0.5;
				if(!place_meeting(x+hsp,y,Obj_solid)) x +=hsp;
			}
			hsp = 0;
			
		}
		
		
		//vertical collision
		if (place_meeting(x,y+vsp,Obj_solid)){
			while (abs(vsp) > 0.1){
				vsp *= 0.5;
				if(!place_meeting(x,y+vsp,Obj_solid)) y += vsp
			}
			vsp = 0;
			
		}
		
		#region getting unstuck on that dang solid blocks
			if(place_meeting(x,y,Obj_solid)){
				for(var i = 0; i < 1000; ++i){
					//right
					if(!place_meeting(x+i,y,Obj_solid)){
						x += i;
						break;
					}
					//left
					if(!place_meeting(x-i,y,Obj_solid)){
						x -= i;
						break;
					}
					//up 
					if(!place_meeting(x,y-i,Obj_solid)){
						y -= i;
						break;
					}
					//down
					if(!place_meeting(x,y+i,Obj_solid)){
						y += i;
						break;
					}					
					//top left
					if(!place_meeting(x+i,y-i,Obj_solid)){
						x += i;
						y -= i;
					}
					//top right
					if(!place_meeting(x-i,y-i,Obj_solid)){
						x -= i;
						y -= i;
					}
					//bottom left
					if(!place_meeting(x+i,y+i,Obj_solid)){
						x += i;
						y += i;
					}
					//bottom right
					if(!place_meeting(x-i,y+i,Obj_solid)){
						x -= i;
						y += i;
					}
				}
			
			}
		#endregion 
		
		x += hsp; 
		y += vsp;
		

		#endregion
	#region ending the dash
		dashenergy -= dashsp;
		if (dashenergy <= 0){
			vsp = 0;
			hsp = 0;
			state = stateFree;
			dashlimit -= 1;
		}
		#region Jump Input Buffering
		if (place_meeting(x,y+1,Obj_solid)){
		    is_on_ground = true;
		    grace_timer = grace_jump_time;
		}else{
		    is_on_ground = false;
		    grace_timer--;
		}
		if (jump){
			jump_buffer_timer = jump_buffer;
		}

		if (jump_buffer_timer > 0){
			jump_is_inside_buffer = true;
		}else{
			jump_is_inside_buffer = false;
		}
		if (jump_buffer = 0){
			jump_is_inside_buffer = jump;
		}
		if(jump_is_inside_buffer){
			if (is_on_ground || grace_timer >0){
			        vsp = vspjump;
					state = stateFree;
			        grace_timer = 0;
			        jump_buffer_timer = 0;
				with (instance_create_depth(x,y,depth+1,Obj_trail)){
					sprite_index = other.sprite_index;
					image_blend = #09E444;
					image_alpha = 0.9;
				}
			    jump_buffer_timer--;
			}
		}
		#endregion
	#endregion
}
stateDead = function(){
	hsp = 0;
	vsp = 0;
	#region cause of splatter and other things after death
	if(slime_splat <= 0){
		image_alpha = 0;
		repeat(15){
			instance_create_layer(x,y,"Behind",Obj_slimesplatter);
		}
		global.death_total += 1;
		slime_splat = 1;
	}
	Obj_game.timer--;
	#endregion
	
}
	
stateShoot = function(){
		
}

state = stateFree;