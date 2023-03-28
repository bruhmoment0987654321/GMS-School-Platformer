//moving eye
var center_x = start_x - distance_from_center;
var center_y = start_y;

var current_angle = point_direction(center_x,center_y,x,y);
var _angle = current_angle + rotationspeed * rotationdirection;

x = center_x + lengthdir_x(distance_from_center,_angle);
y = center_y + lengthdir_y(distance_from_center,_angle);

//lo0king
image_index = point_direction(x, y, Obj_player.x, Obj_player.y)/45;





