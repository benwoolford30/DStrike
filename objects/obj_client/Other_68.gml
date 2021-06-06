/// @description Insert description here
// You can write your code in this editor
var eventType= async_load[? "type"];
switch (eventType)
{
	case network_type_connect:{
		connect=true;
	}break;
	case network_type_disconnect:{
		connect=false;
	}break;
	case network_type_data:{
		var buffer = async_load[? "buffer"];
	    buffer_seek(buffer,buffer_seek_start,0);
		var packettype=buffer_read(buffer,buffer_u8);
		
		switch packettype
		{
			case 1:{
				room_goto(rm_arena);
			}break;
			case 2:{
				
				
			}break;
			
			case 3:{ //sync keyboard player
				with (obj_game)
				{
					if (instance_exists(obj_game.keyboard))
					{
						keyboard.x=buffer_read(buffer,buffer_s16);
						keyboard.y=buffer_read(buffer,buffer_s16);
						keyboard.image_xscale=buffer_read(buffer,buffer_f32);
						keyboard.sprite_index=buffer_read(buffer,buffer_s16);
						keyboard.life=buffer_read(buffer,buffer_s16);
					}
				}
			}break;
			case 4:{ //sync controller player
				with (obj_game)
				{
					if (instance_exists(obj_game.controller))
					{
					controller.reticle.x=buffer_read(buffer,buffer_s16);
					controller.reticle.y=buffer_read(buffer,buffer_s16);					
					controller.fire=buffer_read(buffer,buffer_s16);		
					}
				}
			}break;
			case 5:{ //sync leap player
				with (obj_game)
				{
					if (instance_exists(obj_game.leap))
					{
						leap.x=buffer_read(buffer,buffer_s16);
						leap.y=buffer_read(buffer,buffer_s16);					
						leap.image_index=buffer_read(buffer,buffer_s16);	
					}
				}
			}break;
			case 6:{ //sync phone player
				with (obj_game)
				{
					if (instance_exists(obj_game.stage))
					{
						stage.image_angle=buffer_read(buffer,buffer_s16);
					}
				}
			}break;
			case 7:{ //sync phone player
				with (obj_game)
				{
					if (instance_exists(obj_game.controller))
					{
						var bullet=instance_create_depth(controller.x,controller.y,controller.depth-1,obj_bullet);
						bullet.x=buffer_read(buffer,buffer_s16);
						bullet.y=buffer_read(buffer,buffer_s16);					
						bullet.direction=buffer_read(buffer,buffer_s16);		
						bullet.image_angle=bullet.direction;
						bullet.damage=buffer_read(buffer,buffer_s16);						
						var snd=irandom(2)+1;
						switch (snd)
						{
							case 1:{
								snd=snd_note1;
							}break;
							case 2:{
								snd=snd_note2;
							}break;
							case 3:{
								snd=snd_note3;
							}break;
						}
						audio_play_sound(snd,0,false);
					}
				}
			}break;
			case 8:{ 
				with (obj_game)
				{
					if (instance_exists(obj_game.leap))
					{
						leap.hp=buffer_read(buffer,buffer_s16);
						leap.damaged=true;
						leap.alarm[0]=room_speed*0.5;	
						leap.image_blend=c_red;
						audio_play_sound(snd_handhit,0,false);
					}
				}
			}break;
			case 9:{ //set trap
				with (obj_game)
				{
					if (instance_exists(obj_game.stage))
					{
						var xpos=buffer_read(buffer,buffer_s16);
						var ypos=buffer_read(buffer,buffer_s16);
						var obj=buffer_read(buffer,buffer_s16);
						instance_create_depth(xpos,ypos,stage.depth-1,obj);					
					}
				}
			}break;
			case 10:{ //keyboard hurt
				with (obj_game)
				{
					if (instance_exists(obj_game.keyboard))
					{
						keyboard.hp=buffer_read(buffer,buffer_s16);
						keyboard.damaged=true;
						keyboard.alarm[1]=room_speed*0.3;
						keyboard.image_blend=c_red;
						audio_play_sound(snd_playerhit,0,false);
						audio_play_sound(snd_davidhurt1,0,false);
					}
				}
			}break;
			case 11:{ //keyboard hurt
				with (obj_game)
				{
					scr_gamerestart(false);
				}
			}break;
			case 12:{ //keyboard hurt
				with (obj_game)
				{
					if (instance_exists(obj_game.controller))
					{
						controller.x=buffer_read(buffer,buffer_s16);
						
					}
				}
			}break;
			case 13:{ //keyboard hurt
				with (obj_game)
				{
					buffer_write(buffer,buffer_u8,13);			
					if (instance_exists(obj_game.stage))
					{						
							
					}
				}
			}break;
		}
	}
}
