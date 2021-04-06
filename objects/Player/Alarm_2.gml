/// @description Restart on death

hp = HP_MAX;
sprite_index = Idle;
dead = false;
image_speed = 1;
EMBUSH = false;

audio_sound_gain(Distant_Horizon, 0.15, 400);
audio_sound_gain(ambiancebass, 0.25, 400);
audio_sound_gain(controlroom, 0.1, 400);
audio_sound_gain(event1, 0.1, 400);
	
audio_stop_sound(strangecorporation);
audio_stop_sound(death_woops);


if (unlocks[2]) {
	var inst = get_upgrade_at_index(2);
	x = inst.x + 32;
	y = inst.y;
} else if (unlocks[1]) {
	var inst = get_upgrade_at_index(1);
	x = inst.x + 32;
	y = inst.y;
} else if (unlocks[0]) {
	var inst = get_upgrade_at_index(0);
	x = inst.x + 32;
	y = inst.y;
} else {
	x = xstart;
	y = ystart;
}
