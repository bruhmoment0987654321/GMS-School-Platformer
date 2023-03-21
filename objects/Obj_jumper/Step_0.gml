switch(_state){
	case ("STILL"):
		sprite_index = Spr_bIGmanwalk;
		image_speed = 0;
		
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
	
	case ("SHOT"):
		
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
