if (!UPGRADE_RECEIVED) {
	inst = instance_create_layer(x, y, layer, oDrawText);
	audio_play_sound(snd_upgrade, 11, false);
	with (inst) {
		STRING = "You have receieved the ability to drop down through thin platforms. Press Down to activate."
	}
	UPGRADE_RECEIVED = true;
	other.unlocks[UPGRADE_INDEX] = true
}
