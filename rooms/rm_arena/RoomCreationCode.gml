audio_stop_sound(snd_menumusic);
with obj_game
{
	audio_play_sound(snd_gamemusic,3,true);
	stage=instance_create_depth(room_width/2,room_height/2+room_height/4,depth-1,obj_stage);
	keyboard=instance_create_depth(room_width/2,room_height/2-room_height/4,depth-2,obj_keyboardplayer);
	controller=instance_create_depth(room_width/2,room_height/2-room_height/4,depth-2,obj_controllerplayer);
	controller.link=keyboard;
	keyboard.friend=controller;
	leap=instance_create_depth(room_width/2,room_height/4,depth-2,objleaptest);
	guitar=instance_create_depth(room_width/2-room_width/4,room_height/2+room_height/16,depth-1,obj_guitarplayer);
	drum=instance_create_depth(room_width/2,room_height/2+room_height/16,depth-1,obj_drumplayer);
	bass=instance_create_depth(room_width/2+room_width/4,room_height/2+room_height/16,depth-1,obj_bassplayer);
}