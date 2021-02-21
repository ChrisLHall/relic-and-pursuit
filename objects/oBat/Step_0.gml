// Idle
function idle() {
	if (!player_moving) {
		return;
	}
	if (distance_to_object(Player) < aggro_range) {
		state = state.swoop; // Switch states
		hdir = sign(Player.x - oBat.x); // Horizontal direction to player
	}
}

// Swoop
function swoop() {
	if (!player_moving) {
		return;
	}
	vdir = 1;
	// Bat too high, fly down
	if (oBat.y < Player.y - max_swoop + (Player.sprite_height + oBat.sprite_height) / 2) {
		vdir = 1;
	}
	// Bat too low, fly up
	if (oBat.y > Player.y + max_swoop - (Player.sprite_height + oBat.sprite_height) / 2) {
		vdir = -1;
	}

	dir = point_direction(x, y, Player.x, Player.y - Player.sprite_height / 2);
	dist = point_distance(x, y, Player.x, Player.y - Player.sprite_height / 2);
	if (dist > 2 * speed_scale) {
		x += dcos(dir) * speed_scale * knockback_scale_x;
		y -= dsin(dir) * speed_scale * knockback_scale_y;
	}
	
	// Reverse direction if necessary
	if ((abs(Player.x - oBat.x) > turn_distance) && (sign(Player.x - oBat.x) == -hdir)) {
		hdir = -hdir;
		image_xscale *= -1
	}
	
	// Recover from knockback
	knockback_scale_x = min(knockback_scale_x + KNOCKBACK_RECOVERY, 1);
	knockback_scale_y = min(knockback_scale_y + KNOCKBACK_RECOVERY, 1);
}

if (Player.xSpeed == Player.ySpeed && Player.xSpeed == 0) {
	player_moving = false;
} else {
	player_moving = true;
}

if (player_moving) {
	sprite_set_speed(sprite_index, 4, spritespeed_framespersecond);
} else {
	sprite_set_speed(sprite_index, 0, spritespeed_framespersecond);
}

switch (state) {
	case state.idle: idle(); break;
	case state.swoop: swoop(); break;
}
