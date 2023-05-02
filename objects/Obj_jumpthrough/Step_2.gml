switch(object_index){
	case Obj_moveplath:
		#region plat movement
			hsp = platdir * movespeed;
			var wallcollision = place_meeting(x+hsp,y,Obj_track_end);
			if(wallcollision){
				platdir *= -1;	
			}
		#endregion
		
		#region connecting with the platformer
			with(Obj_player){
				if(!place_meeting(x+other.hsp, y, Obj_solid)){
					if(place_meeting(x, y+1, other)) && (!place_meeting(x, y, other)){
						x+= other.hsp;
					}
				}
			}
		#endregion
		x += hsp;
	break;
}
