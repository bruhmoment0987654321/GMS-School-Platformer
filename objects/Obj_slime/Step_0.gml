// Inherit the parent event
event_inherited();
#region in the control room
if(room = Rm_ctrls){
	if(keyboard_check_pressed(ord("T"))){
		instance_change(Obj_boy,true);
	}
}
#endregion
//enemy collision
#region big man
if (place_meeting(x,y,Obj_bigman)){
	var _enemy = instance_place(x,y,Obj_bigman);
	if(state == statedash){
		with(_enemy){
			_state = "DASHED";
			alarm[0] = room_speed/3;
		}
		}else if(invincibility == false){
			invincibility = true;
			global.HP -= 1;
	}
}
#endregion
#region bat
if (place_meeting(x,y,Obj_bat)){
	var _enemy1 = instance_place(x,y,Obj_bat);
	if (state == statedash){
		with(_enemy1){
			_state = "DASHED";
			alarm[0] = room_speed/3;
		}
	}else if(invincibility == false){
		invincibility = true;
		global.HP -= 1;
	}
}
#endregion

#region animations
xscale = approach(xscale,1,0.05);
yscale = approach(yscale,1,0.05);
#region basic animation
if (!place_meeting(x,y+1,Obj_solid)){
	image_speed = 0;
	if (dashtime > 0) && (dash){
		if (left){
			sprite_index = Spr_dashsideleft;
		}
		
		if (right){
			sprite_index = Spr_dashside;	
		}
		if (up){
			sprite_index = Spr_dashsideup;
		}
		
		if (down){
			sprite_index = Spr_dashsidedown;	
		}
		if (left) && (up){
			sprite_index = Spr_dashcornerleftup;
		}
		
		if (left) && (down){
			sprite_index = Spr_dashcornerleftdown;
		}
		
		if (right) && (up){
			sprite_index = Spr_dashcorner;			
		}
		
		if (right) && (down){
			sprite_index = Spr_dashcornerrightdown;
		}
	}else{
		sprite_index = Spr_slimejump;
		if (sign(vsp) > 0) image_index = 1;	else image_index = 0; 	
}

}else{
	image_speed = 1;
	if (hsp == 0){
		sprite_index = Spr_slimeidle;	
	 }else{
		 sprite_index = Spr_slimewalk;
		 
	 }
}
#endregion
	#region gummy effect
	//for jumping and falling
	if(jump){
		Gummy(0.6,1.5);	
	}
	if(sprite_index == Spr_slimejump) && (vsp > 0){
		Gummy(1,0.7);	
	}

		//dashing
	if(dash) && (up){
		Gummy(0.4,1.3);		
	}

	if(dash) && (down){
		Gummy(1.7,0.3);		
	}
	#endregion

if (hsp != 0) image_xscale = sign(hsp);
#endregion






