if(isenabled){
	isenabled = false;
	global.checkpointx = x;
	global.checkpointy = y;
	if(instance_exists(Obj_autoscroll)){
		global.checkpointcampos = Obj_autoscroll.path_position;
		global.checkpointkillcampos = Obj_kill_line.path_position;
		global.checkpointslimeframes = Obj_sliem.frames;
	}
	instance_change(Obj_checkpoint_t,true);
}
