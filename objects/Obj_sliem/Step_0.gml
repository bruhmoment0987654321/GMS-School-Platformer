//changing direction when on a path
if(direction == 90){
	image_angle = 0;
}

if(direction == 180){
	image_angle = 90;
}

if(direction == 0){
	image_angle = -90;
}

//states
switch(state){
	case "MOVING":
		sprite_index = Spr_sliem;
		choose_now = irandom_range(0,1);
		wait_timer--;
		
		//choosing the state the enemy is in
		if(wait_timer < 0){
			if(choose_now < 3){
			
				if(choose_now = 0) state = "EXTEND";
		
				if(choose_now = 1) state = "SPIT";
			}else{
				wait_timer = room_speed*2;
			}
		}
		
	break;
	
	case "EXTEND":
		sprite_index = Spr_sliem_spike
		attack_timer--;
		
		if(attack_timer < 0) && (image_index >= 10){
			state = "MOVING";
			attack_timer = room_speed*2;
			wait_timer = room_speed*2;
		}
	break;
	
	case "SPIT":
		attack_timer--;
		
		if(attack_timer < 0){
			state = "MOVING"	
			attack_timer = room_speed*2;
			wait_timer = room_speed*2;
		}
	
	break;

}