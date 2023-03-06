if (follow != noone){
	xTo = follow.x;
	yTo = follow.y;
}

xcam = clamp(xTo - global.camW/2,0,room_width-global.camW);
ycam = clamp(yTo - global.camH/2,0,room_height-global.camH);

global.curx = camera_get_view_x(view_camera[0]);
global.cury = camera_get_view_y(view_camera[0]);

newx = lerp(global.curx,xcam,0.1);
newy = lerp(global.cury,ycam,0.1);

camera_set_view_pos(view_camera[0],newx,newy);

layer_x(layer_get_id("Background"),newx*0.65);
layer_y(layer_get_id("Background"),newy*0.65);