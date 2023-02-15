hsp = 0; //current horizontal speed
vsp = 0;//current vertical speed
grv = 0.2; //gravity
walksp = 2.5; //how fast the player goes
vspjump = -3.9; //how high the player jumps
canjump = 0; //are we touching the ground?
candash = false; //resets when touching ground
dashdistance = 80;
dashtime = 12;


stateFree = function(){
	#region movement
	var move = right - left;
	if (!run){
		hsp = move*walksp;
	}else{
		hsp = move*(walksp+1);
	}

	//jump
	vsp = vsp + grv;

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
	//move via the dash 
	hsp = lengthdir_x(dashsp,dashdirection);
	vsp = lengthdir_y(dashsp,dashdirection);
	
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
}
	
state = stateFree;