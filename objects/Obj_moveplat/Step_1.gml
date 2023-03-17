//select target
var _targetX = endX, _targetY = endY;
if(goingtostart){
	_targetX = startX;
	_targetY = startY;
}

//moving platform
hsp1 = sign(_targetX - x) *currentSpeed;
vsp1 = sign(_targetY - y) * currentSpeed;