//disable alpha blending (only need RGB from screen)
gpu_set_blendenable(false);

if(pause){
	surface_set_target(application_surface);
	if(surface_exists(pauseSurf)){
		draw_surface(pauseSurf,0,0);
	}else{
		pauseSurf = surface_create(resW,resH);
		buffer_set_surface(pauseSurfBuffer,pauseSurf,0);
	}
	surface_reset_target();
}

if(keyboard_check_pressed(vk_escape)){ //pressing the pause button
	if(!pause){ //if the game isn't paused?
		pause = true;
		
		//deactivate all instances except this instance
		instance_deactivate_all(true);
		
	//---------if you need to pause anything that isn't an instance----//


	//----------------------------------------------------------------//
	//capturing the game moment
	pauseSurf = surface_create(resW,resH);
	surface_set_target(pauseSurf);
		draw_surface(application_surface,0,0);
	surface_reset_target();
	
	//backing up the surface if lost (screen focus, etc.)
	if(buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
	pauseSurfBuffer = buffer_create(resW*resH*4,buffer_fixed,1);
	buffer_get_surface(pauseSurfBuffer,pauseSurf,0);
	}else{ //if unpausing?
		pause = false;
		instance_activate_all();
		if(surface_exists(pauseSurf)) surface_free(pauseSurf);
		if(buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
		
	}
	
}
		
//enable alpha blending again
gpu_set_blendenable(true);