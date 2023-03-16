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
	case Rm_level1ground:
	case Rm_level2ground:
		if(timer <= 0){
			if(!instance_exists(Obj_checkpoint)){
				room_restart();
			}else{
				var _near = instance_nearest(Obj_playerparent.x,Obj_playerparent.y,Obj_checkpoint);
				global.HP = 1;
				Obj_playerparent.image_alpha = 1;
				Obj_playerparent.state = Obj_playerparent.stateFree;
				Obj_playerparent.x = _near.x;
				Obj_playerparent.y = _near.y;
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
		
		if(instance_exists(Obj_slime)){	
			controls = @"Default Controls for slime:

			W & D: Left and Right

			Shift (either one): Run

			WASD + Enter: Dash";
		}else if(instance_exists(Obj_boy)){
			controls = @"Default controls for boy:
		
			W & D: Left and Right
		
			Shift (either one): Run 
		
			Enter: Shoot";	
		}

	
	break;
}