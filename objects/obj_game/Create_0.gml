/// @description Insert description here
// You can write your code in this editor
width=room_width;
height=room_height;
solo=false;
controls=1;
leap=noone;
controller=noone;
keyboard=noone;
stage=noone;
local4player=false;
audio_play_sound(snd_menumusic,0,true);
switch (os_type)
{
	case os_android:{
		surface_resize(application_surface, display_get_gui_width(), display_get_gui_height());

	}break;
	
}

var width=(display_get_gui_width());
var height=(display_get_gui_height());
var gamemenu=instance_create_depth(width/2,height/8,-1,obj_menu);
with gamemenu
{
	var offset=sprite_get_height(spr_menuchoice);
	var shift=(sprite_get_height(spr_menuchoice))*1.75+height/4;
	count=1;
	menuitems[count]=instance_create_depth(x,y+shift+offset,-1,obj_menuchoice);
	menuitems[count].text="Local  Game";
	menuitems[count].event=1;
	offset=menuitems[count].sprite_height*1.25;
	shift= offset*0.5;
	var shiftx= -menuitems[count].sprite_width/16;
	menuitems[count].y=y+shift;
	menuitems[count].x=x+shiftx;
	count+=1;				
	menuitems[count]=instance_create_depth(x+shiftx,y+((count-1)*offset)+shift,-1,obj_menuchoice);
	menuitems[count].text="Server";
	menuitems[count].event=3;
	count+=1;				
	menuitems[count]=instance_create_depth(x+shiftx,y+((count-1)*offset)+shift,-1,obj_menuchoice);
	menuitems[count].text="Join Network Game";
	menuitems[count].event=4;
	count+=1;	
	
	menuitems[count]=instance_create_depth(x+shiftx,y+((count-1)*offset)+shift,-1,obj_menuchoice);
	menuitems[count].text="Quit";
	menuitems[count].event=2;
}