#region move plat
	vsp1 = platdir * movespeed;
	var heightoffset = 32;
	
	var upanddowncollision = place_meeting(x,y+vsp1+(heightoffset*platdir),Obj_line) || place_meeting(x,y+vsp1+(heightoffset*platdir),Obj_moveplath) || place_meeting(x,y+vsp1+(heightoffset*platdir),Obj_moveplatv) || place_meeting(x,y+vsp1+(heightoffset*platdir),Obj_solid);
	
	if(upanddowncollision){
		platdir *= -1;	
	}
	
	
#endregion
#region moving the player with the platform
	with(Obj_player){
		if(!place_meeting(x,y+other.vsp1,Obj_solid)){
			if(place_meeting(x,y+abs(other.vsp1),other)) && (!place_meeting(x,y,other)){
				y += other.vsp1
			}
		}
	}


#endregion
y += vsp1;

