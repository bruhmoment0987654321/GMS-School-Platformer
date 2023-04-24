/// @description progressing the text
letters += spd;
text_current = string_copy(text,1,floor(letters));
h = string_length(text);
w = string_width(text_current);

//destroy when done
if(letters >= length) && (keyboard_check_pressed(vk_anykey)){
	instance_destroy();
}
