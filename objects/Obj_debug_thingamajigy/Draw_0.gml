//debugging

if (instance_exists(Obj_bigman)){
	draw_set_color(c_fuchsia);
	draw_line_width(Obj_bigman.bbox_left,Obj_bigman.y,Obj_bigman.bbox_right,Obj_bigman.y,1);
	draw_set_color(c_black);
	draw_circle(Obj_bigman.x,Obj_bigman.bbox_top,1,false);
}else{
	exit;	
}

