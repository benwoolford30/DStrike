/// @description Insert description here
// You can write your code in this editor
if (obj_game.controls=1 or obj_game.local4player=true or obj_game.solo=true)
{
	if (obj_game.controls=1)
	{
		if (disabled=false)
		{
			leftmov=-keyboard_check(ord("A"));
			rightmov=keyboard_check(ord("D"));
			upmov=-keyboard_check(ord("W"));
			downmov=keyboard_check(ord("D"));
			jump=keyboard_check(vk_space);
		}
	}
	else
	{
		if (obj_game.solo=true)
		{
			leftmov=0;
			rightmov=0;
			upmov=0;
			downmov=0;
			jump=0;
			if (disabled=false)
			{
				if (hp>0)
				{
					if (instance_number(obj_speedup)=0)
					{
						var leap=instance_nearest(x,y,objleaptest);
						var stage=instance_nearest(x,y,obj_stage);
						if (leap.x>x)
						{
							if (x>stage.bbox_left+(sprite_width*facing))
							{
								leftmov=-1;
							}
						}
						if (leap.x<x)
						{
							if (x<stage.bbox_right-(sprite_width*facing))
							{
								rightmov=1;
							}
						}
					}
					else
					{
						var pwrup=instance_nearest(x,y,obj_speedup);
						if (pwrup.x<x)
						{
							leftmov=-1;
						}
						if (pwrup.x>x)
						{
							rightmov=1;
						}
					}
				}
				else
				{
					var david=instance_nearest(x,y,obj_controllerplayer);
						if (david.x<x)
						{
							leftmov=-1;
						}
						if (david.x>x)
						{
							rightmov=1;
						}
				}
			}
		}
	}
	xmov=(leftmov+rightmov)*xmovspd;
	//ymov=(upmov+downmov*ymovspd);
	
		if (place_meeting(x,y+ymov+1,obj_stage))
		{
			while !place_meeting(x,y+1,obj_stage)
			{
				y+=1;
			}
			grounded=true;
			ymov=0;
			jumped=false;
			noofjumps=0;
		
		}
		else
		{
			ymov+=grav;
			ymov=min(ymov,maxgrav);
		}
	if (xmov=0 and (grounded=true))
	{
		sprite_index=spr_peacockbodyidle;
		image_xscale=obj_game.width/480*xsize*facing;
		image_yscale=obj_game.height/480*ysize;
	}
	else
	{
		if (grounded=true)
		{
			sprite_index=spr_peacockbody;	
			image_xscale=obj_game.width/480*xsize*sign(xmov);
			image_yscale=obj_game.height/480*ysize;	
			facing=sign(xmov);
		}
		else
		{
			sprite_index=spr_peacockfly;	
			image_xscale=obj_game.width/480*xsize*facing;
			image_yscale=obj_game.height/480*ysize;	
		}
	}
	
	if (jumped=true and jump=true)
	{
		ymov-=(jumppow);
		ymov=max(ymov,-((jumppow)*2));
		
	}
	if (jump=true and ((grounded=true and releasedjump=true) or (noofjumps<maxjumps and releasedjump=true) ))
	{
		releasedjump=false;
		ymov-=jumppow*4*1.3;
		jumped=true;	
		grounded=false;	
		alarm[0]=room_speed*0.3;
		noofjumps+=1;
	
	}
	if (jump=0)
	{
		releasedjump=true;
	}
	y+=ymov;
	x+=xmov;
	if (y>room_height)
	{
		y=room_height/2;
		x=room_width/2;
		life-=1;
		returnhp=maxhp/2;
		if (life<1)
		{
			scr_gamerestart(true);	
		}
		else
		{
			
		}
	}
	//some12012
}

if (xmov!=0 and (grounded=true))
{
	stepping+=1;
	if stepping>1
	stepping=0;
	if stepping=0
	{
		if (!audio_is_playing(snd_leftstep))
		audio_play_sound(snd_leftstep,1,false);
	}
	else
	{
		if (!audio_is_playing(snd_rightstep))
		audio_play_sound(snd_rightstep,1,false);
	}
}
if (obj_game.controls=1)
{
	if (instance_exists(obj_client))
	{
		var xpos=x;
		var ypos=y;
		var xscale=image_xscale;
		var anim=sprite_index;
		var lifes=life;
		with (obj_client)
		{
				var size = 1024;
				var type= buffer_fixed;
				var alignment= 1;
				buffer=noone;
				buffer = buffer_create(size,type,alignment);
				buffer_write(buffer,buffer_u8,3);
				buffer_write(buffer,buffer_s16,xpos);
				buffer_write(buffer,buffer_s16,ypos);
				buffer_write(buffer,buffer_f32,xscale);
				buffer_write(buffer,buffer_s16,anim);
				buffer_write(buffer,buffer_s16,lifes);
				network_send_udp(socket,ip,serverport,buffer,buffer_get_size(buffer));
		}
	}
}
