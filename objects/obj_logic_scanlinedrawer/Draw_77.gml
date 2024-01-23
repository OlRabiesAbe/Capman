/// @description UNUSED Scanline generation

//if (!surface_exists(_crtSurface))
if (_crtSurface == -1)
{
	_crtSurface = surface_create(room_width, room_height);
}

surface_copy(_crtSurface, 0, 0, application_surface);

shader_set(shd_crt);
shader_set_uniform_f(shandle_surface_width, surface_get_width(_crtSurface));
shader_set_uniform_f(shandle_surface_height, surface_get_height(_crtSurface));

draw_surface(_crtSurface, 0, 0);

shader_reset();