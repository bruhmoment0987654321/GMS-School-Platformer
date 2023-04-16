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

