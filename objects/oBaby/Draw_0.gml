draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)



var xFinal = x + 1000
if (image_xscale < 0) {
	xFinal = x - 1000	
}
// laser
if state == floatystates.aggro {
	// blinky laser
	var alpha = .2 + .5 * (round(get_timer() / 50000) mod 2)
	draw_set_color($333366)
	draw_set_alpha(alpha)
	draw_rectangle(x + 8 * image_xscale, y - 4, xFinal, y - 3, false)
}


// guess these gotta be restored????? 
draw_set_color(c_white)
draw_set_alpha(1)