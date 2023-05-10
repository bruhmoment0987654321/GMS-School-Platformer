if (follow != noone){
	xTo = follow.x;
	yTo = follow.y;
}

	xcam = clamp(xTo - global.camW/2,0,room_width-global.camW) + x_offset;
	ycam = clamp(yTo - global.camH/2,0,room_height-global.camH) + y_offset;

curx = camera_get_view_x(view_camera[0]);
cury = camera_get_view_y(view_camera[0]);


newx = lerp(curx,xcam,lerp_speed);
newy = lerp(cury,ycam,lerp_speed);

//cam shake
newx += random_range(-global.camShake,global.camShake);
newy += random_range(-global.camShake,global.camShake);

if(global.camShake > 0){
	global.camShake -= 0.2;
	if(global.camShake < 0) global.camShake = 0;
}
//cam pos
camera_set_view_pos(view_camera[0],newx,newy);

//parallax
layer_x(layer_get_id("Background"),newx*0.65);
layer_y(layer_get_id("Background"),newy*0.65);
