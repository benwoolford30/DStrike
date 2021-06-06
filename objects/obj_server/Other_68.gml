/// @description Insert description here
// You can write your code in this editor
var test=0;
var eventType= async_load[? "type"];
switch (eventType)
{
	case network_type_connect:{
	    for (var i=1; i<=client;i++)
		{
			if (socket[i]== noone)
	        {
	            socket[i] = async_load[? "socket"];
				port[i]= async_load[? "port"];
				ip[i]=async_load[? "ip"];
	            draw[i]=true;	
				noofconnects+=1;
				break;
	        }
		}

	}break;
	case network_type_disconnect:{
		for (var i=1; i<=client;i++)
		   {
			if (async_load[?"socket"]=socket[i])
			{
				socket[i] = noone;
				draw[i]=false;
				noofconnects-=1;
				break;
			}
		   }
	}break;
	case network_type_data:{
		var buffer = async_load[? "buffer"];
	    buffer_seek(buffer,buffer_seek_start,0);
		packettype=buffer_read(buffer,buffer_u8);
		//for (var i=1; i<=client;i++)
		//{
		//	if (socket[i]!= async_load[? "id"])
		//	{
			
		//		network_send_packet(socket[i],buffer,buffer_get_size(buffer));	
		//	}					
		//}
		//buffer_delete(buffer);

		switch packettype
		{
			case 1:{	//connection
				for (var i=1; i<=client;i++)
				{
					if (socket[i]== noone)
			        {
			            socket[i] = async_load[? "socket"];
						port[i]= async_load[? "port"];
						ip[i]=async_load[? "ip"];
			            draw[i]=true;	
						noofconnects+=1;
						break;
			        }
				}
				if (noofconnects=client)
				{
					var size = 1024;
					var type= buffer_fixed;
					var alignment= 1;
					buffer = buffer_create(size,type,alignment);
					buffer_write(buffer,buffer_u8,1);
					for (var i=1; i<=client;i++)
					{
						network_send_udp(myserver,ip[i],port[i],buffer,buffer_get_size(buffer));
					}
					//network_send_broadcast(myserver,serverport,dummybuffer,buffer_tell(dummybuffer));
				}
			}break;		
		}
		if (packettype!=1)
		{
			var theirbuffer=buffer;
			buffer_seek(theirbuffer,buffer_seek_start,0);
			for (var i=1; i<=client;i++)
			{
				if (async_load[?"port"]!=port[i] and (port[i]!=noone))
				{
					network_send_udp(myserver,ip[i],port[i],theirbuffer,buffer_get_size(theirbuffer));
				}
			}
		}
	}
}