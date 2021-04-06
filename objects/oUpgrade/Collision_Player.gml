if (!UPGRADE_RECEIVED) {
	Player.hp = Player.HP_MAX;
	inst = instance_create_layer(x, y, layer, oDrawText);
	audio_play_sound(snd_upgrade, 11, false);
	var cachedSelf = self;
	with (inst) {
		STRING = cachedSelf.MESSAGES[cachedSelf.UPGRADE_INDEX];
	}
	UPGRADE_RECEIVED = true;
	other.unlocks[UPGRADE_INDEX] = true
	var cacheGain = audio_sound_get_gain(SOUNDS[UPGRADE_INDEX]);
	audio_sound_gain(SOUNDS[UPGRADE_INDEX], 0, 0);
	audio_play_sound(SOUNDS[UPGRADE_INDEX], 12, true);
	audio_sound_gain(SOUNDS[UPGRADE_INDEX], cacheGain, 15000); // 15 seconds
}
