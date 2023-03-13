//input
up = keyboard_check_pressed(ord("W"));
down = keyboard_check_pressed(ord("S"));
accept_key = keyboard_check_pressed(vk_enter);

//storing # of options in current menu
op_length = array_length(options[menu_level]);

//move through the menu
pos += down - up;

if (pos >= op_length) pos = 0;
if (pos < 0) pos = op_length-1;
if (accept_key){
	var _sml = menu_level;
	//use the options presented
	switch(menu_level){
		case 0:
		//start menu
			switch(pos){
				//start game
				case 0: room_goto_next(); break;
				//show options
				case 1: menu_level = 1; break;
				//close game
				case 2: game_end(); break;
			}
		break;
		//settings
		case 1:
			switch(pos){
				case 0: menu_level = 2 break;
				//brightness
				case 1: break;
				//controls
				case 2: room = Rm_ctrls break;
				//go back to start menu
				case 3: menu_level = 0; break;
				
			}
		break;
		//change window to full or nah
		case 2:
			switch(pos){
				//yes
				case 0: window_set_fullscreen(true); break;
				//no
				case 1: window_set_fullscreen(false) break;
				//go back to settings
				case 2: menu_level = 1; break;
			}
		break;
	}
		
		//set cursor pos
		if (_sml != menu_level) pos = 0;
		
		//correct option length
		op_length = array_length(options[menu_level]);
}