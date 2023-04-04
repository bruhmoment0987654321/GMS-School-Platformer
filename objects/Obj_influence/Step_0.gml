if(focus_point_instance == noone){
		focus_point_instance = instance_place(x,y,Obj_influence_focus_point);
}

#region camera focusing on a point
	if(focus_point_instance){
		if(place_meeting(x,y,Obj_player)){
			if(camera_instance == noone){
				camera_instance = instance_find(Obj_cam,0);
				if(original_target == noone){
					original_target = camera_instance.follow;
					original_cam_offset_x = camera_instance.x_offset;
					original_cam_offset_y = camera_instance.y_offset;
					original_cam_lerp = camera_instance.lerp_speed;
				}
				camera_instance.follow = focus_point_instance;
				camera_instance.x_offset = X_offset;
				camera_instance.y_offset = Y_offset;
				camera_instance.lerp_speed = lerp_speed;
			}
		}else{
			if(camera_instance != noone){
				camera_instance.follow = original_target;
				camera_instance.x_offset = original_cam_offset_x;
				camera_instance.y_offset = original_cam_offset_y;
				camera_instance.lerp_speed = original_cam_lerp;
				camera_instance = noone;
				original_target = noone;
				
			}
		}
	}
#endregion