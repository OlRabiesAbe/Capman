/// @desc Delete things and save

saveMenu();

delete menu;
delete look;
delete item_look;
delete anim;
delete scrolling;
delete pause_settings;
delete audio;
delete in;
delete in_sys;
delete sidebar_elements;

ds_stack_destroy(prev_pages);

if (surface_exists(pause_surf)) surface_free(pause_surf);

