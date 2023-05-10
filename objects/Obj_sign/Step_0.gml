if(keyboard_check_pressed(global.keyUp)){
	if(point_in_circle(Obj_player.x,Obj_player.y,x,y,64)) && (!instance_exists(Obj_text)){
		var inst = instance_create_layer(x,y-16,"Behind",Obj_text);
		with(inst){
			other.sprite_index = Spr_sign_talk;
			text = other.Text;	
			bborderoffset = other.bottom_borderoffset;
			boxoffset = other.boxoffset;
			length = string_length(text);
		}
		
	}
}


