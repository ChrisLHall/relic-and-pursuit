draw_set_font(fnt_monogram_smol);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Outline

//draw_set_colour($262B2B);
//draw_text_ext(x + 2, y, STRING, 20, 300);
//draw_text_ext(x - 2, y, STRING, 20, 300);
//draw_text_ext(x, y + 2, STRING, 20, 300);
//draw_text_ext(x, y - 2, STRING, 20, 300);

draw_set_alpha(0);
draw_set_colour($CDD8E0);
progress += 1;
draw_set_alpha(progress * DRAW_SPEED);
draw_text_ext(x, y, STRING, 16, 300);
