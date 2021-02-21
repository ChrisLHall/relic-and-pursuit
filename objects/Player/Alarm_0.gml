/// @description Iframe blinking

if (is_invulnerable()) {
	blinkOn = !blinkOn
	if (blinkOn) {
		image_alpha = 1
	} else {
		image_alpha = 0.25
	}
	var timeToSet = BLINK_INTERVAL
	// blink slower if not moving
	if (!isMoving) {
		timeToSet *= 4
	}
	alarm_set(0, timeToSet)
} else {
	blinkOn = true
	image_alpha = 1
}
