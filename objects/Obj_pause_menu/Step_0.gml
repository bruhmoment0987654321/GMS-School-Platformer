restartall = keyboard_check_pressed(global.keyBacktoTitle);
debug = keyboard_check_pressed(vk_f4);
if(pause){
	if(debug){
		show_debug_log(true);	
	}
	if(restartall){
		game_restart();
	}
}