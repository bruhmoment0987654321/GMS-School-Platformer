switch(_state){
	case ("FLY"):
		sprite_index = Spr_bat;
		image_speed = animationspeed;
		//movement
		hsp = dir*maxSpeed;
	break;
	break;
	
		case ("SHOT"):
		sprite_index = Spr_bigmanhit;
		if (Obj_slime.x<x){
			hsp = 1;
			vsp = -1;
		}else{
			hsp = -1;
			vsp = -1;
		}
	break;
	
	case ("STOMPED"):
		sprite_index = Spr_bIGmanstomp;
		hsp = 0; 
		vsp = 0;
	break;
	case ("DASHED"):
	sprite_index = Spr_bigmanhit;
	if (Obj_slime.x<x){
		hsp = 10;
		vsp = -10;
	}else{
		hsp = -10;
		vsp = -10;
		}
	break;
}
//collisions
	//horizontal collision
	if (place_meeting(x+hsp,y,Obj_solid)){
		dir *= -1;
	}

	//vertical collision
	if (place_meeting(x,y+vsp,Obj_solid)){
		while (abs(vsp) > 0.1){
			vsp *= 0.5;
			if(!place_meeting(x,y+vsp,Obj_solid)) y += vsp
		}
		vsp = 0;
	}
	if(hsp != 0){
	image_xscale = -sign(hsp);
	}
	x += hsp; 
	y += vsp;
