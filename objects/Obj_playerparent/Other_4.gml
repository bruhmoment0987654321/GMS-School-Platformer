if(file_exists("checkpoint.ini")){
	ini_open("checkpoint.ini");
	x = ini_read_real("player","x",x);
	y = ini_read_real("player","y",y);
	HP = ini_read_real("player","hp",HP);
	ini_close();
}