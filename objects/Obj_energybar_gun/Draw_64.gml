if(instance_exists(Obj_Soda_gun)){
	draw_sprite_ext(Spr_energyborder,0,28,751,1,1,90,c_white,1);
	draw_sprite_ext(Spr_energyback,0,30,750,1,1,90,c_white,1);
	draw_sprite_ext(Spr_energyfront,0,30,750,max(0,Obj_Soda_gun.ammo/Obj_Soda_gun.ammo_max),1,90,c_white,1);
}
