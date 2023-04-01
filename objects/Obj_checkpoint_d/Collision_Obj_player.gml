if(isenabled){
	isenabled = false;
	global.checkpointx = x;
	global.checkpointy = y;
	instance_change(Obj_checkpoint_t,true);
}
