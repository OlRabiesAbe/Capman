/// @description 

//disable application drawing
application_surface_draw_enable(false);

// init surface var
_crtSurface = -1;

shandle_surface_width = shader_get_uniform(shd_crt, "_surfaceWidth");
shandle_surface_height = shader_get_uniform(shd_crt, "_surfaceHeight");