if(state == statedash) && (other.Boss_state == "wait"){
	with(other){
		_health -= 1;
		if(_health < lowered_health){
			wait_time = 2*60;
		}else{
			wait_time = wait_time_amount;	
		}
		Boss_state = "hit";
		global.camShake = 3;
	}
}else if(invincibility == false)&&(other.Boss_state != "hit"){
	invincibility = true;
	global.camShake = 2;
	global.HP -= 1;
}