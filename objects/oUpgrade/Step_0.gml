if (UPGRADE_RECEIVED) {
	sprite_index = sUpgradeReceived;
}


// hack
if (UPGRADE_INDEX == 0) {
	if (UPGRADE_RECEIVED and TIMER >= 0) {
		TIMER -= 1;
	}
	if (TIMER == 0) {
		audio_play_sound(controlroom, 12, true);
		TIMER -= 100;
	}
}

if (Player.isMoving) {
	sprite_set_speed(sprite_index, 7, spritespeed_framespersecond);
} else {
	sprite_set_speed(sprite_index, 0, spritespeed_framespersecond);
}
