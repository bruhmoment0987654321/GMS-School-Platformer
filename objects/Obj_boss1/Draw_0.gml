if(sprite_index == Spr_boss1_spit_mid){
	var shake_x = random_range(-3,3);
	draw_sprite_ext(sprite_index,image_index,x+shake_x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}else{
	draw_self();	
}
