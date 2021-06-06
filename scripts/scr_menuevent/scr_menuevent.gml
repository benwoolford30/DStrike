//scr_menuevent(eventnom)
switch (argument0)
{	
	case 2:{
		game_end();		
	}break;
	case 3:{
		instance_deactivate_all(false);
		instance_activate_object(obj_game);
		
		obj_game.server=instance_create_depth(0,0,0,obj_server);
	}break;
	case 1: case 4:{
		if (argument0=1)
		{
			obj_game.solo=true;
		}
		
		instance_deactivate_all(false);
		instance_activate_object(obj_game);		
		obj_game.joinmenu=instance_create_depth(obj_game.width/2,obj_game.height/8,obj_game.depth-1,obj_menu);
		var width=(display_get_gui_width());
		var height=(display_get_gui_height());
		with obj_game.joinmenu
		{
			var offset=sprite_get_height(spr_menuchoice);
			var shift=(sprite_get_height(spr_menuchoice))*1.75+height/4;
	
			count=1;
			menuitems[count]=instance_create_depth(x,y+shift+offset,-1,obj_menuchoice);
			menuitems[count].text="Keyboard";
			menuitems[count].event=5;
			offset=menuitems[count].sprite_height*1.25;
			shift= 0;
			var shiftx= -menuitems[count].sprite_width/16;
			menuitems[count].y=y+shift;
			menuitems[count].x=x+shiftx;
			count+=1;				
			menuitems[count]=instance_create_depth(x+shiftx,y+((count-1)*offset)+shift,-1,obj_menuchoice);
			menuitems[count].text="Controller";
			menuitems[count].event=6;
			count+=1;				
			menuitems[count]=instance_create_depth(x+shiftx,y+((count-1)*offset)+shift,-1,obj_menuchoice);
			menuitems[count].text="Leap";
			menuitems[count].event=7;
			count+=1;		
			menuitems[count]=instance_create_depth(x+shiftx,y+((count-1)*offset)+shift,-1,obj_menuchoice);
			menuitems[count].text="Phone";
			menuitems[count].event=8;
			count+=1;		
			if (obj_game.solo=true)
			{
				menuitems[count]=instance_create_depth(x+shiftx,y+((count-1)*offset)+shift,-1,obj_menuchoice);
				menuitems[count].text="4 player";
				menuitems[count].event=10;
				count+=1;	
			}	
			menuitems[count]=instance_create_depth(x+shiftx,y+((count-1)*offset)+shift,-1,obj_menuchoice);
			menuitems[count].text="Back";
			menuitems[count].event=9;
		}
	}break;
	case 5:{	//keyboard
		if (obj_game.solo=false)
		{
			obj_game.client=instance_create_depth(0,0,0,obj_client);		
			with (obj_game.client)
			{
				myport+=1;
				socket= network_create_socket_ext(type,myport);
				network_send_udp(socket,ip,serverport,buffer,buffer_get_size(buffer));
			}
		}
		else
		{
			obj_game.alarm[0]=room_speed*3;
		}
		obj_game.controls=1;
		layer_set_visible(layer_get_id("peacock"),true);		
		instance_destroy(obj_menuchoice);
		instance_destroy(obj_menu);
	}break;
	case 6:{ //controller
		if (obj_game.solo=false)
		{
			obj_game.client=instance_create_depth(0,0,0,obj_client);		
			with (obj_game.client)
			{
				myport+=2;
				socket= network_create_socket_ext(type,myport);
				network_send_udp(socket,ip,serverport,buffer,buffer_get_size(buffer));
			}
		}
		else
		{
			obj_game.alarm[0]=room_speed*3;
		}
		obj_game.controls=2;
		layer_set_visible(layer_get_id("david"),true);	
		instance_destroy(obj_menuchoice);
		instance_destroy(obj_menu);
	}break;
	case 7:{ //leap
		if (obj_game.solo=false)
		{
			obj_game.client=instance_create_depth(0,0,0,obj_client);		
			with (obj_game.client)
			{
				myport+=3;
				socket= network_create_socket_ext(type,myport);
				network_send_udp(socket,ip,serverport,buffer,buffer_get_size(buffer));
			}
		}
		else
		{
			obj_game.alarm[0]=room_speed*3;
		}
		obj_game.controls=3;
		layer_set_visible(layer_get_id("hand"),true);	
		instance_destroy(obj_menuchoice);
		instance_destroy(obj_menu);
	}break;
	case 8:{ //phone
		if (obj_game.solo=false)
		{
			obj_game.client=instance_create_depth(0,0,0,obj_client);		
			with (obj_game.client)
			{
				myport+=4;
				socket= network_create_socket_ext(type,myport);
				network_send_udp(socket,ip,serverport,buffer,buffer_get_size(buffer));
			}
		}
		else
		{
			obj_game.alarm[0]=room_speed*3;
		}
		obj_game.controls=4;
		layer_set_visible(layer_get_id("world"),true);	
		instance_destroy(obj_menuchoice);
		instance_destroy(obj_menu);
	}break;
	case 9:{
		obj_game.solo=false;
		instance_destroy(obj_game.joinmenu);
		instance_destroy(obj_menuchoice);
		instance_activate_all();
	}break;
	case 10:{ //local 4 player
		obj_game.solo=false;
		obj_game.alarm[0]=room_speed*1;		
		obj_game.local4player=true;		
		instance_destroy(obj_menuchoice);
		instance_destroy(obj_menu);
	}break;
	
	
}