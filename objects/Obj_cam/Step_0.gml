if (follow != noone){
	xTo = follow.x;
	yTo = follow.y;
}


xcam = clamp(xTo - global.camW/2,0,room_width-global.camW) + x_offset;
ycam = clamp(yTo - global.camH/2,0,room_height-global.camH) + y_offset;

global.curx = camera_get_view_x(view_camera[0]);
global.cury = camera_get_view_y(view_camera[0]);

newx = lerp(global.curx,xcam,lerp_speed);
newy = lerp(global.cury,ycam,lerp_speed);

camera_set_view_pos(view_camera[0],newx,newy);
layer_x(layer_get_id("Background"),newx*0.65);
layer_y(layer_get_id("Background"),newy*0.65);