//moving
x += hsp1;
y += vsp1;

//checking if at start position
if(goingtostart) && (point_distance(x,y,startX,startY) < currentSpeed){
	goingtostart = false;
	currentSpeed = 0;
	alarm[0] = waittime;
	
//checking if at the end position
}else if (!goingtostart) && (point_distance(x,y,endX,endY) < currentSpeed){
	goingtostart = true;
	currentSpeed = 0;
	alarm[0] = waittime;
}