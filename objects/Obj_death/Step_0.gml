if(Obj_game.timer <= 0){
	Obj_death.image_xscale += 0.01;
	Obj_death.image_yscale += 0.01;
	Obj_death.image_alpha += 0.01;
}
if(image_alpha >= 1){
	image_alpha = 1;
	Obj_game.timer = Obj_game.time;
}