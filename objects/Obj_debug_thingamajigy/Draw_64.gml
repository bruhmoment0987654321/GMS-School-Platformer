draw_set_color(c_white);
//player pos
draw_text(500,33,"x:" + string(Obj_player.x));
draw_text(800,33,"y:" + string(Obj_player.y));

//camera pos
if(instance_exists(Obj_cam)){
	draw_text(300,80,"Cam x:" + string(global.curx));
	draw_text(900,80,"Cam y:" + string(global.cury));
}
draw_set_color(c_white);
draw_text(200,33,string(Obj_player.vsp));
