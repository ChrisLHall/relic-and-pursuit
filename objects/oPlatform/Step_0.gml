/// @description Insert description here
// You can write your code in this editor

if (Player.isMoving) {
	if (isRaising) {
		image_speed = sprite_get_speed(RAISE_SPRITE);
	} else {
		image_speed = sprite_get_speed(COLLAPSE_SPRITE);
	}
	if (currentTimer > 0) {
		currentTimer -= 1
	}
	if (bufferTimer > 0) {
		bufferTimer -= 1
	}
} else {
	image_speed = 0;
}

if (currentTimer == 0) {
	if (isRaising) {
		sprite_index = COLLAPSE_SPRITE;
		image_index = 0;
		image_speed = sprite_get_speed(COLLAPSE_SPRITE);
		isRaising = false;
		currentTimer = 120;
	} else {
		sprite_index = RAISE_SPRITE;
		image_index = 0;
		image_speed = sprite_get_speed(RAISE_SPRITE);
		isRaising = true;
		currentTimer = 240;
	}
}

if ((sprite_index == COLLAPSE_SPRITE && image_index < 1) || (sprite_index == RAISE_SPRITE && image_index >= 3)) {
	// Reset to default
	mask_index = -1;
} else {
	mask_index = nullCollision;
}