restart = keyboard_check_pressed(vk_enter);
shakex = random_range(540,560);
shakey = random_range(590,610);
//death
if (Obj_playerparent.slime_splat = 1){
	instance_create_layer(Obj_cam.xTo,Obj_cam.yTo,"Behind",Obj_death);
	Obj_playerparent.slime_splat = 2;
}
if(timer <= 0){
	Obj_health.x -= 1.5;
	Obj_health.y -= 1.5;
}

//trying again
if(try_again = true){
	if(restart){
		room_restart();
	}
}