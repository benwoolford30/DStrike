/// @description Insert description here
// You can write your code in this editor
if (obj_game.controls=3 or obj_game.local4player=true or obj_game.solo=true)
{
	if (leap_hands()>0 and (obj_game.controls=3 or obj_game.local4player=true))
	{
		//if (leap_hand_x(0)<-40)
		//{
		//	x-=1;
		//}
		//if (leap_hand_x(0)>40)
		//{
		//	x+=1;
		//}
		//if (leap_hand_z(0)<40)
		//{
		//	y+=1;
		//}
		//if (leap_hand_z(0)>50)
		//{
		//	y-=1;
		//}	
		x=room_width/2+(leap_hand_x(0)*2);
		y=room_height/2+(leap_hand_y(0)*-2+240);
		x=clamp(x,left,right);
		y=clamp(y,top,bottom);
		hand=4;
	
		if (leap_hand_grab(0)>0.25)
		{
			hand=3;
			if (leap_hand_grab(0)>0.4)
			{
				hand=2;			
				if (leap_hand_grab(0)>0.6)
				{
					hand=1;		
					if (leap_hand_grab(0)>0.8)
					{
						hand=0;							
					}
				}
			}
			
		}
		if (hand=0)
		{
			if (leap_bone_roll(0,0,2)<-2.5 and leap_bone_roll(0,0,2)>-3.5) or (leap_bone_roll(0,0,2)>2.5 and leap_bone_roll(0,0,2)<3.5)
			{
				thumbdown=true;
			}
			else
			{
				thumbdown=false;
			}
			if (leap_bone_roll(0,0,2)>0.5 and leap_bone_roll(0,0,2)<1.2)
			{
				thumbup=true;
			}
			else
			{
				thumbup=false;
			}
		}
		else
		{
			thumbup=false;
			thumbdown=false;
		}
		if (thumbup=true)
		{
			hand=6;
			if (leap_bone_roll(0,1,2)<-2.5 and leap_bone_roll(0,1,2)>-3.5) or (leap_bone_roll(0,1,2)>2.5 and leap_bone_roll(0,1,2)<3.5)
			{
				fingerfire=true;
			}
			else
			{
				fingerfire=false;
			}
		}
		if (thumbdown=true)
		{
			hand=5;
		}
		image_index=hand;
	}
	else
	{
		var pcock=instance_nearest(x,y,obj_keyboardplayer);
		if (obj_controllerplayer.incapacitated=false)
		{
			if (pcock.image_blend=c_gray)
			{			
				if (pcock.x<=x)
				{
					x+=movspd;
				}
				if (pcock.x>x)
				{
					x-=movspd;
				}
				if (distance_to_object(pcock)<sprite_width)
				{							
					if (pcock.y>=y)
					{
						y-=movspd;
					}
					y=clamp(y,0,obj_stage.y);
					x=clamp(x,0,room_width);
				}
				
			}
			else
			{
				if (pcock.x<x)
				{
					x-=movspd;
				}
				if (pcock.x>x)
				{
					x+=movspd;
				}
				if (pcock.y<y)
				{
					y-=movspd;
				}
				if (pcock.y>y)
				{
					y+=movspd;
				}
				if (distance_to_object(pcock)<pcock.sprite_width)
				{
					hand=0;
				}
				else
				{
					hand=4;
				}
			}
		}
		else
		{
			if (obj_controllerplayer.x<x)
			{
				x-=movspd;
			}
			if (obj_controllerplayer.x>x)
			{
				x+=movspd;
			}
			if (obj_controllerplayer.y<y)
			{
				y-=movspd;
			}
			if (obj_controllerplayer.y>y)
			{
				y+=movspd;
			}
		}
		//x=xstart;
		//y=ystart;
	}
	if (instance_exists(obj_client))
	{
		var xpos=x;
		var ypos=y;
	
		var anim=image_index;

		with (obj_client)
		{
				var size = 1024;
				var type= buffer_fixed;
				var alignment= 1;
				buffer=noone;
				buffer = buffer_create(size,type,alignment);
				buffer_write(buffer,buffer_u8,5);
				buffer_write(buffer,buffer_s16,xpos);
				buffer_write(buffer,buffer_s16,ypos);		
				buffer_write(buffer,buffer_s16,anim);
				network_send_udp(socket,ip,serverport,buffer,buffer_get_size(buffer));
		}
	}
}
if (hp<0)
{
	scr_gamerestart(true);
}
if keyboard_check_released(ord("R"))
{
	game_restart();
}