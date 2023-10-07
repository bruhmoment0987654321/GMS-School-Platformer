if(state == statedash) && (other.Boss_state == "wait"){
	with(other){
		_health -= 1;
		Boss_state = "hit";
		global.camShake = 2.5;
	}
}else if(invincibility == false)&&(other.Boss_state != "hit"){
	invincibility = true;
	global.camShake = 2;
	global.HP -= 1;
}