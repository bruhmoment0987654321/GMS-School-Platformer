h = string_length(keystring);
w = string_width(keystring);

switch(rectangle_in_rectangle(x, y, x + sprite_width, y + sprite_height, mouse_x, mouse_y, mouse_x, mouse_y))
{
    case 0: color = c_white; break;
    case 1: color = c_orange; break;
	case 2: color = c_orange; break;
}

if(rectangle_in_rectangle(x, y, x + sprite_width, y + sprite_height, mouse_x, mouse_y, mouse_x, mouse_y)) && (mouse_check_button_pressed(mb_left)){
	var _saveData = array_create(0);
	Scr_default_buttons();
	var _saveEntity = {
		keyup : global.keyUp,
		keydown : global.keyDown,
		keyleft : global.keyLeft,
		keyright : global.keyRight,
		keyrun : global.keyRun,
		keyjump : global.keyJump,
		keydash : global.keyDash,
		keybackto : global.keyBacktoTitle
	}
	array_push(_saveData,_saveEntity);
	Scr_refreshkeybinds();
}

if (!refreshed){
	refreshed = true;
	Scr_refreshkeybinds();
}