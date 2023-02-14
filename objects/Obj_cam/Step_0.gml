if (follow != noone){
	xTo = follow.x;
	yTo = follow.y;
}

global.xcam = clamp(xTo - camW/2,0,room_width-camW);
global.ycam = clamp(yTo - camH/2,0,room_height-camH);

curx = camera_get_view_x(view_camera[0]);
cury = camera_get_view_y(view_camera[0]);

newx = lerp(curx,global.xcam,0.1);
newy = lerp(cury,global.ycam,0.1);

camera_set_view_pos(view_camera[0],newx,newy);

layer_x(layer_get_id("Background"),newx*0.65);
layer_y(layer_get_id("Background"),newy*0.65);