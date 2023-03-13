// Inherit the parent event
event_inherited();
//enemy collision
#region big man
if (place_meeting(x,y,Obj_bigman)){
	var _enemy = instance_place(x,y,Obj_bigman);
	if (y < _enemy.bbox_top +10) && (_enemy._state != "STOMPED"){ //if touched on top?
		candash = true;
		vsp = vspjump;
		with(_enemy){
			_state = "STOMPED";
			alarm[0] = room_speed/2;
		}
	}else{ //if touched anywhere :L?
		if (state == statedash){
			with(_enemy){
				_state = "DASHED";
				alarm[0] = room_speed/3;
			}
			}else if(invincibility == false){
				invincibility = true;
				global.HP -= 1;
		}
	}
}
#endregion
#region bat
if (place_meeting(x,y,Obj_bat)){
	var _enemy1 = instance_place(x,y,Obj_bat)
	if (y < _enemy1.bbox_top+10) && (_enemy1._state != "STOMPED"){ //if touched on top?
		with(_enemy1){
			_state = "STOMPED";
			alarm[0] = room_speed/2;
		}
		vsp = vspjump
		candash = true;
	}else{ //if touched anywhere :L?
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
}
#endregion
#region animations
if (!place_meeting(x,y+1,Obj_solid)){
	image_speed = 0;
	if(onawall != 0) && (left||right){
		sprite_index = Spr_slime_wall_hang;
	}else{
	if (dashtime > 0) && (dashshoot){
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
}

}else{
	image_speed = 1;
	if (hsp == 0){
		sprite_index = Spr_slimeidle;	
	 }else{
		 sprite_index = Spr_slimewalk;
		 
	 }
}

if (hsp != 0) image_xscale = sign(hsp);
#endregion





