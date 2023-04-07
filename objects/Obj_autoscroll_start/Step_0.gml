timer--;
if(timer = 0){
	instance_create_layer(x,y,"Behind",Obj_autoscroll);
	Obj_cam.follow = Obj_autoscroll;
}