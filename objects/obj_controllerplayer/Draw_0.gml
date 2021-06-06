/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_text(10,500,debug);
if (incapacitated=false)
{
	var dir=point_direction(x,y,reticle.x,reticle.y)+90;
	draw_sprite_ext(spr_davidarm,0,x,y-(sprite_height/4),image_xscale,image_yscale,dir,image_blend,image_alpha);
}
else
{
	draw_sprite_ext(spr_dizzydave,dizzyframe,x,y-(sprite_height/4),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	delay+=1;
	if (delay>maxdelay)
	{
		delay=0;
		dizzyframe+=1;
		if (dizzyframe>maxdizzyframe)
		{
			dizzyframe=0;
		}
	}
}
