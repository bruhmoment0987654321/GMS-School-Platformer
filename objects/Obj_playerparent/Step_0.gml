//controls
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
jump = keyboard_check_pressed(vk_space);
run = keyboard_check(vk_lshift)||keyboard_check(vk_rshift);
//calculate movement
if (states = state.normal){
	#region movement
	var move = right - left;
	if (!run){
		hsp = move*walksp;
	}else{
		hsp = move*(walksp+1);
	}

	//jump
	
	
	vsp = vsp + grv;

	if (place_meeting(x,y+1,Obj_wall)) && (jump){
		vsp = - 3.9;
	}

	//horizontal collision
	if (place_meeting(x+hsp,y,Obj_wall)){
		while(!place_meeting(x+sign(hsp),y,Obj_wall)){
			x += sign(hsp);
		}
		hsp = 0;
	}

	//vertical collision
	if (place_meeting(x,y+vsp,Obj_wall)){
		while(!place_meeting(x,y+sign(vsp),Obj_wall)){
			y += sign(vsp);
		}
		vsp = 0;
	}
	#endregion
}

if(states = state.freeze){
	hsp = 0;
	vsp = 0;
	vsp = vsp + grv;
	//vertical collision
	if (place_meeting(x,y+vsp,Obj_wall)){
		while(!place_meeting(x,y+sign(vsp),Obj_wall)){
			y += sign(vsp);
		}
		vsp = 0;
	}
}
x += hsp; 
y += vsp;