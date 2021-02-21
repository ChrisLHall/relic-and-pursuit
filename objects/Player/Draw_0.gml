// draw default sprite
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)

// draw time bar
var color = $CDD8E0
if (forceRecharge) {
	color = $333366
}

if (chargeBar < CHARGE_BAR_MAX) {
	var WIDTH = 64
	
	draw_set_color($949FA8)
	draw_rectangle(x - WIDTH / 2 - 2, y - 50, x + WIDTH / 2 + 2, y - 42, true)
	draw_rectangle(x - WIDTH / 2 - 1, y - 49, x + WIDTH / 2 + 1, y - 43, true)
	draw_set_color(color)
	draw_rectangle(x - WIDTH / 2, y - 48, x + WIDTH * (chargeBar / CHARGE_BAR_MAX - .5), y - 44, false)
}


var PIP_SPACING = 30
for (var i = 0; i < HP_MAX; i++) {
	draw_sprite_ext(sHealthPip, hp > i, x - PIP_SPACING * (-(HP_MAX - 1) / 2 + i), y + 60, 2, 2, 0, c_white, 1)
}
