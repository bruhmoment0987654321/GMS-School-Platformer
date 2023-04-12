//changing direction when on a path
if(direction == 90) || (direction == 270){
	if(place_meeting(x-1,y,Obj_wall)){
		image_angle = 180;
	}else if(place_meeting(x+1,y,Obj_wall)){
		image_angle = 0;
	}
}

if(direction == 180) || (direction == 0){
	if(place_meeting(x,y+1,Obj_wall)){
		image_angle = -90;
	}else if(place_meeting(x,y-1,Obj_wall)){
		image_angle = 90;	
	}
}