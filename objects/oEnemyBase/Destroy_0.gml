if (!Player.EMBUSH) {
	instance_create_layer(x, y, layer, oPoofVFX)
	audio_play_sound_at(DEATH_SOUND, x, y, 0, 200, 400, 1, false, 15)
}
