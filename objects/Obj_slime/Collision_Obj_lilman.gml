if (state == statedash){
	with(other){
		_state = "DASHED";
		alarm[0] = room_speed/3;
		global.camShake = 2
	}
}else if(invincibility == false){
	invincibility = true;
	global.HP -= 1;
	global.camShake = 2;
}