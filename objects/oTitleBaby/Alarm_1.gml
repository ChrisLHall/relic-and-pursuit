/// @description hit sound
cloud = instance_create_layer((oTitlePlayerAttack.x + x) / 2, (oTitlePlayerAttack.y + y) / 2 + HIT_Y_OFFSET, layer, oHitCloud)
with (cloud) {
	if (oTitlePlayerAttack.x > x) {
		image_xscale *= -1;
	}
}

audio_play_sound_at(snd_upgrade, x, y, 0, 200, 400, 1, false, 15)
