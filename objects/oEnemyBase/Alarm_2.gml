/// @description iframe blinking

if (invulnerable) {
	blinkOn = !blinkOn
	if (blinkOn) {
		image_alpha = 1
	} else {
		image_alpha = 0.25
	}
	var timeToSet = BLINK_INTERVAL

	alarm_set(2, timeToSet)
} else {
	blinkOn = true
	image_alpha = 1
}
