timer--;
switch(room){
	case Rm_start:
	case Rm_test:
	case Rm_end:
	break;
	case Rm_level1:
	if (timer <= 0 && spawn < spawnMax){
		spawn++;
		instance_create_layer(x,y,"Enemies",Obj_batspawn);
		timer = time;
		
	}
	break;
}

