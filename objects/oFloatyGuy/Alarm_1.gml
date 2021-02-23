/// @description shooting


if (state == floatystates.aggro) {
	state = floatystates.shoot;
	sprite_index = FloatyShoot
	image_index = 0
	// set a timer to start blasting
	alarm_set(1, 20)
} else if (state == floatystates.shoot) {
	blasting = true
}
