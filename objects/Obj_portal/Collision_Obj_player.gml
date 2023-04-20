///@desc move to next room
with(other){
	if(hascontrol){
		hascontrol = false;
		SlideTransition(TRANS_MODE.GOTO,Rm_tutorial);
	}
	
}
instance_destroy();