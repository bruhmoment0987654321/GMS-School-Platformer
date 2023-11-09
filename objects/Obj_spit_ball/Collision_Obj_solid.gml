speed = 0;
gravity = 0;
sprite_index = Spr_spit_puddle;	
if(y < 600){
	if(x < 66){
		image_angle = -90;	
	}else if(x > 631){
		image_angle = 90;	
	}
}else{
	image_angle = 0; 	
}