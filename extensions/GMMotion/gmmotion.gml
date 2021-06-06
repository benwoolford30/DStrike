#define leap_dll_free
external_free("GMMotion.dll");


#define leap_dll_init
//GM Motion developed by James Begg copyright (C) 2016
//Free to use, Credit Required
//Contact - PM jimmybegg on gmc.yoyogames.com

//define function variables for the GMMotion.dll - DO NOT MODIFY THE "external_define"
//NOTE: if you change the variable names you need to update the corresponding script as well
globalvar LeapGM_init,LeapGM_FingerX,LeapGM_FingerY,LeapGM_FingerZ,LeapGM_Fingers;
globalvar LeapGM_HandX,LeapGM_HandY,LeapGM_HandZ,LeapGM_Hands,LeapGM_HandPinch,LeapGM_HandGrab,LeapGM_HandDirection,LeapGM_HandPitch,LeapGM_HandRoll,LeapGM_HandVX,LeapGM_HandVY,LeapGM_HandVZ,LeapGM_HandType;
globalvar LeapGM_BoneX,LeapGM_BoneY,LeapGM_BoneZ,LeapGM_BonePitch,LeapGM_BoneRoll,LeapGM_BoneDirection;

//INITIATE
LeapGM_Init = external_define("GMMotion.dll", "LeapInit", dll_cdecl, ty_real,0); //Initiate LeapGM

//GESTURES
LeapGM_Circle = external_define("GMMotion.dll", "GetCircle", dll_cdecl, ty_string,0); //Initiate LeapGM
LeapGM_Swipe = external_define("GMMotion.dll", "GetSwipe", dll_cdecl, ty_string,0); //Initiate LeapGM

//FINGERS
LeapGM_Fingers = external_define("GMMotion.dll", "GetLeapFingers", dll_cdecl, ty_real,0); //No. of Fingers
LeapGM_FingerX = external_define("GMMotion.dll", "GetFingerX", dll_cdecl, ty_real,2,ty_real,ty_real); //Finger X
LeapGM_FingerY = external_define("GMMotion.dll", "GetFingerY", dll_cdecl, ty_real,2,ty_real,ty_real); //Finger Y
LeapGM_FingerZ = external_define("GMMotion.dll", "GetFingerZ", dll_cdecl, ty_real,2,ty_real,ty_real); //Finger Z

//HANDS
LeapGM_Hands = external_define("GMMotion.dll", "GetLeapHands", dll_cdecl, ty_real,0); //No. of Hands
LeapGM_HandX = external_define("GMMotion.dll", "GetLeapHandX", dll_cdecl, ty_real,1,ty_real); //Hand X
LeapGM_HandY = external_define("GMMotion.dll", "GetLeapHandY", dll_cdecl, ty_real,1,ty_real); //Hand Y
LeapGM_HandZ = external_define("GMMotion.dll", "GetLeapHandZ", dll_cdecl, ty_real,1,ty_real); //Hand Z
LeapGM_HandVX = external_define("GMMotion.dll", "GetLeapHandVelocityX", dll_cdecl, ty_real,1,ty_real); //Hand X Velocity
LeapGM_HandVY = external_define("GMMotion.dll", "GetLeapHandVelocityY", dll_cdecl, ty_real,1,ty_real); //Hand Y Velocity
LeapGM_HandVZ = external_define("GMMotion.dll", "GetLeapHandVelocityZ", dll_cdecl, ty_real,1,ty_real); //Hand Z Velocity
LeapGM_HandType = external_define("GMMotion.dll", "GetHandType", dll_cdecl, ty_real,1,ty_real); //Hand Type (left or right)
LeapGM_HandPinch = external_define("GMMotion.dll", "GetHandPinch", dll_cdecl, ty_real,1,ty_real); //Hand Pinch Strength
LeapGM_HandGrab = external_define("GMMotion.dll", "GetHandGrab", dll_cdecl, ty_real,1,ty_real); //Hand Grab Strength
LeapGM_HandDirection = external_define("GMMotion.dll", "GetLeapHandDirection", dll_cdecl, ty_real,1,ty_real); //Hand Direction
LeapGM_HandPitch = external_define("GMMotion.dll", "GetLeapHandPitch", dll_cdecl, ty_real,1,ty_real); //Hand Pitch
LeapGM_HandRoll = external_define("GMMotion.dll", "GetLeapHandRoll", dll_cdecl, ty_real,1,ty_real); //Hand Roll

