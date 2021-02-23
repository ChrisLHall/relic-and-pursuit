/// @description stretchy

if (Player.isMoving) {
	x += shootSpeed * PROJECTILE_SPEED
	// destroy after a while
	if (abs(x - xstart) > 1000) {
		instance_destroy(self)	
	}
	image_xscale = min(MAX_SCALE, image_xscale + SCALE_INCREASE)
}
