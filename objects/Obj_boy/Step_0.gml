event_inherited();
#region changing player in control room 
if(room = Rm_ctrls){
	if(keyboard_check_pressed(ord("T"))){
		instance_change(Obj_slime,true);
	}
}
#endregion
#region enemies
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
			global.HP -= 1;
		}
	}
}
#endregion
#region animations
if (!place_meeting(x,y+1,Obj_solid)){
	sprite_index = Spr_schoolboyjump;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1;	else image_index = 0; 
}else{
	image_speed = 1;
	if (hsp == 0){
		sprite_index = Spr_schoolboy;
	 }else{
		 sprite_index = Spr_schoolboyrun;
		 
	 }
}
if (hsp != 0) image_xscale = sign(hsp);
#endregion

