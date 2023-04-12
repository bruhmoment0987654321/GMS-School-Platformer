if(isenabled){
	isenabled = false;
	global.checkpointx = x;
	global.checkpointy = y;
	if(instance_exists(Obj_autoscroll)) && (instance_exists(Obj_sliem)) && (instance_exists(Obj_sliem2)){
		global.checkpointcampos = Obj_autoscroll.path_position;
		global.checkpointslimpos1 = Obj_sliem.path_position;
		global.checkpointslimpos2 = Obj_sliem2.path_position;
	}
	instance_change(Obj_checkpoint_t,true);
}
