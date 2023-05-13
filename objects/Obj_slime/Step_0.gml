// Inherit the parent event
event_inherited();
#region in the control room
if(room = Rm_ctrls){
	if(keyboard_check_pressed(ord("T"))){
		instance_change(Obj_boy,true);	
	}
}
#endregion

#region animations
xscale = approach(xscale,1,0.05);
yscale = approach(yscale,1,0.05);
#region basic animation
if (!place_meeting(x,y+1,Obj_solid)){
	image_speed = 0;
	sprite_index = Spr_slimejump;
	if (sign(vsp) > 0) image_index = 1;	else image_index = 0; 	

}else{
	image_speed = 1;
	if (hsp == 0){
		sprite_index = Spr_slimeidle;	
	 }else{
		 sprite_index = Spr_slimewalk;
		 
	 }
}
if(dashlimit == 0){
	imageblend = #FF8AFF
}else{
	imageblend = c_white;	
}

if(place_meeting(x+1,y,Obj_moveplath)){
	sprite_index = Spr_slime_wall_hang;	
	if(image_xscale = 1){
		image_xscale = 1;
	}else{
		image_xscale = 1;
	}
}

if(place_meeting(x-1,y,Obj_moveplath)){
	sprite_index = Spr_slime_wall_hang;	
	if(image_xscale = 1){
		image_xscale = -1;
	}else{
		image_xscale = -1;
	}
}
#endregion
	#region gummy effect
	//for jumping and falling
	if(jump) && (is_on_ground){
		Gummy(0.6,1.5);	
	}
	if(sprite_index == Spr_slimejump) && (vsp > 0){
		Gummy(1,0.7);	
	}

		//dashing
	if(dash) && (up) && (dashlimit > 0){
		Gummy(0.4,1.3);		
	}

	if(dash) && (down) && (dashlimit > 0){
		Gummy(1.7,0.3);		
	}
	#endregion
if (hsp != 0) image_xscale = sign(hsp);
#endregion






