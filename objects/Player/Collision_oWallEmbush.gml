if (!EMBUSH) {
	EMBUSH = true;
	audio_sound_gain(Distant_Horizon, 0, 5000);
	audio_sound_gain(ambiancebass, 0, 5000);
	audio_sound_gain(controlroom, 0, 5000);
	audio_sound_gain(event1, 0, 5000);
	audio_sound_gain(embush_loop, 0, 0);
	audio_play_sound(embush_loop, 12, true);
	audio_sound_gain(embush_loop, 0.2, 3000);
}