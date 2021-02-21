/// @description Iframe blinking

blinksRemaining -= 1

if (blinksRemaining > 0) {
	blinkOn = !blinkOn
	if (blinkOn) {
		image_alpha = 1
	} else {
		image_alpha = 0.25
	}
	alarm_set(0, BLINK_INTERVAL)
} else {
	blinkOn = true
	image_alpha = 1	
}
