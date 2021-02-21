if (UPGRADE_RECEIVED) {
	sprite_index = sUpgradeReceived;
}

if (Player.isMoving) {
	sprite_set_speed(sprite_index, 7, spritespeed_framespersecond);
} else {
	sprite_set_speed(sprite_index, 0, spritespeed_framespersecond);
}
