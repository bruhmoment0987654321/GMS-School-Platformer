// Inherit the parent event
transform = keyboard_check_pressed(ord("T"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
dash = keyboard_check_pressed(vk_enter);
event_inherited();

//animations
if (!place_meeting(x,y+1,Obj_wall)){
	sprite_index = Spr_slimejump;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1;	else image_index = 0; 
}else{
	image_speed = 1;
	if (hsp == 0){
		sprite_index = Spr_slimeidle;	
		//transforming character
		if (transform) && (vsp == 0){
			instance_change(Obj_transfoman,true);
		}
	 }else{
		 sprite_index = Spr_slimewalk;
		 
	 }
}

if (hsp != 0) image_xscale = sign(hsp);





