//its in the position of the player
x = Obj_player.x;
y = Obj_player.y-10;

image_angle = point_direction(x,y,mouse_x,mouse_y);

firing_delay--;
recoil = max(0,recoil-1);
if(mouse_check_button_pressed(mb_left)) && (firing_delay < 0){
	global.camShake = 1;	
	firing_delay = 5;
	recoil = recoil_frames;
	with(instance_create_layer(x,y,"Bullets",Obj_bullet)){
		speed = 25;
		direction = other.image_angle + random_range(-3,3);
		image_angle = direction;
	}
}

x -= lengthdir_x(recoil,image_angle);
y -= lengthdir_y(recoil,image_angle);

if(image_angle > 90) && (image_angle < 270){
	image_yscale = -1;	
}else{
	image_yscale = -1;	
}