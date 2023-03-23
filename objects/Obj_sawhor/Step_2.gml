#region plat movement
hsp1 = platdir * movespeed;

var wallcollision = place_meeting(x+hsp1,y,Obj_line) || place_meeting(x+hsp1,y,Obj_moveplath) || place_meeting(x+hsp1,y,Obj_solid);
if(wallcollision){
	platdir *= -1;	
}
#endregion
x += hsp1