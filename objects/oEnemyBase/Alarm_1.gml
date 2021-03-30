/// @description hit sound
cloud = instance_create_layer((oPlayerAttack.x + x) / 2, (oPlayerAttack.y + y) / 2 + HIT_Y_OFFSET, layer, oHitCloud)
with (cloud) {
	if (oPlayerAttack.x > x) {
		image_xscale *= -1;
	}
}

if (HIT_SOUND != -1) {
	audio_play_sound_at(HIT_SOUND, x, y, 0, 200, 400, 1, false, 15)
}
