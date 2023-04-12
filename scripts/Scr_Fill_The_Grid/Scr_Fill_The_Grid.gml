///@desc fill_the_grid(_ax,_ay,_xgoal,_ygoal);
// _ax Start x
// _ay Start y
// _xgoal Goal x
// _ygoal Goal y
function fill_the_grid(_ax,_ay,_xgoal,_ygoal){
	#region setting up the variables and ds_list
	var path_found; // a path is found <_<
	var n; //variable when falling
	var a; //variable when falling
	path_found = 0; // setting it because a path hasn't been found yet
	
	//copy the grid pathfinding from global.variable
	ds_grid_pathfinding = ds_grid_create(ds_grid_width(global.dsgrid_pathfinding),ds_grid_height(global.dsgrid_pathfinding));
	ds_grid_copy(ds_grid_pathfinding,global.dsgrid_pathfinding);
	
	//add first point to the list
	var point_list = ds_list_create();
	ds_list_add(point_list,_ax);
	ds_list_add(point_list,_ay);
	ds_grid_set(global.dsgrid_pathfinding,_ax,_ay,0);
	#endregion
	for(var i = 0; i < 200; i++){
		if(path_found == 1){
			ds_list_destroy(path_found); //remove the list because the path is already found
			ds_grid_destroy(ds_grid_pathfinding); //remove the grid because the path is already found
			return path_found;
			break;
		}
		var size_list = ds_list_size(point_list); //updating the size of the grid so it can delete points 
		if(size_list == 0){
			ds_list_destroy(path_found); //remove the list because the path is already found
			ds_grid_destroy(ds_grid_pathfinding); //remove the grid because the path is already found
			return path_found;
			break;
		}
		for(var j = 0; j < size_list; j+= 2){
			_ax = ds_list_find_value(point_list,j);
			_ay = ds_list_find_value(point_list,j+1);
			
			//finish the path after you reach the goal
			if(_ax == _xgoal) && (_ay == _ygoal){
				path_found = 1;
				build_the_path(_xgoal,_ygoal);
				break;
			}
			n = 1; // variable for falling
			#region //check if the enemy can go to the right
			if(ds_grid_get(ds_grid_pathfinding,_ax+1,_ay) == -1) && (ds_grid_get(ds_grid_pathfinding,_ax+1,_ay+1) == -2){
				ds_grid_set(ds_grid_pathfinding,_ax+1,_ay,i);
				ds_list_add(point_list,_ax+1);
				ds_list_add(point_list,_ay);
			}else{ //if the enemy can go right, he can't have any other movement.
				
				//check if the enemy can jump over 1 block vertically
				if(ds_grid_get(ds_grid_pathfinding,_ax+1,_ay) == -2) && (ds_grid_get(ds_grid_pathfinding,_ax+1,_ay - 1) == -1){
					ds_grid_set(ds_grid_pathfinding,_ax + 1,_ay - 1,i);
					ds_list_add(point_list,_ax+2);
					ds_list_add(point_list,_ay-1);
				}else{//if the enemy can jump, he can't have any other movement
					
					//check if enemy can do a diagonal jump	(big jump) (right side)
					if(ds_grid_get(ds_grid_pathfinding,_ax+1,_ay) == -1) && (ds_grid_get(ds_grid_pathfinding,_ax+2,_ay) == -2) && (ds_grid_get(ds_grid_pathfinding,_ax+2,_ay-1) == -1){
						ds_grid_set(ds_grid_pathfinding,_ax+2,_ay-1,i);
						ds_list_add(point_list,_ax+2)
						ds_list_add(point_list,_ay-1);
					}
					
					//check if an enemy can jump over a void (one block) (right side)
					if(ds_grid_get(ds_grid_pathfinding,_ax+1,_ay) == -1) && (ds_grid_get(ds_grid_pathfinding,_ax+2,_ay) == -1) && (ds_grid_get(ds_grid_pathfinding,_ax+2,_ay-1) == -2){
						ds_grid_set(ds_grid_pathfinding,_ax+2,_ay,i);
						ds_list_add(point_list,_ax+2);
						ds_list_add(point_list,_ay);
					}	
					
					//check if the enemy can fall (right side)
					if(ds_grid_get(ds_grid_pathfinding,_ax+1,_ay) == -1) && (ds_grid_get(ds_grid_pathfinding,_ax+1,_ax+1) == -1){
						do{
						n++;
						a = ds_grid_get(ds_grid_pathfinding,_ax+1,_ay+n);
						}
						until(a == -2) || (_ay+n == ds_grid_height(ds_grid_pathfinding));
						if(ds_grid_get(ds_grid_pathfinding,_ax+1,_ay+n) == -1) && (ds_grid_get(ds_grid_pathfinding,_ax+1,_ay+n) == -2){
							ds_grid_set(ds_grid_pathfinding,_ax+1,_ay+n-1,i);
							ds_list_add(point_list,_ax+1);
							ds_list_add(point_list,_ay+n-1);
						}
						
					}
				}
				
			}
			#endregion
			n = 1; //re-initionalize for left side
			#region checking if the enemy can go to the left
			if(ds_grid_get(ds_grid_pathfinding,_ax-1,_ay) == -1) && (ds_grid_get(ds_grid_pathfinding,_ax-1,_ay+1) == -2){
				ds_grid_set(ds_grid_pathfinding,_ax-1,_ay,i);
				ds_list_add(point_list,_ax-1);
				ds_list_add(point_list,_ay);
			}else{ //if the enemy can go left, he can't have any other movement.
				
				//check if the enemy can jump over 1 block vertically
				if(ds_grid_get(ds_grid_pathfinding,_ax-1,_ay) == -2) && (ds_grid_get(ds_grid_pathfinding,_ax-1,_ay - 1) == -1){
					ds_grid_set(ds_grid_pathfinding,_ax - 1,_ay - 1,i);
					ds_list_add(point_list,_ax-2);
					ds_list_add(point_list,_ay-1);
				}else{//if the enemy can jump, he can't have any other movement
					
					//check if enemy can do a diagonal jump	(big jump) (right side)
					if(ds_grid_get(ds_grid_pathfinding,_ax-1,_ay) == -1) && (ds_grid_get(ds_grid_pathfinding,_ax-2,_ay) == -2) && (ds_grid_get(ds_grid_pathfinding,_ax+2,_ay-1) == -1){
						ds_grid_set(ds_grid_pathfinding,_ax-2,_ay-1,i);
						ds_list_add(point_list,_ax-2)
						ds_list_add(point_list,_ay-1);
					}
					
					//check if an enemy can jump over a void (one block) (right side)
					if(ds_grid_get(ds_grid_pathfinding,_ax-1,_ay) == -1) && (ds_grid_get(ds_grid_pathfinding,_ax-2,_ay) == -1) && (ds_grid_get(ds_grid_pathfinding,_ax+2,_ay-1) == -2){
						ds_grid_set(ds_grid_pathfinding,_ax-1,_ay,i);
						ds_list_add(point_list,_ax-2);
						ds_list_add(point_list,_ay);
					}	
					
					//check if the enemy can fall (right side)
					if(ds_grid_get(ds_grid_pathfinding,_ax-1,_ay) == -1) && (ds_grid_get(ds_grid_pathfinding,_ax-1,_ax+1) == -1){
						do{
						n++;
						a = ds_grid_get(ds_grid_pathfinding,_ax-1,_ay+n);
						}
						until(a == -2) || (_ay+n == ds_grid_height(ds_grid_pathfinding));
						if(ds_grid_get(ds_grid_pathfinding,_ax-1,_ay+n) == -1) && (ds_grid_get(ds_grid_pathfinding,_ax-1,_ay+n) == -2){
							ds_grid_set(ds_grid_pathfinding,_ax-1,_ay+n-1,i);
							ds_list_add(point_list,_ax+1);
							ds_list_add(point_list,_ay+n-1);
						}
						
					}
				}
				
			}
			#endregion
			
		}
		for(var k = 0; k < size_list; k++){
			ds_list_delete(point_list,0);	
		}
	}

}