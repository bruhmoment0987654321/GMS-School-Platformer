/// @description toggle recording
if(keyboard_check_pressed(vk_f2)){
	ghost_record = !ghost_record;
	
	//stoprecording & save
	if(!ghost_record) && (ds_exists(ghost_recordList,ds_type_list)){
		var wrapper = ds_map_create();
		ds_map_add_list(wrapper,"root", ghost_recordList);
		var thelot = json_encode(wrapper);
		if(file_exists("recording.json")) file_delete("recording.json");
		var record_file = file_text_open_write("recording.json");
		file_text_write_string(record_file,thelot);
		file_text_close(record_file);
		ds_map_destroy(wrapper);
	}
}
//record each frame

if(ghost_record) && (instance_exists(Obj_player)){
	if(!ds_exists(ghost_recordList,ds_type_list)){
		ghost_recordFrames = 1;
		ghost_recordList = ds_list_create();
	}
	
	//record this frame
	var frameToRecord = ds_map_create();
	with(Obj_player){
		frameToRecord[? "x"] = x;
		frameToRecord[? "y"] = y;
		frameToRecord[? "xscale"] = image_xscale;
		frameToRecord[? "yscale"] = image_yscale;
		frameToRecord[? "sprite_index"] = sprite_index;
		frameToRecord[? "image"] = image_index;
	}
	ds_list_add(ghost_recordList, frameToRecord);
	ds_list_mark_as_map(ghost_recordList,ds_list_size(ghost_recordList)-1);
	ghost_recordFrames++;
}