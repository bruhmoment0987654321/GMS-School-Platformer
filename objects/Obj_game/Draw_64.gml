draw_set_color(c_white);

//timer
draw_text_transformed(1260,740,string(global.stopwatchdays) + ":" + string(global.stopwatchhrs) + ":" + string(global.stopwatchmin) + ":" + string(global.stopwatchseconds),2,2,0);

draw_set_color(c_red);
//draw_text(60,10,string(Obj_sliem.frames));

draw_set_color(c_white);
switch(room){

	case Rm_test_boy:
		
	break;
	case Rm_Boss1:
		draw_text_transformed(room_width/2,0,Obj_boss1.Boss_state,3,3,0);
	break;
	case Rm_ctrls:
		#region draw control layout
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	
		draw_text_transformed(20,60,controls,2,2,0);
	
		draw_text_ext_transformed(600,80,"Press Escape to go back to the title screen :)",10,300,3,3,0);
		draw_text_ext_transformed(600,110,"Press T to switch characters",10,300,3,3,0);
		draw_text_ext_transformed(600,140,"Press R to change keybinds :o",10,300,3,3,0);
		#endregion
	break;
	case Rm_keybinds:
		#region showing keybinds ;)
		draw_text_transformed(30,60,keybinds,2.5,2.5,0);
		draw_text_ext_transformed(600,80,"Press Escape to go back to controls.\nUse the mouse to select the keys.",10,300,3,3,0);
		#endregion
	break;
	case Rm_level1ground:
	case Rm_tutorial:
	case Rm_level2ground:
	case Rm_ground_chase:
		#region level GUI for slime
		draw_text_transformed(1230,30,"Deaths: " + string(global.death_total),2.5,2.5,0);
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

