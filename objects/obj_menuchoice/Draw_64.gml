/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(x,y,text,image_xscale*1.5,image_yscale*1.5,image_angle);
draw_set_halign(-1);
draw_set_valign(-1);