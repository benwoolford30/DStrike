/// @description Insert description here
// You can write your code in this editor
other.friend.attackpow*=2;
other.friend.alarm[1]=room_speed*5;
other.friend.image_blend=c_orange;
instance_destroy();
audio_play_sound(snd_healtup,0,false);