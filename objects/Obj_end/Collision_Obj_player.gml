///@desc move to next room
with(Obj_player){
	if(hascontrol){
		hascontrol = false;
		SlideTransition(TRANS_MODE.GOTO,room_goto_next());
	}
	
}