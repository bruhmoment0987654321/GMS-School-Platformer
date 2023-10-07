if(frames < ghostFrames){
	if(frames == 0) image_alpha = 1;
	frameData = ghostData[| frames];
	x = frameData[? "x"];
	y = frameData[? "y"];
	image_index = frameData[? "image"];
	image_yscale = frameData[? "yscale"];
	image_xscale = frameData[? "xscale"];
	sprite_index = frameData[? "sprite_index"];
	frames++;
}else{
	image_alpha = max(image_alpha-0.0025,0);
	if(image_alpha == 0){
		frames = 0;	
	}
}

//shaking the screen when the sliem gets close
if(distance_to_object(Obj_player) < 100){
	global.camShake = 0.5;	
}
if(distance_to_object(Obj_player) < 50){
	global.camShake = 1;	
}
if(distance_to_object(Obj_player) < 25){
	global.camShake = 2;	
}
