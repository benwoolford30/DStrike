/// @description Insert description here
// You can write your code in this editor

var size = 1024;
var type= buffer_fixed;
var alignment= 1;
var buffer = buffer_create(size,type,alignment);
buffer_seek(buffer,buffer_seek_start,0);
buffer_write(buffer,buffer_u8,1);

network_send_packet(socket,buffer,buffer_get_size(buffer));				
buffer_delete(buffer);
