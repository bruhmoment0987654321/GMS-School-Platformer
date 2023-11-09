if(sprite_index = Spr_spit_puddle){
	timer--;
	stink_timer--;
	if(stink_timer <= 0){
		with (instance_create_layer(x+random_range(-5,5),y+1,"Behind",Obj_stink_effect)){
			image_blend = #006631;	
		}
		stink_timer = 10;
	}
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