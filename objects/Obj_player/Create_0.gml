//horizontal speed variables 
hsp = 0; //current horizontal speed
max_hsp = 3; //the max horizontal speed you go
walksp = 0.7; //how fast the player goes

//friction
friction_ = 0.2; //this slows you down if you're not moving

//on the ground
onground = false; //are we on the ground?

//vertical speed variables
vsp = 0; //current vertical speed
vsp_max = 9; //max speed when falling
vspjump = -6.5; //how high the player jumps
jumpbuffer = 0; //checks if you pressed the jump button before touching the ground
jumpbuffertime = 15; //the amount of buffer;
canjump = 0; //can we jump?
global.grv = 0.3; //gravity

//dash variables
candash = false; //resets when touching ground
dashdistance = 82; // how far the dash goes
dashtime = 10; // the amount of time the dash is used
dashlimit = 2; // the limit of dash presses

//shoot variables
global.ammo = 0; //how much ammo the boy has
shootdelay = 0; // the cooldown of shooting the balls
shootdelaymax = 7; // the amount for the cooldown

//health & other variables
global.HP = 1; //how much health the player has
if(object_index = Obj_boy){
	global.HP = 2;	
}
HP_max_boy = 2; //max health of boy
tears = 0; //crying particles
invincibility = false; //if you got hit or not and gives you iframes
invincible_timer = room_speed*1.5; //how long the iframes last
blinktimer = invincible_timer; //the player flashes white when hit
slime_splat = 0; //used when you die and game over screen
xscale = 1; //for gummy effect
yscale = 1; //for gummy effect
hascontrol = true; //giving the player control or not
imageblend = c_white; //controling the color of the player

#region the normal, free state
stateFree = function(){
	shootdelay = max(shootdelay - 1,0);
	#region movement
	if(hascontrol){
		//horizontal movement
		var move = right - left;
		if (move !=0){
			hsp += move*(onground ? walksp*2 : walksp);
			max_hsp = 3;
			hsp = clamp(hsp,-max_hsp,max_hsp);
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
	
		//jump
		if (canjump -- > 0) && (jump){
			jumpbuffer = jumpbuffertime;
			canjump = 0;
		}
	
		if(jumpbuffer > 0){
			jumpbuffer -= 1;	
			if(place_meeting(x,y+1,Obj_solid)){
				vsp = vspjump;
				jumpbuffer = 0;
			}
		}
	
		if(!jump_held){
			vsp = max(vsp,vspjump/3);
		}
		//shoot inputs
		if(object_index != Obj_slime){
			if(place_meeting(x,y,Obj_paper)){
					global.ammo += 1;
			}
		}
	
		if(global.ammo > 0){
			if(shootdelay == 0){
				if(shoot){
					instance_create_layer(x,y,"Player",Obj_paperball);
					shootdelay = shootdelaymax;
				}
			}
		}
	
		//dash input
		if(object_index != Obj_boy){
			if (inputs) && (dash) && (dashlimit > 0){
				global.camShake = 1.5;
				candash = false;
				canjump = 0;
				dashdirection = point_direction(0,0, right-left,down-up);
				dashdistance = 82;
				dashsp = dashdistance/dashtime;
				dashenergy = dashdistance;
				state = statedash;
			}
		}
	}else{
		left = 0;
		right = 0;
		jump = 0;
		dash = 0;
	}
	#endregion
	#region collisions
	//horizontal collision
	if (place_meeting(x+hsp,y,Obj_solid)){
		while(abs(hsp) > 0.1){
			hsp *= 0.5;
			if(!place_meeting(x+hsp,y,Obj_solid)) x += hsp;
		}
		hsp = 0;
	}

	//vertical collision
	if (place_meeting(x,y+vsp,Obj_solid)){
		if(vsp>0){
			canjump = 10;
			dashlimit = 2;
			candash = true;
			jumpbuffer = 0;
		}
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
#endregion
#region the dashing state
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
		
		//ending the dash
		dashenergy -= dashsp;
		if (dashenergy <= 0){
			vsp = 0;
			hsp = 0;
			state = stateFree;
			dashlimit -= 1;
		}
		#endregion
}
#endregion
#region the dead state
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
#endregion
state = stateFree;