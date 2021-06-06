/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_sprite_ext(trap,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
if (playedtrap=true)
{
	draw_healthbar(x-sprite_width/2,y-sprite_height/2,x+sprite_width/2,y+sprite_height/2,(alarm[0]/(room_speed*5))*100,c_black,c_green,c_yellow,3,false,true);
	//draw_rectangle(x-sprite_width/2,y-sprite_height/2+((room_speed*5)-alarm[0]),x+sprite_width/2,y+sprite_height/2,false);
}
//draw_rectangle(x-sprite_width/2,y-sprite_height/2,x+sprite_width/2,y+sprite_height/2,false);