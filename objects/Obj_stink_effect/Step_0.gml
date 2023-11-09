y -= speed_;
image_alpha -= random_range(0.01,0.05);
if(image_alpha < 0){
	instance_destroy();	
}
image_xscale = randomscale + sin(timer * 0.03)*0.5;
timer ++;