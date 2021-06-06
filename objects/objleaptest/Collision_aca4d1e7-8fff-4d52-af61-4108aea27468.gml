/// @description Insert description here
// You can write your code in this editor
if (other.incapacitated=false)
{
	if (other.link.invincible=false and other.link.damaged=false)
	{
		audio_play_sound(snd_playerhit,0,false);		
		audio_play_sound(snd_davidhurt1,0,false);
		
		other.link.hp-=10;
		other.link.damaged=true;
		other.link.alarm[1]=room_speed*0.3;
		other.link.image_blend=c_red;
		var hit=instance_create_depth(x-(x-other.link.x)/2,y-(y-other.link.y)/2,other.link.depth-1,obj_peahurt);
		if (instance_exists(obj_client))
		{
			var hap=other.link.hp;		

			with (obj_client)
			{
					var size = 1024;
					var type= buffer_fixed;
					var alignment= 1;
					buffer=noone;
					buffer = buffer_create(size,type,alignment);
					buffer_write(buffer,buffer_u8,10);
					buffer_write(buffer,buffer_s16,hap);			
					network_send_udp(socket,ip,serverport,buffer,buffer_get_size(buffer));
			}
		}
	}
}
else
{
	if (obj_game.controls=3 or obj_game.solo=true or obj_game.local4player=true)
	{
		if (other.fall=false)
		{
			if (obj_game.solo=false)
			other.x+=leap_hand_vel_x(0)*0.5;
			else
			{
				if (x>=other.x)
				other.x+=movspd;
				else
				other.x-=movspd;
			}
			if (instance_exists(obj_client))
			{
				var posx=other.x;		

				with (obj_client)
				{
						var size = 1024;
						var type= buffer_fixed;
						var alignment= 1;
						buffer=noone;
						buffer = buffer_create(size,type,alignment);
						buffer_write(buffer,buffer_u8,12);
						buffer_write(buffer,buffer_s16,posx);			
						network_send_udp(socket,ip,serverport,buffer,buffer_get_size(buffer));
				}
			}
		}
	}
}