x = 1365;
y = 0;
image_xscale = 6;
image_yscale = 6;
draw_self();
if(instance_exists(Obj_boss1)){
	draw_sprite_ext(Spr_health_bar_sliem,Obj_boss1._health,x,y,image_xscale,image_yscale,0,c_white,1);
}

