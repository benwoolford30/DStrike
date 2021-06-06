/// @description Insert description here
// You can write your code in this editor
if (obj_game.controls=4)
{
	oldrotation=rotation;
	rotation=device_get_tilt_y();
	rotation=clamp(rotation,-0.5,0.5);
	previousangle=image_angle;
	image_angle=rotation*-40;
	image_angle=clamp(image_angle,-30,30);
}
else
{
	if (obj_game.solo=true) //ai
	{
		
	}
}
if (obj_game.controls=4)
{
	if (instance_exists(obj_client))
	{
		var ang=image_angle;
		with (obj_client)
		{
				var size = 1024;
				var type= buffer_fixed;
				var alignment= 1;
				buffer=noone;
				buffer = buffer_create(size,type,alignment);
				buffer_write(buffer,buffer_u8,6);
				buffer_write(buffer,buffer_s16,ang);				
				network_send_udp(socket,ip,serverport,buffer,buffer_get_size(buffer));
		}
	}
}