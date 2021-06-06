/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_text(10,400,string(image_angle));
if (image_angle>=0 and image_angle<180)
{
	draw_line_color(bbox_left,bbox_bottom,bbox_right,bbox_top,c_green,c_green);
}
else
{
	draw_line_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_green,c_green);
}