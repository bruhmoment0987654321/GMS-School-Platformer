draw_set_color(c_white);

//timer
draw_text_transformed(1250,720,string(global.stopwatch),3,3,0);

switch(room){
	case Rm_start:
	case Rm_test:
	case Rm_brightness:
	break;
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
	
	draw_text_transformed(5,60,controls,2,2,0);
	
	draw_text_ext_transformed(560,50,"Press 1 to go back to the title screen :)",10,300,3,3,0);
	#endregion
	break;
	case Rm_level1ground:
	case Rm_level2ground:
		#region level GUI for slime
		draw_text_transformed(1100,40,"Deaths: " + string(global.death_total),2.5,2.5,0);
		if(instance_exists(Obj_slime)){
			draw_sprite_general(Spr_healthbg,0,0,0,110,40,110/2+25,40/2-5,1.3,1.3,0,c_grey,c_gray,c_gray,c_gray,1);
			draw_sprite_ext(Spr_health,global.HP,110,40,1.3,1.3,0,c_white,1);
		}
		#endregion
	break;
	case Rm_end:
		#region ending of the game
		draw_set_halign(fa_middle);
		draw_text_ext_transformed(1180,200,"Press L to end game",3,10000000,2,2,0);
		#endregion
	break;	
}

