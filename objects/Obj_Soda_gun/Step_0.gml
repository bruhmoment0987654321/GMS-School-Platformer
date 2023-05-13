jump_held = keyboard_check(global.keyJump);
//recharge the gun with this :)
if(ammo <= ammo_max){
	if(ammo <= 0){
		shoot = false;
		ammo += 0.7;
	}else{
		with(Obj_player){
			if(place_meeting(x,y+1,Obj_solid)){
				other.ammo += 1;	
			}
		}
	}
}

if(ammo > ammo_max){
	ammo = ammo_max
	shoot = true;
}

if(ammo < 0){
	ammo = 0;	
}

ammo = round(ammo);