speed = 0;
gravity = 0;
if(y < 597){
	if(x < room_width/2){
		image_angle = -90;	
	}else{
		image_angle = 90;	
	}
}else{
	image_angle = 0; 	
}
sprite_index = Spr_spit_puddle;	
