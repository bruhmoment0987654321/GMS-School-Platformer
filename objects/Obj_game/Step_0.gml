bye = keyboard_check_pressed(ord("L"));
switch(room){
	case Rm_start:
	case Rm_test:
	case Rm_test_boy:
	break;
	case Rm_level1ground:
	global.stopwatchstart = true;
	case Rm_level2ground:
		#region timer and teleporting to checkpoint
		if(timer <= 0){
			if(!instance_exists(Obj_checkpoint)){
				global.HP = 1;
				Obj_player.image_alpha = 1;
				Obj_player.state = Obj_player.stateFree;
				Obj_player.x = Obj_start.x;
				Obj_player.y = Obj_start.y;
				timer = room_speed;
			}else{
				global.HP = 1;
				Obj_player.image_alpha = 1;
				Obj_player.state = Obj_player.stateFree;
				Obj_player.x = global.checkpointx;
				Obj_player.y = global.checkpointy;
				timer = room_speed;
			}
		}
		#endregion
	break;
	case Rm_ground_chase:
		#region timer to restart level
		if(timer <= 0){
			if(!instance_exists(Obj_checkpoint)){
				global.HP = 1;
				Obj_player.image_alpha = 1;
				Obj_player.state = Obj_player.stateFree;
				Obj_player.x = Obj_start.x;
				Obj_player.y = Obj_start.y;
				if(instance_exists(Obj_autoscroll)) && (instance_exists(Obj_sliem)) && (instance_exists(Obj_sliem2)){
					Obj_autoscroll.path_position = 0;
					Obj_sliem.path_position = 0;
					Obj_sliem2.path_position = 0;
					Obj_cam.follow = Obj_autoscroll;
				}
				timer = room_speed;
			}else{
				global.HP = 1;
				Obj_player.image_alpha = 1;
				Obj_player.state = Obj_player.stateFree;
				Obj_player.x = global.checkpointx;
				Obj_player.y = global.checkpointy;
				Obj_autoscroll.path_position = global.checkpointcampos;
				Obj_sliem.path_position = global.checkpointslimpos1;
				Obj_sliem2.path_position = global.checkpointslimpos2;
				timer = room_speed;
				Obj_cam.follow = Obj_autoscroll;
			}
		}
		#endregion
	break;
	case Rm_end:
		#region saying goodbye and stopping the watch
		global.stopwatchstart = false;
		if (bye){
			instance_create_layer(Obj_slime.x,Obj_slime.y-30,"Behind",Obj_bye)
			alarm[0] = room_speed;
		}
		if(keyboard_check_pressed(vk_escape)){
			room_goto(Rm_cool_content);	
		}
		#endregion
	break;
	case Rm_cool_content:
	if (keyboard_check_pressed(vk_escape)){
		instance_create_layer(Obj_slime.x,Obj_slime.y-30,"Behind",Obj_bye)
		alarm[0] = room_speed;
	}
	break;
	
	case Rm_ctrls:
		#region controls 
		//go back to title screen
		if(keyboard_check_pressed(vk_escape)){
			room = Rm_start;
		}
		
		if(instance_exists(Obj_slime)){	
			controls = @"Default Controls for slime:

			W & D: Left and Right

			WASD + Enter: Dash
			
			Space: Jump";
		}else if(instance_exists(Obj_boy)){
			controls = @"Default controls for boy:
		
			W & D: Left and Right
		
			Enter: Shoot
			
			Space: Jump";	
		}
	#endregion
	break;
}