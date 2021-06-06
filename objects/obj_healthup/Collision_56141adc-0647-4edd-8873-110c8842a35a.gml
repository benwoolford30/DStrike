/// @description Insert description here
// You can write your code in this editor
if (other.hp>0)
{
	other.hp+=other.maxhp/4;
	if other.hp>other.maxhp
	{
		other.hp=other.maxhp;
	}
	audio_play_sound(snd_healtup,0,false);
	instance_destroy();
}