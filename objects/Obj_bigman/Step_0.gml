switch(_state){
	case ("WALK"):
		sprite_index = Spr_bIGmanwalk;
		image_speed = animationspeed;
		//movement
		hsp = dir*maxSpeed;
		
	break;
	
	case ("DASHED"):
		sprite_index = Spr_bigmanhit;
		if (Obj_player.x<x){
			hsp = 10;
			vsp = -10;
		}else{
			hsp = -10;
			vsp = -10;
		}
	break;
	
	case ("SHOT"):
		sprite_index = Spr_bigmanhit;
		if (Obj_player.x<x){
			hsp = 1;
			vsp = -1;
		}else{
			hsp = -1;
			vsp = -1;
		}
		hp = hp - 1;
		if(hp <= 0){
			_state = "DEAD";	
		}
	break;
	case("DEAD"):
		if (Obj_player.x<x){
			hsp = 10;
			vsp = -10;
		}else{
			hsp = -10;
			vsp = -10;
		}
	break;
}

//gravity
if (vsp < 5) vsp += global.grv;

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
