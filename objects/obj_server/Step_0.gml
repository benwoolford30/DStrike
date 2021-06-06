/// @description Insert description here
// You can write your code in this editor
if (noofconnects<client)
{
	network_send_broadcast(myserver,serverport,dummybuffer,buffer_tell(dummybuffer));
}