//BONES
LeapGM_BoneX = external_define("GMMotion.dll", "GetBoneX", dll_cdecl, ty_real,3,ty_real,ty_real,ty_real); //Bone X
LeapGM_BoneY = external_define("GMMotion.dll", "GetBoneY", dll_cdecl, ty_real,3,ty_real,ty_real,ty_real); //Bone Y
LeapGM_BoneZ = external_define("GMMotion.dll", "GetBoneZ", dll_cdecl, ty_real,3,ty_real,ty_real,ty_real); //Bone Z
LeapGM_BoneDirection = external_define("GMMotion.dll", "GetBoneYaw", dll_cdecl, ty_real,3,ty_real,ty_real,ty_real); //Bone Direction
LeapGM_BonePitch = external_define("GMMotion.dll", "GetBonePitch", dll_cdecl, ty_real,3,ty_real,ty_real,ty_real); //Bone Pitch
LeapGM_BoneRoll = external_define("GMMotion.dll", "GetBoneRoll", dll_cdecl, ty_real,3,ty_real,ty_real,ty_real); //Bone Roll


#define leap_bone_direction
///leap_bone_direction(hand,finger,bone)
//argument0 = hand number
//argument1 = finger number
//argument2 = bone number

return external_call(LeapGM_BoneDirection, argument0, argument1, argument2);


#define leap_bone_pitch
///leap_bone_pitch(hand,finger,bone)
//argument0 = hand number
//argument1 = finger number
//argument2 = bone number

return external_call(LeapGM_BonePitch, argument0, argument1, argument2);


#define leap_bone_roll
///leap_bone_roll(hand,finger,bone)
//argument0 = hand number
//argument1 = finger number
//argument2 = bone number

return external_call(LeapGM_BoneRoll, argument0, argument1, argument2);


#define leap_bone_x
///leap_bone_x(hand,finger,bone)
//argument0 = hand number
//argument1 = finger number
//argument2 = bone number

return external_call(LeapGM_BoneX, argument0, argument1, argument2);


#define leap_bone_y
///leap_bone_y(hand,finger,bone)
//argument0 = hand number
//argument1 = finger number
//argument2 = bone number

return external_call(LeapGM_BoneY, argument0, argument1, argument2);


#define leap_bone_z
///leap_bone_z(hand,finger,bone)
//argument0 = hand number
//argument1 = finger number
//argument2 = bone number

return external_call(LeapGM_BoneZ, argument0, argument1, argument2);


#define leap_circle
///leap_circle()
return external_call(LeapGM_Circle);


#define leap_circle_direction
///leap_circle_direction()
c = global.LEAPCIRCLESTRING;
if (c == "false") {
    return 0;
}
else {
    dpos = string_pos("d:", c);
    hpos = string_pos("h:", c);
    dir = real(string_copy(c, dpos+2, hpos-dpos-2));
    return dir;
}


#define leap_circle_hand
///leap_circle_hand()
c = global.LEAPCIRCLESTRING;
if (c == "false") {
    return 0;
}
else {
    hpos = string_pos("h:", c);
    h = real(string_copy(c, hpos+2, 1));
    return h;
}


#define leap_circle_progress
///leap_circle_progress()
c = global.LEAPCIRCLESTRING;
if (c == "false") {
    return 0;
}
else {
    ppos = string_pos("p:", c);
    dpos = string_pos("d:", c);
    pro = real(string_copy(c, ppos+2, dpos-ppos-2));
    return pro;
}


#define leap_circle_radius
///leap_circle_radius()
c = global.LEAPCIRCLESTRING;
if (c == "false") {
    return 0;
}
else {
    ppos =  string_pos("p:", c);
    rad = real(string_copy(c, 3, ppos-3));
    return rad;
}


#define leap_finger_name
///leap_finger_name(finger)
//return names for each finger
switch (argument0) {
    case 0:
    str = "Thumb"; 
    break; 
    case 1:
    str = "Index"; 
    break;
    case 2:
    str = "Middle"; 
    break;
    case 3:
    str = "Fourth"; 
    break;
    case 4:
    str = "Fifth"; 
    break;
    }
return str;


#define leap_finger_x
///leap_finger_x(hand,finger)
//argument0 = hand number
//argument1= finger number

return external_call(LeapGM_FingerX, argument0, argument1);


#define leap_finger_y
///leap_finger_y(hand,finger)
//argument0 = hand number
//argument1= finger number
return external_call(LeapGM_FingerY, argument0, argument1);


