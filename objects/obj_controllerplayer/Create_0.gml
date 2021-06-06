/// @description Insert description here
// You can write your code in this editor
reticle=instance_create_depth(x,y,depth-1,obj_reticle);
xmov=0;
ymov=0;
xmovspd=16;
ymovspd=16;
xmovcarry=0;
ymovcarry=0;
reticle.image_speed=0;
reticle.image_index=0;
link=noone;
leftmov=0;
rightmov=0;
upmov=0;
downmov=0;
fire=0;
firingdelay=false;
flash = 0;
hp = 50;
maxhp = 50;
//returndecrease = false;
returnhp = 50;
width = room_width;
height = room_height;

//when hp = 0
incapacitated = false;
mygravity = 4;
ishit = false;
amount = 1;
fall=false;
dizzyframe=0;
maxdizzyframe=9;
delay=0;
maxdelay=6;
attackpow=3;
debug=false;