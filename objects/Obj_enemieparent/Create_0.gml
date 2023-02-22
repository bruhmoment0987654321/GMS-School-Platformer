//horizontal speed variables 
hsp = 0; //current horizontal speed
walksp = 2.5; //how fast the player goes

//vertical speed variables
vsp = 0; //current vertical speed
vsp_max = 10; //max speed when falling
vspjump = -3.9; //how high the player jumps

stateFree = function(){
	//checking if dead
	if (hp <= 0){
		state = stateDead;	
	}
	#region movement
		//horizontal movement

		//gravity
		vsp += global.grv;
		vsp = clamp(vsp,-vsp_max,vsp_max);
	
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
	#endregion
}
stateDead = function(){
	instance_create_layer(x,y,"Behind",Obj_pop);
	instance_destroy();
}
	
state = stateFree;