var hhalf = h * 0.5;
if(mode != TRANS_MODE.OFF){
	draw_set_color(c_black);
	draw_rectangle(0,0,w,percent*hhalf,false);
	draw_rectangle(0,h,w,h-(percent*hhalf),false);
}