restartall = keyboard_check_pressed(global.keyBacktoTitle);

if(pause){
	if(restartall){
		game_restart();
	}
}