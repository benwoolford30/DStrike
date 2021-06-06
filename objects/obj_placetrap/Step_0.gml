/// @description Insert description here
// You can write your code in this editor
if (device_mouse_check_button_pressed(0,mb_left) && (device_mouse_x_to_gui(0)> x-sprite_width/2) && (device_mouse_x_to_gui(0)< x+sprite_width/2) && (device_mouse_y_to_gui(0)> y-sprite_height/2) && (device_mouse_y_to_gui(0)< y+sprite_height/2))
{
	gotfollow=true;
	follow=instance_create_depth(mouse_x,mouse_y,depth-1,obj_followentity);
	image_alpha=0.5;
}
if (device_mouse_check_button_released(0,mb_left) && ((device_mouse_x_to_gui(0)> x-sprite_width/2) && (device_mouse_x_to_gui(0)< x+sprite_width/2) && (device_mouse_y_to_gui(0)> y-sprite_height/2) && (device_mouse_y_to_gui(0)< y+sprite_height/2)))
{
	gotfollow=false;	
	image_alpha=1;
	instance_destroy(follow);
}
if (instance_exists(follow) and device_mouse_check_button_released(0,mb_left) && !((device_mouse_x_to_gui(0)> x-sprite_width/2) && (device_mouse_x_to_gui(0)< x+sprite_width/2) && (device_mouse_y_to_gui(0)> y-sprite_height/2) && (device_mouse_y_to_gui(0)< y+sprite_height/2)))
{		
	playedtrap=true;
	alarm[0]=room_speed*5;	
	instance_destroy(follow);
	var itsatrap=noone;
	switch (type)
	{
		case 1:{
			itsatrap=obj_barrel;
		}break;
		case 2:{
			itsatrap=obj_bounce;
		}break;
		case 3:{
			itsatrap=obj_spiketrap;
		}break;
		case 4:{
			itsatrap=obj_beartrap;
		}break;
		case 5:{
			itsatrap=obj_spring;
		}break;
		
	}
	var trarp=instance_create_depth(mouse_x,mouse_y,depth-1,itsatrap);
	if (instance_exists(obj_client))
	{
		with (obj_client)
		{
				var size = 1024;
				var typea= buffer_fixed;
				var alignment= 1;
				buffer=noone;
				buffer = buffer_create(size,typea,alignment);
				buffer_write(buffer,buffer_u8,13);
				buffer_write(buffer,buffer_s16,trarp.x);
				buffer_write(buffer,buffer_s16,trarp.y);
				buffer_write(buffer,buffer_s16,itsatrap);			
				network_send_udp(socket,ip,serverport,buffer,buffer_get_size(buffer));
		}
	}
}