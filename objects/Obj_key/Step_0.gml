h = string_length(keystring);
w = string_width(keystring);

switch(rectangle_in_rectangle(x, y, x + sprite_width, y + sprite_height, mouse_x, mouse_y, mouse_x, mouse_y))
{
    case 0: color = c_white; break;
    case 1: color = c_orange; break;
	case 2: color = c_orange; break;
}

if(rectangle_in_rectangle(x, y, x + sprite_width, y + sprite_height, mouse_x, mouse_y, mouse_x, mouse_y)) && (mouse_check_button_pressed(mb_left)){
		show_debug_message("Clicked");
		keystring = "Press Any Key";
		if(!instance_exists(Obj_keybinds)){
			with(instance_create_depth(0,0,depth,Obj_keybinds)){
					which_key = other.keytype;
			}
		}else{
			instance_destroy(Obj_keybinds);	
		}
}

if (!refreshed)
{
	refreshed = true;
	Scr_refreshkeybinds();
}