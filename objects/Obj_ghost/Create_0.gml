/// @description Load Ghost Data

//setup
frames = 0;
image_blend = c_teal;
ghostFileName = "recording.json";

if(file_exists("recording.json")){
	ghostFile = file_text_open_read(ghostFileName);
	ghostDataRoot = json_decode(file_text_read_string(ghostFile));
	ghostData = ghostDataRoot[? "root"];
	ghostFrames = ds_list_size(ghostData);
	ghostFile = file_text_close(ghostData);
}else{
	instance_destroy();	
}
