image_xscale = scale;
image_yscale = scale;
if(scale <= 1){
	scale += scale_speed;	
}else{
	hsp -= speed_*dir;
	timer--;
}
if(timer <= 0){
	instance_destroy();	
}

x += hsp;

//tets all this out. Ok? ok.