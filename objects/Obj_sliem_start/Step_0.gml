timer--;
if(timer = 0){
	instance_create_layer(x,y,"moving_plats",Obj_sliem);
	instance_create_layer(x,y,"moving_plats",Obj_sliem2);
}