///@desc SlideTransition(mode,room)

// _mode sets transtion mode between text, restart, & goto
// _target sets target room when using the goto mode

function SlideTransition(_mode,_target){
	with(Obj_transitions){
		mode = argument[0];
		if(argument_count > 1){
			target = argument[1];	
		}
		
	}
}