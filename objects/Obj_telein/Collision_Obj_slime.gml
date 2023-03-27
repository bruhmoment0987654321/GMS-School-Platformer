switch(room){
	case Rm_level1ground:
		if (instance_exists(Obj_teleout)){
			other.x = Obj_teleout.x -10
			other.y = Obj_teleout.y +5
		}
	break;
	
	case Rm_level2ground:
	if (instance_exists(Obj_teleout)){
		other.x = Obj_teleout.x -10
		other.y = Obj_teleout.y +5
	}
	break;
	
	
}
