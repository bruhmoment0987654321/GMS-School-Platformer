restart = keyboard_check_pressed(vk_enter);
shakex = random_range(535,555);
shakey = random_range(585,605);
bye = keyboard_check_pressed(ord("L"));
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

if (bye){
	instance_create_layer(Obj_slime.x,Obj_slime.y-30,"Behind",Obj_bye)
	alarm[0] = room_speed;
}