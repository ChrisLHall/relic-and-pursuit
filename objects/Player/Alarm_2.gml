/// @description Restart on death

// reset music volume
audio_sound_gain(Distant_Horizon, 0.15, 0);
audio_sound_gain(ambiancebass, 0.25, 0);
audio_sound_gain(controlroom, 0.1, 0);
audio_sound_gain(event1, 0.1, 0);

audio_sound_gain(strangecorporation, 0, 0);


audio_stop_all()

room_restart()
