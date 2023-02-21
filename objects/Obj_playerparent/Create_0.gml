//horizontal speed variables 
hsp = 0; //current horizontal speed
walksp = 2.5; //how fast the player goes
hsp_wlljp = 3.5; //speed of how far you go in wall jump

//vertical speed variables
vsp = 0; //current vertical speed
vsp_wlljp = -4; //how high you go up during the wall jump
vsp_max = 10; //max speed when falling
vsp_max_wall = 4; //max speed when falling during wall jump
vspjump = -3.9; //how high the player jumps
canjump = 0; //are we touching the ground?

//gravity variables
grv = 0.2; //gravity
grv_wall = 0.01; //gravity when you're on a wall

//dash variables
candash = false; //resets when touching ground
dashdistance = 82; // how far the dash goes
dashtime = 10; // the amount of time the dash is used

//wall jump variables
onawall = 0; //are we touching a wall?
slimeprts = 0; //slime particles
walljumpdelay = 0; //removing movement to the player when wall jumping
wlljumpdelaymax = 18; //time of removing movement during the wall jump

//health variables
HP = 6; //how much health the player has
HP_max = 6; //the max amount of health the player can have


stateFree = function(){
	#region movement
	walljumpdelay = max(walljumpdelay - 1,0);
	if (walljumpdelay == 0){
		//horizontal movement
		var move = right - left;
		if (!run){
			hsp = move*walksp;
		}else{
			hsp = move*(walksp+1);
		}
	}
	//wall jump 
	if (object_index = Obj_boy){
		if(onawall != 0) && (!place_meeting(x,y+vsp,Obj_wall)) && (jump){
			walljumpdelay = wlljumpdelaymax;
			hsp = -onawall * hsp_wlljp;
			vsp = vsp_wlljp;
		}
		
	}
	//gravity
	var grv_final = grv;
	var vsp_max_final = vsp_max;
	if (onawall != 0) && (vsp > 0){
		grv_final = grv_wall;
		vsp_max_final = vsp_max_wall;
	}
	vsp += grv_final;
	vsp = clamp(vsp,-vsp_max_final,vsp_max_final);
	//jump
	if (canjump -- > 0)&& (jump){
		vsp = vspjump;
		canjump = 0;
	}
	
	//dash input
	if (inputs) && (candash) && (dash){
		candash = false;
		canjump = 0;
		dashdirection = point_direction(0,0, right-left,down-up);
		dashsp = dashdistance/dashtime;
		dashenergy = dashdistance;
		state = statedash;
	}

	//run animation
		if (run){
		image_speed = 2;	
	}
	//horizontal collision
	if (place_meeting(x+hsp,y,Obj_wall)){
		while(abs(hsp) > 0.1){
			hsp *= 0.5;
			if(!place_meeting(x+hsp,y,Obj_wall)) x +=hsp;
		}
		hsp = 0;
	}
	x += hsp; 

	//vertical collision
	if (place_meeting(x,y+vsp,Obj_wall)){
		if(vsp>0){
			candash = true;
			canjump = 7;
		}
		while (abs(vsp) > 0.1){
			vsp *= 0.5;
			if(!place_meeting(x,y+vsp,Obj_wall)) y += vsp
		}
		vsp = 0;
	}
	y += vsp;
	#endregion

}
	
statedash = function(){
	#region dashing
		//move via the dash 
		hsp = lengthdir_x(dashsp,dashdirection);
		vsp = lengthdir_y(dashsp,dashdirection);
	
		//trail effect
	
		with (instance_create_depth(x,y,depth+1,Obj_trail)){
			sprite_index = other.sprite_index;
			image_blend = #09E444;
			image_alpha = 0.9;
		}
	
		//horizontal collision
		if (place_meeting(x+hsp,y,Obj_wall)){
			while(abs(hsp) > 0.1){
				hsp *= 0.5;
				if(!place_meeting(x+hsp,y,Obj_wall)) x +=hsp;
			}
			hsp = 0;
		}
		x += hsp; 

		//vertical collision
		if (place_meeting(x,y+vsp,Obj_wall)){
			while (abs(vsp) > 0.1){
				vsp *= 0.5;
				if(!place_meeting(x,y+vsp,Obj_wall)) y += vsp
			}
			vsp = 0;
		}
		y += vsp;
	
		//ending the dash
		dashenergy -= dashsp;
		if (dashenergy <= 0){
			vsp = 0;
			hsp = 0;
			state = stateFree;
		}
	#endregion
}
	
state = stateFree;