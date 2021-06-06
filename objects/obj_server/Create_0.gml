/// @description Insert description here
// You can write your code in this editor
var type = network_socket_udp;
serverport= 11337;
client=4;
myserver= network_create_socket_ext(type,serverport);
for (var i=1;i<=client;i++)
{
	socket[i]= noone;
	port[i]=noone;
	ip[i]=noone;
	draw[i]=false;
}
noofconnects=0;
var size = 1024;
var type= buffer_fixed;
var alignment= 1;
dummybuffer = buffer_create(size,type,alignment);
