/// @description Restart on death

// reset music volume
audio_sound_gain(Distant_Horizon, 0.15, 1);
audio_sound_gain(ambiancebass, 0.25, 1);
audio_sound_gain(controlroom, 0.1, 1);
audio_sound_gain(event1, 0.1, 1);

game_restart()
