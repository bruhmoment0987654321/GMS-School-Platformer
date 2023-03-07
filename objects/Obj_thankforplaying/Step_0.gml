move_wrap(true,false,180);
if(place_meeting(x,y+vsp,Obj_solid)){
	vsp = -vsp;
	if (vsp >= 0){
	vsp = 0;	
	}
}
if(place_meeting(x+hsp,y,Obj_solid)){
	hsp = -hsp;
}

if(x > 466){
	goodbye = true;	
}
vsp += global.grv;
x += hsp;
y += vsp;