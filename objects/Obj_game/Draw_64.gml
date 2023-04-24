draw_set_color(c_white);

//timer
draw_text_transformed(1260,740,string(global.stopwatchdays) + ":" + string(global.stopwatchhrs) + ":" + string(global.stopwatchmin) + ":" + string(global.stopwatchseconds),2,2,0);

draw_set_color(c_red);
//draw_text(60,10,string(Obj_sliem.frames));

draw_set_color(c_white);
switch(room){

	case Rm_test_boy:
		#region viewing ammo
		if(global.ammo > 0){
			draw_sprite_ext(Spr_paper,0,5,60,3,3,0,c_white,1);
			draw_text_ext_transformed(100,80,": " + string(global.ammo),100,100,3,3,0);	
		}else{
			if(Obj_player.object_index = Obj_boy){
				draw_sprite_ext(Spr_paper,0,5,60,3,3,0,c_grey,1);
			}
		}
		#endregion
	break;
	case Rm_ctrls:
		#region draw control layout
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	draw_text_transformed(20,60,controls,2,2,0);
	
	draw_text_ext_transformed(600,50,"Press Esc to go back to the title screen :)",10,300,3,3,0);
	draw_text_ext_transformed(600,110,"Press T to switch characters",10,300,3,3,0);
	#endregion
	break;
	case Rm_level1ground:
	case Rm_tutorial:
	case Rm_level2ground:
	case Rm_ground_chase:
		#region level GUI for slime
		draw_text_transformed(1200,40,"Deaths: " + string(global.death_total),2.5,2.5,0);
		#endregion
	break;
	case Rm_end:
		#region level GUI for slime
		draw_text_transformed(1100,40,"Deaths: " + string(global.death_total),2.5,2.5,0);
		#endregion
		#region ending of the game
		draw_set_halign(fa_middle);
		draw_text_ext_transformed(1180,200,"Press L to end game",3,10000000,2,2,0);
		#endregion
	break;	
}

