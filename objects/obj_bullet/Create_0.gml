/// @description Insert description here
// You can write your code in this editor
damage=3;
image_xscale*=obj_game.width/480*0.75*1.5;
image_yscale*=obj_game.height/480*1;
var rand=irandom(5);
speed=10;
switch (rand)
{
	case 1:{
		sprite_index=spr_note1;
		audio_play_sound(snd_note1,0,false);
	}break;
	case 2:{
		sprite_index=spr_note2;
		audio_play_sound(snd_note2,0,false);
	}break;
	case 3:{
		sprite_index=spr_note3;
		audio_play_sound(snd_note3,0,false);
	}break;
	case 4:{
		sprite_index=spr_note4;
		audio_play_sound(snd_note2,0,false);
	}break;
	case 5:{
		sprite_index=spr_note5;
		audio_play_sound(snd_note1,0,false);
	}break;
}
image_blend=make_colour_rgb(random(255),random(255),random(255));
