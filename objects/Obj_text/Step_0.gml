/// @description progressing the text
letters += spd;
text_current = string_copy(text,1,floor(letters));
h = string_length(text);
w = string_width(text_current);

//destroy when done
if(letters >= length) && (keyboard_check_pressed(vk_anykey)){
	instance_destroy();
}

var cam = view_camera[0];
var x1 = camera_get_view_x(cam);
var y1 = camera_get_view_y(cam);
var x2 = x1 + camera_get_view_width(cam);
var y2 = y1 + camera_get_view_height(cam);
if(!point_in_rectangle( x, y, x1, y1, x2, y2)){
    instance_destroy();
}