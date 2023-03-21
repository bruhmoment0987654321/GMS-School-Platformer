#region invincibility
if (invincibility = true){
	//crying 
	var side = x + irandom_range(1,3);
	invincible_timer --;	
	tears++;
	blinktimer --
	//making iframes visible
	if (blinktimer <= 0) blinktimer = invincible_timer;
	switch (image_blend){
		case c_white: image_blend = c_aqua;
		break;
		case c_aqua: image_blend = c_white;
		
	}
	if (tears > 2){
		with (instance_create_layer(side,y-3,"Behind",Obj_cry)){
			other.tears = 0;	
		}
	}
}

if (invincible_timer <= 0){ 
	invincibility = false; 
	invincible_timer = 60; 
}

if (invincibility == false){
	image_blend = c_white;
	blinktimer = invincible_timer;
}
#endregion




