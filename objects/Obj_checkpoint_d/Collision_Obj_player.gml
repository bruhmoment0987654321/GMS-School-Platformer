if(isenabled){
	isenabled = false;
	global.checkpointx = x;
	global.checkpointy = y;
	if(instance_exists(Obj_autoscroll)){
		global.checkpointcampos = Obj_autoscroll.path_position;
	}
	instance_change(Obj_checkpoint_t,true);
}
