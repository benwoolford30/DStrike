/// @description Insert description here
// You can write your code in this editor
if ((other.damaged=false and obj_game.controls=2) or (obj_game.solo=true or obj_game.local4player=true))
{
	other.hp-=damage;
	other.damaged=true;
	other.alarm[0]=room_speed*0.5;	
	other.image_blend=c_red;
	audio_play_sound(snd_handhit,0,false);
	var hit=instance_create_depth(x-(x-other.x)/2,y-(y-other.y)/2,other.depth-1,obj_handhit);
	
	if (instance_exists(obj_client))
	{
		var hap=other.hp;
		with (obj_client)
		{
				var size = 1024;
				var type= buffer_fixed;
				var alignment= 1;
				buffer=noone;
				buffer = buffer_create(size,type,alignment);
				buffer_write(buffer,buffer_u8,8);
				buffer_write(buffer,buffer_s16,hap);			
				network_send_udp(socket,ip,serverport,buffer,buffer_get_size(buffer));
		}
	}
}
instance_destroy();