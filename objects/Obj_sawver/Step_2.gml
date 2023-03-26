#region move plat
	vsp1 = platdir * movespeed;
	var heightoffset = 0;
	
	var upanddowncollision = place_meeting(x,y+vsp1+(heightoffset*platdir),Obj_line);
	
	if(upanddowncollision){
		platdir *= -1;	
	}
#endregion
y += vsp1;

