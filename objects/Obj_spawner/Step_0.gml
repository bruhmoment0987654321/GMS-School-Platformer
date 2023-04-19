timer--;
switch(room){
	case Rm_level1ground:
	if (timer <= 0 && spawn < spawnMax){
		spawn++;
		instance_create_layer(x,y,"Enemies",Obj_batspawn);
		timer = time;
		
	}
	break;
}

