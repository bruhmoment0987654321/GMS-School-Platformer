if(point_in_circle(Obj_player.x,Obj_player.y,x,y,64)) && (!instance_exists(Obj_text)){
	with(instance_create_layer(x,y-32,"Behind",Obj_text)){
		text = other.Text;	
		bborderoffset = other.borderoffset;
		boxoffset = other.boxoffset;
		length = string_length(text);
	}
}