#region plat movement
hsp1 = platdir * movespeed;

var wallcollision = place_meeting(x+hsp1,y,Obj_line);
if(wallcollision){
	platdir *= -1;	
}
#endregion
#region moving the player
with(Obj_player){
	if(!place_meeting(x+other.hsp1,y,Obj_solid)){
		if(place_meeting(x,y+1,other)) && (!place_meeting(x,y,other)){
			x += other.hsp1;
		}
	}
}
#endregion

#region checking if the player is inside the block
var x1, y1, x2, y2, x3, y3, x4, y4;
    x1 = Obj_player.bbox_left;
    y1 = Obj_player.bbox_top;
    x2 = Obj_player.bbox_right;
    y2 = Obj_player.bbox_bottom;
    x3 = bbox_left;
    y3 = bbox_top;
    x4 = bbox_right;
    y4 = bbox_bottom;
    if (rectangle_in_rectangle(x1, y1, x2, y2, x3, y3, x4, y4) == 1) // Only true if you're completely inside a block
    {
       sprite_index = Spr_moveplat_chomp;
	   if(image_index > 2){
			image_index = 3;
	   }
    }
#endregion
x += hsp1