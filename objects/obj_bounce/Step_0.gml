/// @description Insert description here
// You can write your code in this editor

//make it bounce
if (bounce = true)
{
	mygravity = -4;
	
}
else if (bounce = false)
{
	mygravity = 4;
}
//check to see if barrel is to low to bounce
if (nowroll = false)
{
	//make it bounce lower
	if (y < (bounceheight) and bounce=true)
	{
		bounce = false;
		divide -=0.5;
		bounceheight=room_height/divide;
	}
}
//make the barrel roll when low enough
if (divide < 2)
{
	bounce = false
	nowroll = true;	
	//collide with platform
	if !(place_meeting(x, bbox_bottom, obj_stage)) { mygravity = 4; }
}
x += xmov;
y+=mygravity;
