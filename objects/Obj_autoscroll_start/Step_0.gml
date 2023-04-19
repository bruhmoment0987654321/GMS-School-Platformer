timer--;
if(timer = 0){
	instance_create_layer(x,y,"Behind",Obj_autoscroll);
	instance_create_layer(Obj_autoscroll.x-400,Obj_autoscroll.y+140,"Behind",Obj_kill_line);
	Obj_cam.follow = Obj_autoscroll;
}