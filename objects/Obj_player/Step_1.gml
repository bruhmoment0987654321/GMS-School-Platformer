#region invincibility
if (invincibility = true){
	//crying 
	var side = x + irandom_range(1,3);
	invincible_timer --;	
	tears++;
	blinktimer --;
	//making iframes visible
	if (blinktimer <= 0) blinktimer = invincible_timer;
	switch (image_alpha){
		case c_white: image_blend = c_grey;
		break;
		case c_grey: image_blend = c_white;
		
	}
	if (tears > 2){
		with (instance_create_layer(side,y-3,"Behind",Obj_cry)){
			other.tears = 0;	
		}
	}
}

if (invincible_timer <= 0){ 
	invincibility = false; 
	invincible_timer = 2*60; 
}

if (invincibility == false){
	image_blend = c_white;
	blinktimer = invincible_timer;
}
#endregion

#region cause of death
if(killable == false){
	if(state != stateDead) && (global.HP <= 0){
		global.camShake = 4;
		state = stateDead;
		slime_splat = 0;
	}
}
#endregion



