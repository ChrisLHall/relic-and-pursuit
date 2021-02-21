draw_set_alpha(ALPHA);

draw_set_font(fnt_monogram);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// Outline

draw_set_colour($262B2B);
draw_text_ext(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 + 2, camera_get_view_y(view_camera[0])  + camera_get_view_width(view_camera[0]) / 5, STRING, 20, 300);
draw_text_ext(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - 2, camera_get_view_y(view_camera[0])  + camera_get_view_width(view_camera[0]) / 5, STRING, 20, 300);
draw_text_ext(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0])  + camera_get_view_width(view_camera[0]) / 5 + 2, STRING, 20, 300);
draw_text_ext(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0])  + camera_get_view_width(view_camera[0]) / 5 - 2, STRING, 20, 300);

draw_set_colour($CDD8E0);
draw_text_ext(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0])  + camera_get_view_width(view_camera[0]) / 5, STRING, 20, 300);
