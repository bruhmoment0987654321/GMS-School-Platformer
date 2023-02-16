// Inherit the parent event
transform = keyboard_check_pressed(ord("T"));

event_inherited();

//animations
if (!place_meeting(x,y+1,Obj_wall)){
	sprite_index = Spr_schoolboyjump;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1;	else image_index = 0; 
}else{
	image_speed = 1;
	if (hsp == 0){
		sprite_index = Spr_schoolboy;	
		if (transform) && (vsp == 0){
			instance_change(Obj_transfoslime,true);
	}
	 }else{
		 sprite_index = Spr_schoolboyrun;
		 
	 }
}

if (hsp != 0) image_xscale = sign(hsp);
