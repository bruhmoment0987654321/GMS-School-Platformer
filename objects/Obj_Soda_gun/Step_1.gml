//its in the position of the player
x = Obj_player.x;
y = Obj_player.y-10;

//aiming the gun
image_angle = point_direction(x,y,mouse_x,mouse_y);
firing_delay--;
recoil = max(0,recoil-1);
//the shooting function itself
if(mouse_check_button_pressed(mb_left)) && (firing_delay <= 0) && (ammo > 0) && (shoot){
		global.camShake = 1;
		if(!jump_held){
			ammo -= 20;
		}else{
			ammo -= 99;	
		}
		firing_delay = 5;
		recoil = recoil_frames;
		with(Obj_player){
			launch(other.dis,other.image_angle);
		}
	
		with(instance_create_layer(x,y,"Bullets",Obj_bullet)){
			speed = 25;
			direction = other.image_angle + random_range(-3,3);
			image_angle = direction;
		}
}
//the recoil for the gun. It going back after shooting 
x -= lengthdir_x(recoil,image_angle);
y -= lengthdir_y(recoil,image_angle);


if(image_angle > 90) && (image_angle < 270){
	image_yscale = -1;	
}else{
	image_yscale = -1;	
}