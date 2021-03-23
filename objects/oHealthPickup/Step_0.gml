/// @description hover and check for player

if Player.isMoving {
	timeCounter += 1
}
y = (ystart - FLOAT_PIXELS) - dsin(timeCounter * FLOAT_FREQ) * (FLOAT_PIXELS * 2)

if place_meeting(x, y, Player) {
	instance_destroy(self)
	Player.add_hp(1)
	audio_play_sound(hp_pickup, 20, false)
}
