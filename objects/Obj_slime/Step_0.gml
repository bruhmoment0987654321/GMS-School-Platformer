// Inherit the parent event
transform = keyboard_check_pressed(ord("T"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
dash = keyboard_check_pressed(vk_enter);
event_inherited();
//enemy collision
if (place_meeting(x,y,Obj_enemypar)){
	var _enemy = instance_place(x,y,Obj_enemypar)
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
				HP -= 1;
		}
	}
}
#region animations
if (!place_meeting(x,y+1,Obj_wall)){
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
		//transforming character
		if (transform) && (vsp == 0){
			instance_change(Obj_transfoman,true);
		}
	 }else{
		 sprite_index = Spr_slimewalk;
		 
	 }
}

if (hsp != 0) image_xscale = sign(hsp);
#endregion





