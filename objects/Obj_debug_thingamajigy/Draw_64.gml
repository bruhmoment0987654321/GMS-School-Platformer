draw_set_color(c_white);
//player pos
draw_text(500,33,"x:" + string(Obj_player.x));
draw_text(800,33,"y:" + string(Obj_player.y));
draw_set_color(c_white);
draw_text_transformed(200,33,string(Obj_player.vsp),2,2,0);
if(instance_exists(Obj_boss1)){
	if(instance_exists(Obj_player)){
		draw_text(287, 487,abs(point_distance(Obj_boss1.x,Obj_boss1.y,Obj_player.x,Obj_player.y)));
	}
}


