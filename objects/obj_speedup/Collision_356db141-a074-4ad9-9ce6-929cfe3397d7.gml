/// @description Insert description here
// You can write your code in this editor
other.xmovspd*=2;
other.alarm[4]=room_speed*5;
other.image_blend=c_yellow;
instance_destroy();
audio_play_sound(snd_healtup,0,false);