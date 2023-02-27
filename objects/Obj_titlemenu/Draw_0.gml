//draw options
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

//dynamically getting width and height :]
var new_w = 0;
for (var i = 0; i < op_length; i++){
	var op_w = string_width(options[menu_level,i]);
	new_w = max(new_w,op_w);
}
width = (new_w + op_border*2)/200;
height = (op_border *2 + string_height(options[0,0]) + (op_length-1)*op_space)/200;

//draw the menu background
draw_sprite_ext(sprite_index,0,x,y,width,height,0,c_white,1);



for (var i = 0; i < op_length; i++){
	var c = c_black;
	if pos == i { c = c_green; }
	draw_text_color(x+op_border,y+op_border + op_space*i,options[menu_level,i],c,c,c,c,1);
}