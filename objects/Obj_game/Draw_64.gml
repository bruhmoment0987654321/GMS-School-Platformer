if(instance_exists(Obj_death)){
	if(Obj_death.image_alpha = 1){
		draw_text(shakex,shakey,@"Press Enter
to Try Again");
		try_again = true;
	}
}
if(global.ammo > 0){
	draw_text(110,60,"Paper Crumble" + string(global.ammo));	
}