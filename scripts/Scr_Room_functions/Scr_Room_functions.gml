//this is used to control all the functions of the game. like checkpoints, the timer, and menu functions

function Room_functions(){
	switch(room){
	case Rm_level1ground:
		global.stopwatchstart = true;
	case Rm_level2ground:
	case Rm_Boss1:
	case Rm_tutorial:
		#region timer and teleporting to checkpoint
		if(timer <= 0){
			if(!instance_exists(Obj_checkpoint)){
				room_restart();
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
				room_restart();
				timer = room_speed;
				
			}else{
				global.HP = 1;
				Obj_player.image_alpha = 1;
				Obj_player.state = Obj_player.stateFree;
				Obj_player.x = global.checkpointx;
				Obj_player.y = global.checkpointy;
				Obj_autoscroll.path_position = global.checkpointcampos;
				Obj_kill_line.path_position = global.checkpointkillcampos;
				Obj_sliem.frames = global.checkpointslimeframes;
				timer = room_speed;
			}
		}
		#endregion
	break;
	case Rm_credits:
		if(keyboard_check_pressed(vk_escape)){
			room = Rm_start;
		}
	break;
	
	case Rm_end:
		#region saying goodbye and stopping the watch
		global.stopwatchstart = false;
		if (keyboard_check_pressed(ord("L"))){
			instance_create_layer(Obj_slime.x,Obj_slime.y-30,"Behind",Obj_bye)
			alarm[0] = room_speed;
		}
		#endregion
	break;
	
	case Rm_ctrls:
		#region controls 
		if(keyboard_check_pressed(ord("R"))){
			room_goto(Rm_keybinds);
		}
		//go back to title screen
		if(keyboard_check_pressed(vk_escape)){
			room = Rm_start;
		}
		
		if(instance_exists(Obj_slime)){	
			controls = "Controls for slime:\n" + getUnicodeString(vk_escape) + ": Pause\n" + getUnicodeString(global.keyBacktoTitle) + ": Go back to the title screen (While paused)\n" + getUnicodeString(global.keyLeft) + "/" + getUnicodeString(global.keyRight) + ": Left and Right\n" + getUnicodeString(global.keyUp) + ": Up\n" + getUnicodeString(global.keyDown) + ": Down\n" + getUnicodeString(global.keyJump) + ": Jump\n" + getUnicodeString(global.keyDash) + ": Dash";
		}else if(instance_exists(Obj_boy)){
			controls = "Controls for boy:\n" + getUnicodeString(vk_escape) + ": Pause\n" + getUnicodeString(global.keyBacktoTitle) + ": Go back to the title screen (While paused)\n" + getUnicodeString(global.keyLeft) + "/" + getUnicodeString(global.keyRight) + ": Left and Right\n" + getUnicodeString(global.keyUp) + ": Up\n" + getUnicodeString(global.keyDown) + ": Down\n" + getUnicodeString(global.keyJump) + ": Jump\n" + getUnicodeString(global.keyRun) + ": Run\n" + getUnicodeString(mb_left) + ": Shoot";	
		}
	#endregion
	break;
	case Rm_keybinds:
		if(keyboard_check_pressed(vk_escape)){
			room = Rm_ctrls;
		}
	break;
}
}