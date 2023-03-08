draw_set_color(c_white);
if(instance_exists(Obj_death)){
	if(Obj_death.image_alpha = 1){
		draw_set_color(c_orange);
		draw_text_ext_transformed(shakex,shakey,@"Press Enter
to Try Again",5,5,3,3,0);
		try_again = true;
	}
}
if(global.ammo > 0){
	draw_sprite_ext(Spr_paper,0,5,60,3,3,0,c_white,1);
	draw_text_ext_transformed(100,80,": " + string(global.ammo),100,100,3,3,0);	
}else{
	if(Obj_playerparent.object_index = Obj_boy){
		draw_sprite_ext(Spr_paper,0,5,60,3,3,0,c_grey,1);
	}
}

if(room = Rm_end){
	draw_set_halign(fa_middle);
	draw_text_ext_transformed(1180,200,"Press L to end game",3,10000000,2,2,0);
}

