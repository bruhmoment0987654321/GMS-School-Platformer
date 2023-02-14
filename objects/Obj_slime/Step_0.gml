// Inherit the parent event
event_inherited();
transform = keyboard_check_pressed(ord("T"));

//transforming character
if (transform){
	instance_change(Obj_transfoman,true);
}

//animations
if (run){
	image_speed = 2;	
}

if (!place_meeting(x,y+1,Obj_wall)){
	sprite_index = Spr_slimejump;
	image_speed = 0;
	
	if (sign(vsp) > 0) image_index = 1;	else image_index = 0; 
}else{
	
}





