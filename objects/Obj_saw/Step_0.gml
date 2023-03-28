event_inherited();

if(distance_to_object(Obj_player) < 40){
	sprite_index = Spr_saw_spin;	
}else{
	sprite_index = Spr_saw_idle;
}