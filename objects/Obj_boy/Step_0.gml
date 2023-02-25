// Inherit the parent event
transform = keyboard_check_pressed(ord("T"));

event_inherited();

if (place_meeting(x,y,Obj_enemypar)){
	var _enemy = instance_place(x,y,Obj_enemypar)
	if (_enemy.hp <= 0) && (_enemy._state != "DEATH"){ //if hp = 0?
		with(_enemy){
			_state = "DEATH";
			alarm[0] = room_speed/2;
		}
	}else{ //if touched anywhere :L?
		if(invincibility == false){
			invincibility = true;
			HP -= 1;
		}
	}
}
//animations
if (!place_meeting(x,y+1,Obj_wall)){
	if (onawall != 0){
		sprite_index = Spr_schoolboywj;
		image_xscale = onawall;
		
		var side = bbox_left;
		if(onawall) side = bbox_right;
		slimeprts++;
		if ((slimeprts > 2) && (vsp > 0)) with (instance_create_layer(side,bbox_top+15,"Behind",Obj_slimespark)){
			other.slimeprts = 0;	
			hspeed = -other.onawall*0.5;
		}
		
	}else{
		slimeprts = 0;
		sprite_index = Spr_schoolboyjump;
		image_speed = 0;
		if (sign(vsp) > 0) image_index = 1;	else image_index = 0; 
	}
}else{
	image_speed = 1;
	if (hsp == 0){
		sprite_index = Spr_schoolboy;	
		if (transform) && (vsp == 0){
			instance_change(Obj_transfoslime,true);
	}
	 }else{
		 sprite_index = Spr_schoolboyrun;
		 
	 }
}

if (hsp != 0) image_xscale = sign(hsp);
