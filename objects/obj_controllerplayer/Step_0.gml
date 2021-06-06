/// @description Insert description here
// You can write your code in this editor
if (obj_game.controls=2 or obj_game.local4player=true or obj_game.solo=true)
{
	if (obj_game.controls=2)
	{
		leftmov=-(gamepad_axis_value(0,gp_axisrh)<-0.5);
		rightmov=(gamepad_axis_value(0,gp_axisrh)>0.5);
		upmov=-(gamepad_axis_value(0,gp_axisrv)<-0.25);
		downmov=(gamepad_axis_value(0,gp_axisrv)>0.25);
		fire=(gamepad_button_check(0,gp_shoulderrb));
	}
	if (obj_game.solo=true)
	{
		leftmov=0;
		rightmov=0;
		upmov=0;
		downmov=0;
		fire=1;
		var leap=instance_nearest(x,y,objleaptest);
		if (leap.x>reticle.x)
		{
			rightmov=1;
		}
		if (leap.x<reticle.x)
		{
			leftmov=-1;
		}
		if (leap.y>reticle.y)
		{
			downmov=1;
		}
		if (leap.y<reticle.y)
		{
			upmov=-1;
		}
	}
	xmov=(leftmov+rightmov)*xmovspd+xmovcarry;
	ymov=(upmov+downmov)*ymovspd+ymovcarry;

	reticle.x+=xmov;
	reticle.y+=ymov;
	reticle.x=clamp(reticle.x,0,room_width);
	reticle.y=clamp(reticle.y,0,room_height);
	if (fire=1 and firingdelay=false and fall=false)
	{
		reticle.image_index=1;
		firingdelay=true;
		alarm[0]=room_speed*0.2;
		var bullet=instance_create_depth(x,y,depth-1,obj_bullet);
		var dir=point_direction(x,y,reticle.x,reticle.y);
		bullet.direction=dir;
		bullet.image_angle=direction;
		bullet.damage=attackpow;
		if (instance_exists(obj_client))
		{
			var bulx=bullet.x;
			var buly=bullet.y;
			var dir=bullet.direction;
			var pow=attackpow;
			with (obj_client)
			{
					var size = 1024;
					var type= buffer_fixed;
					var alignment= 1;
					buffer=noone;
					buffer = buffer_create(size,type,alignment);
					buffer_write(buffer,buffer_u8,7);
					buffer_write(buffer,buffer_s16,bulx);
					buffer_write(buffer,buffer_s16,buly);		
					buffer_write(buffer,buffer_s16,dir);	
					buffer_write(buffer,buffer_s16,pow);
					network_send_udp(socket,ip,serverport,buffer,buffer_get_size(buffer));
			}
		}
	
	}
	else
	{
		if (firingdelay=false)
		{
			reticle.image_index=0;
		}
	}
}
if (link!=noone)
{
	 if (link.hp>0)
	 {
		x=link.x;
		y=link.y;
		image_xscale=link.image_xscale;
		image_yscale=link.image_yscale;
		if (link.sprite_index=spr_peacockbodyidle)
		{
			sprite_index=spr_davidbodyidle;
		}
		else
		{
			sprite_index=spr_davidbody;
		}
	}
	else
	{
		if (incapacitated = false)
		{
			//BELOW IS THE CODE THAT IS JUST DAVID LYING DOWN
			sprite_index = spr_daviddismounted;
			xmovcarry=8*sign(link.xmov);
			if xmovcarry=0
			{
				xmovcarry=8;
			}
			ymovcarry=-5;
			returnhp = returnhp/2;
			incapacitated = true;			
			fall=true;
			link.disabled=true;
			link.alarm[2]=room_speed*2;
			link.xmov=0;
			link.leftmov=0;
			link.rightmov=0;
			audio_play_sound(snd_incapitated,0,false);
		}
		if (xmovcarry>0)
		{
			xmovcarry-=0.1;
			if (xmovcarry<0)
			{
				xmovcarry=0;
			}
		}	
		if (ymovcarry<20 and fall=true)
		{
			ymovcarry+=0.1;
			if (ymovcarry>20)
			{
				ymovcarry=20;
			}
		}
	
		if (fall=false)
		{
			if (!place_meeting(x,y,obj_stage))
			{
				fall=true;
			}
		}
			
		x+=xmovcarry;
		y+=ymovcarry;
		//gravity	
		if (y > room_height or x < 0)
		{
			link.life-=1;
			if (link.life<1)
			{
				scr_gamerestart(true);
			}
			else
			{
				fall=false;
				incapacitated=false;
				link.hp=link.maxhp;
				link.disabled=false;
			}
		}
	}
}
if (obj_game.controls=2)
{
	if (instance_exists(obj_client))
	{
		var retx=reticle.x;
		var rety=reticle.y;
		var shot=fire;

		with (obj_client)
		{
				var size = 1024;
				var type= buffer_fixed;
				var alignment= 1;
				buffer=noone;
				buffer = buffer_create(size,type,alignment);
				buffer_write(buffer,buffer_u8,4);
				buffer_write(buffer,buffer_s16,retx);
				buffer_write(buffer,buffer_s16,rety);		
				buffer_write(buffer,buffer_s16,shot);	
				network_send_udp(socket,ip,serverport,buffer,buffer_get_size(buffer));
		}
	}
}