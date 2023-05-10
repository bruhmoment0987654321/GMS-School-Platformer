event_inherited();
#region changing player in control room 
if(room = Rm_ctrls){
	if(keyboard_check_pressed(ord("T"))){
		instance_change(Obj_slime,true);	
	}
}
#endregion
#region animations
xscale = approach(xscale,1,0.05);
yscale = approach(yscale,1,0.05);

if (!place_meeting(x,y+1,Obj_solid)){
	sprite_index = Spr_schoolboyjump;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1;	else image_index = 0; 
}else{
	image_speed = 1;
	if (hsp == 0){
		sprite_index = Spr_schoolboy;
	 }else{
		 sprite_index = Spr_schoolboyrun;
		 
	 }
}

	if(jump){
		Gummy(0.3,1.2);	
	}
	if(sprite_index == Spr_schoolboyjump) && (vsp > 0){
		Gummy(0.9,0.8);	
	}
	
if (hsp != 0) image_xscale = sign(hsp);
#endregion


