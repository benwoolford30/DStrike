/// @description Insert description here
// You can write your code in this editor
switch (controllerchose)
{
	case 1:{}break;	//keyboard
	case 2:{}break;	//controller
	case 3:{}break;	//leap
	case 4:{}break;	//phone
}
if (connect=true)
{
	draw_rectangle_color(0,0,room_width,room_height,c_yellow,c_yellow,c_yellow,c_yellow,false);
	draw_text(room_width/2,room_height/2,"Connected");
}