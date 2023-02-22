//invincibility
if (invincibility = true){
	invincible_timer --;	
	
	blinktimer --
	//making iframes visible
	if (blinktimer <= 0) blinktimer = invincible_timer;
	
	switch (image_blend){
		case c_white: image_blend = c_lime;
		break;
		case c_lime: image_blend = c_white;
		
	}
}

if (invincible_timer <= 0){ 
	invincibility = false; 
	invincible_timer = 20; 
}

if (invincibility == false){
	image_blend = c_white;
	blinktimer = invincible_timer;
}


