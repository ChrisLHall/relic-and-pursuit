SOUND = short_swipe;
if (Player.unlocks[2]) {
	SOUND = long_swipe;
	image_blend = merge_colour(make_colour_rgb(122, 148, 153), c_white, 0.5);
}

audio_play_sound(SOUND, 10, false)

function can_hit() {
	return image_index < 2;
}