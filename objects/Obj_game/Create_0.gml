window_set_caption("The Silly Slime & The Ludicrous Boy");
if(file_exists("ChangedKeys.sav")){
	var _buffer = buffer_load("ChangedKeys.sav");
	var _string = buffer_read(_buffer,buffer_string);
	buffer_delete(_buffer);
	var _loadData = json_parse(_string);
	while(array_length(_loadData) > 0){
		var _loadEntitiy = array_pop(_loadData);	
		global.keyUp = _loadEntitiy.keyup;
		global.keyDown = _loadEntitiy.keydown;
		global.keyLeft = _loadEntitiy.keyleft;
		global.keyRight = _loadEntitiy.keyright;
		global.keyRun = _loadEntitiy.keyrun;
		global.keyJump = _loadEntitiy.keyjump;
		global.keyDash = _loadEntitiy.keydash;
		global.keyBacktoTitle = _loadEntitiy.keybackto;
	}
	show_debug_message("Game Loaded!" + _string);
}else{
	Scr_default_buttons();	
}
time = room_speed;
timer = time;
keybinds = "Up:\n\nDown:\n\nLeft:\n\nRight:\n\nRun:\n\nJump:\n\nDash:\n\nGoing back to the title:"

enum Keys{
	Default,
	Up,
	Down,
	Left,
	Right,
	Run,
	Jump,
	Dash,
	BacktoTitle
}
global.Boss_time = false;