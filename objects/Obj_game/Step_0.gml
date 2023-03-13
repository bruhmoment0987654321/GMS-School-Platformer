bye = keyboard_check_pressed(ord("L"));

//stopping the watch
if(global.stopwatchstart = true){
	stopwatch += delta_time/1000000;
}

switch(room){
	case Rm_start:
	case Rm_test:
	case Rm_test_boy:
	break;
	case Rm_level1:
		if(timer <= 0){
			if(!instance_exists(Obj_checkpoint)){
				room_restart();
			}else{
				global.HP = 1;
				Obj_playerparent.image_alpha = 1;
				Obj_playerparent.state = Obj_playerparent.stateFree;
				Obj_playerparent.x = Obj_checkpoint.x;
				Obj_playerparent.y = Obj_checkpoint.y;
				Obj_playerparent.slime_splat = 0;
				timer = room_speed;
			}
		}
		global.stopwatchstart = true;
	break;
	case Rm_end:
		global.stopwatchstart = false;
			if (bye){
			instance_create_layer(Obj_slime.x,Obj_slime.y-30,"Behind",Obj_bye)
			alarm[0] = room_speed;
		}
		break;
	case Rm_ctrls:
		//go back to title screen
		if(keyboard_check_pressed(ord(1))){
			room = Rm_start;
		}
	
	break;
}