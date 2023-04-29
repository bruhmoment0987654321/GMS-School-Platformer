h = string_length(keystring);
w = string_width(keystring);

switch(rectangle_in_rectangle(x, y, x + sprite_width, y + sprite_height, mouse_x, mouse_y, mouse_x, mouse_y))
{
    case 0: color = c_white; break;
    case 1: color = c_orange; break;
	case 2: color = c_orange; break;
}

if(rectangle_in_rectangle(x, y, x + sprite_width, y + sprite_height, mouse_x, mouse_y, mouse_x, mouse_y)) && (mouse_check_button_pressed(mb_left)){
	show_debug_message("Clicked2");
	Scr_default_buttons();
	Scr_refreshkeybinds();
}

if (!refreshed){
	refreshed = true;
	Scr_refreshkeybinds();
}