//stopping the watch
if(global.stopwatchstart = true){
	global.stopwatchseconds += delta_time/1000000;
}

#region actually making the timer function as a timer

//adding minutes to the timer
if(global.stopwatchseconds > 59.9){
	global.stopwatchseconds = 0;
	global.stopwatchmin += 1;
}

if(global.stopwatchmin > 59){
	global.stopwatchmin = 0;
	global.stopwatchhrs += 1;
}

//adding a funny thing for staying in the game for a day (might do something. IDK)
if(global.stopwatchhrs > 24){
	global.stopwatchhrs = 0;
	global.stopwatchdays += 1;
}

#endregion

