var hcells = ceil(room_width/cell_size);
var vcells = ceil(room_height/cell_size);
global.dsgrid_pathfinding = ds_grid_create(hcells,vcells);
for(var i = 0; i < hcells; i++){
	for(var j = 0; j < vcells; j++){
		if(place_meeting(i*cell_size,j*cell_size,Obj_solid)){
			ds_grid_add(global.dsgrid_pathfinding,i,j,-2);	
		}else{
			ds_grid_add(global.dsgrid_pathfinding,i,j,-1);
		}
	}	
}