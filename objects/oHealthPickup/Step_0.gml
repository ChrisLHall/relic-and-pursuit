/// @description hover and check for player

if Player.isMoving {
	timeCounter += 1
}
y = ystart - dsin(timeCounter * FLOAT_FREQ) * FLOAT_PIXELS

if place_meeting(x, y, Player) {
	instance_destroy(self)
	Player.add_hp(1)
	// TODO BETTER SOUND
	audio_play_sound(bboxer_teleport_sound, 20, false)
}
