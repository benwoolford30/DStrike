/// @description Insert description here
// You can write your code in this editor
upmov=-((gamepad_axis_value(0,gp_axislv)<-0.25) or (keyboard_check(vk_up)));
downmov=(gamepad_axis_value(0,gp_axislv)>0.25) or (keyboard_check(vk_down));
go=(gamepad_button_check_released(0,gp_face1)) or (keyboard_check(vk_enter));
if (go=1)
{
	scr_menuevent(menuitems[choice].event);
}
mov=upmov+downmov;
if (mov!=oldmov)
{
	oldmov=mov;
	choice+=mov;
	if (choice<1)
	choice=1;
	if (choice>count)
	choice=count;
}