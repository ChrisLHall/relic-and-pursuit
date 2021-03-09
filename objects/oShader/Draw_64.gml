shader_set(Shader1);
t_h = 2/surface_get_height(application_surface);
shader_set_uniform_f(texelSize, t_h);
draw_surface(application_surface,0,0);
shader_reset();