
with obj_game
{
	keyboard.hp=100;
	keyboard.returnhp=keyboard.maxhp/2;
	keyboard.life=3;
	keyboard.x=room_width/2;
	keyboard.y=room_height/4;
	controller.incapacitated=false;
	leap.hp=100;
	if (argument0=true)
	{
		if (instance_exists(obj_client))
		{
			var reset=2;

			with (obj_client)
			{
					var size = 1024;
					var type= buffer_fixed;
					var alignment= 1;
					buffer=noone;
					buffer = buffer_create(size,type,alignment);
					buffer_write(buffer,buffer_u8,11);
					buffer_write(buffer,buffer_s16,reset);			
					network_send_udp(socket,ip,serverport,buffer,buffer_get_size(buffer));
			}
		}
	}
}