/// @description hit sound
cloud = instance_create_layer((other.x + x) / 2, (other.y + y) / 2, layer, oHitCloud)
with (cloud) {
	if (other.x > x) {
		image_xscale *= -1;
	}
}

if (HIT_SOUND != -1) {
	audio_play_sound_at(HIT_SOUND, x, y, 0, 200, 400, 1, false, 15)
}
