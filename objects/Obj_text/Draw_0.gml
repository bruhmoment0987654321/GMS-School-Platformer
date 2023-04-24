
var halfw = w/2;

//draw the box
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_roundrect_ext(x-halfw-border,y-h-(border*2)+boxoffset,x+halfw+border,y-bborderoffset+boxoffset,radius,radius,false);
draw_sprite(Spr_text_point,0,x,y);
draw_set_alpha(1);

Draw_set_Text(c_white,global.font_main,fa_center,fa_top);
draw_text(x,y-h-border+boxoffset,text_current);