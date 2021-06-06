/// @description Insert description here
// You can write your code in this editor
var width=obj_game.width;
var height=obj_game.height;
draw_sprite_ext(spr_healthbarblue,step,width-width/4,height/16+height/24,width/480*-2,height/480*1.5,image_angle,c_white,image_alpha);
setdelay+=1;
if (setdelay>delay)
{
	setdelay=0;
	step+=1;
	if (step>0)
	{
		step=0;
	}
}
draw_healthbar(width-width/11.5,height/24,width-(width/4+width/4),height/16+height/10,((hp/maxhp)*100),c_black,c_red,c_green,0,true,true);
			
draw_text(10,10,string(leap_hand_x(0)));
draw_text(10,100,string(leap_hand_z(0)));
draw_text(10,120,"Pitch is :"+string(leap_bone_pitch(0,1,2)));
draw_text(10,140,"Roll is :"+string(leap_bone_roll(0,1,2)));
draw_text(10,160,"yaw is :"+string(leap_bone_direction(0,1,2)));


if (thumbdown=true)
{
	draw_text(10,180,"Thumb down");
}
if (thumbup=true)
{
	draw_text(10,180,"Thumb up");
}
if (fingerfire=true)
{
	draw_text(10,200,"fingerfire");
}