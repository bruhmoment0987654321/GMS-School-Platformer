// Inherit the parent event
event_inherited();

//when hit?
if (place_meeting(x,y-10,Obj_slime)){
	hp -= 1;	
}

if (place_meeting(x+(sign(Obj_slime.hsp)),y,Obj_slime)){
	if (Obj_slime.dashkill == true){
		sprite_index = Spr_bigmanhit;
		if(Obj_slime.hsp != 0) image_xscale = sign(Obj_slime.hsp)
}	
}

//animations
if (!place_meeting(x,y+1,Obj_wall)){
		slimeprts = 0;
		sprite_index = Spr_bIGmanjump;
		image_speed = 0;
		if (sign(vsp) > 0) image_index = 1;	else image_index = 0; 
}else{
	image_speed = 1;
	if (hsp == 0){
		sprite_index = Spr_bIGmanidle;	
	 }else{
		 sprite_index = Spr_bIGmanwalk;
		 
	 }
}

if (hsp != 0) image_xscale = sign(hsp);
