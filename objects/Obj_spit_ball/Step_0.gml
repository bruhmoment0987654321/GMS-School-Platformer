if(sprite_index = Spr_spit_puddle){
	timer--;	
}
if(timer <= 0){
	image_alpha -= 0.05;	
}

if(image_alpha <= 0){
	instance_destroy();	
}
if(place_meeting(x,y,Obj_player)) && (sprite_index != Spr_spit_puddle){
	instance_destroy();
}