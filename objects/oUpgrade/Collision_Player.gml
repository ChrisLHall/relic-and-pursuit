if (!UPGRADE_RECEIVED) {
	inst = instance_create_layer(x, y, layer, oDrawText);
	audio_play_sound(snd_upgrade, 11, false);
	var cachedSelf = self;
	with (inst) {
		STRING = cachedSelf.MESSAGES[cachedSelf.UPGRADE_INDEX];
	}
	UPGRADE_RECEIVED = true;
	other.unlocks[UPGRADE_INDEX] = true
}
