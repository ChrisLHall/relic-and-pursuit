draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)



var xFinal = x + 1000
if (image_xscale == -1) {
	xFinal = x - 1000	
}
// laser
if (state == floatystates.aggro or (state == floatystates.shoot and !blasting)) {
	// blinky laser
	var alpha = .2 + .5 * (round(get_timer() / 50000) mod 2)
	draw_set_color(c_red)
	draw_set_alpha(alpha)
	draw_rectangle(x, y, xFinal, y + 2, false)
} else if (state == floatystates.shoot and blasting) {
	// blinky laser
	var thic = 2 * (round(get_timer() / 50000) mod 2)
	draw_set_color(c_red)
	draw_set_alpha(1)
	draw_rectangle(x, y - thic, xFinal, y + 2 + thic, false)
}

