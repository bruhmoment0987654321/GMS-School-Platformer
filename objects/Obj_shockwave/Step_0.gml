image_xscale = scale;
image_yscale = scale;
if(scale <= 1){
	scale += 0.1;	
}else{
	hsp -= 0.3*dir;
	timer--;
}
if(timer <= 0){
	instance_destroy();	
}

x += hsp;

//tets all this out. Ok? ok.