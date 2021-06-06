/// @description Insert description here
// You can write your code in this editor
image_xscale*=obj_game.width/480*0.75*1.5;
image_yscale*=obj_game.height/480*1;
oldrotation=0;
rotation=0;
giveway=0.5;
previousangle=-1000;
if (obj_game.controls=4)
{
	var screenwidth=display_get_gui_width();
	var screenheight=display_get_gui_height();
	var posx=screenwidth/6;
	var type=1;
	var box=instance_create_depth(posx*type,screenheight-screenheight/8,depth-1,obj_placetrap);	
	box.type=type;
	type+=1;
	box.trap=spr_drum;
	var box=instance_create_depth(posx*type,screenheight-screenheight/8,depth-1,obj_placetrap);	
	box.type=type;
	type+=1;
	box.trap=spr_drum;
	var box=instance_create_depth(posx*type,screenheight-screenheight/8,depth-1,obj_placetrap);	
	box.type=type;
	type+=1;
	box.trap=spr_spiketrap;
	var box=instance_create_depth(posx*type,screenheight-screenheight/8,depth-1,obj_placetrap);	
	box.type=type;
	type+=1;
	box.trap=spr_beartrap;
	var box=instance_create_depth(posx*type,screenheight-screenheight/8,depth-1,obj_placetrap);	
	box.type=type;
	type+=1;
	box.trap=spr_spring;
}