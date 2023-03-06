global.HP -= 1;
if(global.HP != 0){
	if(instance_exists(Obj_checkpoint)){
		var near = instance_nearest(other.x,other.y,Obj_checkpoint);
		other.x = near.x;
		other.y = near.y;
	}else{
		other.x = Obj_start.x;
		other.y = Obj_start.y;
	}
}