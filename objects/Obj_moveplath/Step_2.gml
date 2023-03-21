#region plat movement
hsp1 = platdir * movespeed;

var wallcollision = place_meeting(x+hsp1,y,Obj_line) || place_meeting(x+hsp1,y,Obj_moveplath) || place_meeting(x+hsp1,y,Obj_moveplatv) || place_meeting(x+hsp1,y,Obj_solid);
if(wallcollision){
	platdir *= -1;	
}
#endregion
#region moving the player
with(Obj_player){
	if(!place_meeting(x+other.hsp1,y,Obj_solid)){
		if(place_meeting(x,y+1,other)) && (!place_meeting(x,y,other)){
			x += other.hsp1;
		}
	}
}
#endregion
x += hsp1