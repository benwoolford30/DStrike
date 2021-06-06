/// @description Insert description here
// You can write your code in this editor
var width=obj_game.width;
var height=obj_game.height;
draw_sprite_ext(spr_healthbarred,step,width/4,height/16+height/24,width/480*2,height/480*1.5,image_angle,c_white,image_alpha);

setdelay+=1;
if (setdelay>delay)
{
	setdelay=0;
	step+=1;
	if (step>1)
	{
		step=0;
	}
}
draw_healthbar(width/11.5,height/24,width/4+width/4,height/16+height/10,((hp/maxhp)*100),c_black,c_red,c_green,0,true,true);
draw_text_transformed(display_get_gui_width()/32,display_get_gui_height()/32,string(life),display_get_gui_width()/480*3,display_get_gui_width()/480*3,0);