#define leap_finger_z
///leap_finger_z(hand,finger)
//argument0 = hand number
//argument1= finger number
return external_call(LeapGM_FingerZ, argument0, argument1);


#define leap_fingers
///leap_fingers()
return external_call(LeapGM_Fingers);


#define leap_gestures
///leap_gestures()
global.LEAPCIRCLESTRING = leap_circle();
global.LEAPSWIPESTRING = leap_swipe();


#define leap_hand_direction
///leap_hand_direction(hand)
//argument0 = hand number
return external_call(LeapGM_HandDirection, argument0);


#define leap_hand_grab
///leap_hand_grab(hand)
//argument0 = hand number

//returns grab strength

return external_call(LeapGM_HandGrab, argument0);


#define leap_hand_no
///leap_hand_no(hand)
//argument0 = hand type
//finds which hand number is left or right
//opposite of leap_hand_type

if (is_string(argument0)) {

if (argument0 == "left") {
    if (leap_hand_type(0) = 1) {
        hand_no = 0; //hand '0' is left
    }
    else {
        hand_no = 1; //hand '1' is left
    }
}
if (argument0 == "right") {
    if (leap_hand_type(0) = 0) {
        hand_no = 0; //hand '0' is right
    }
    else {
        hand_no = 1; //hand '1' is right
    }
}
}
else {
    hand_no = argument0; //incase argument0 is 1 or 0, to avoid errors, simply returns the same value
}
return hand_no;     


#define leap_hand_pinch
///leap_hand_pinch(hand)
//argument0 = hand number

//returns pinch strength

return external_call(LeapGM_HandPinch, argument0);


#define leap_hand_pitch
///leap_hand_pitch(hand)
//argument0 = hand number
return external_call(LeapGM_HandPitch, argument0);


#define leap_hand_roll
///leap_hand_roll(hand)
//argument0 = hand number
return external_call(LeapGM_HandRoll, argument0);


#define leap_hand_type
///leap_hand_type(hand)
//argument0 = hand number

//finds which type the hand number is
//if hand is left returns 1, else right returns 0

return external_call(LeapGM_HandType, argument0);


#define leap_hand_vel_x
///leap_hand_vel_x(hand)
//argument0 = hand number
return external_call(LeapGM_HandVX, argument0);


#define leap_hand_vel_y
///leap_hand_vel_y(hand)
//argument0 = hand number
return external_call(LeapGM_HandVY, argument0);


#define leap_hand_vel_z
///leap_hand_vel_z(hand)
//argument0 = hand number
return external_call(LeapGM_HandVZ, argument0);


#define leap_hand_x
///leap_hand_x(hand)
//argument0 = hand number
return external_call(LeapGM_HandX, argument0);


#define leap_hand_y
///leap_hand_y(hand)
//argument0 = hand number
return external_call(LeapGM_HandY, argument0);


#define leap_hand_z
///leap_hand_z(hand)
//argument0 = hand number
return external_call(LeapGM_HandZ, argument0);


#define leap_hands
///leap_hands()
return external_call(LeapGM_Hands);


#define leap_init
///leap_init()
leap_dll_init(); //initialise GMMotion.dll
global.LEAPCIRCLESTRING = "false";
global.LEAPSWIPESTRING = "false";

return external_call(LeapGM_Init);


#define leap_swipe
///leap_swipe()
return external_call(LeapGM_Swipe);


#define leap_swipe_direction
///leap_swipe_direction()
sw = global.LEAPSWIPESTRING;
if (sw == "false") {
    return -1;
}
else {
    xpos =  string_pos("x:", sw);
    ypos =  string_pos("y:", sw);
    spos =  string_pos("s:", sw);
    sw_x = real(string_copy(sw, xpos+2, ypos-xpos-2));
    sw_y = real(string_copy(sw, ypos+2, spos-ypos-2));
    return point_direction(0,0,sw_x,sw_y);
}


#define leap_swipe_hand
///leap_swipe_hand()
sw = global.LEAPSWIPESTRING;
if (sw == "false") {
    return 0;
}
else {
    hpos = string_pos("h:", sw);
    h = real(string_copy(sw, hpos+2, 1));
    return h;
}


#define leap_swipe_speed
///leap_swipe_speed()
sw = global.LEAPSWIPESTRING;
if (sw == "false") {
    return 0;
}
else {
    spos =  string_pos("s:", sw);
    hpos =  string_pos("h:", sw);
    sp = real(string_copy(sw, spos+2, hpos-spos-2));
    return sp;
}


