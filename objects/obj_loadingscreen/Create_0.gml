/// @description Insert description here
// You can write your code in this editor
switch (os_type)
{
	case os_android:{
		surface_resize(application_surface, display_get_gui_width(), display_get_gui_height());

	}break;
	
}
loading=layer_create(99,"loading");
loadingscreen=layer_background_create(loading,spr_logoscreen);
layer_background_stretch(loadingscreen,true);
layer_background_speed(loadingscreen,7);
visible=false;