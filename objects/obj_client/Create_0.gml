/// @description Insert description here
// You can write your code in this editor

type = network_socket_udp;
//var ip = "148.197.47.109";
//var ip= "148.197.44.168";
 //ip= "148.197.45.85";
  //ip= "148.197.45.212";
  //ip= "10.128.85.135";
//ip="148.197.45.212";
ip="192.168.0.105";
serverport= 11337;
 myport= 11340;


//connection = network_connect(socket,ip,port);
connect=false;
host=false;
controllerchose=0;
//connect=true;
var size = 1024;
 type1= buffer_fixed;
var alignment= 1;
buffer = buffer_create(size,type1,alignment);
buffer_write(buffer,buffer_u8,1);
