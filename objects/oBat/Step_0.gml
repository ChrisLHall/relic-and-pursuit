// Idle
function idle() {
	if (!Player.isMoving) {
		return;
	}
	if (distance_to_object(Player) < aggro_range) {
		state = state.swoop; // Switch states
		audio_play_sound(bat_aggro, 10, false)
	}
}

// Swoop
function swoop() {
	if (!Player.isMoving) {
		return;
	}
	
	dir = point_direction(x, y, Player.x, Player.y - Player.sprite_height / 2);
	dist = point_distance(x, y, Player.x, Player.y - Player.sprite_height / 2);
	if (dist > 2 * speed_scale) {
		x += dcos(dir) * speed_scale * knockback_scale_x;
		y -= dsin(dir) * speed_scale * knockback_scale_y;
	}
	
	// Reverse direction if necessary
	if ((abs(Player.x - oBat.x) > turn_distance) && (-sign(Player.x - oBat.x) != image_xscale)) {
		image_xscale = -sign(Player.x - oBat.x)
	}
	
	// Recover from knockback
	knockback_scale_x = min(knockback_scale_x + KNOCKBACK_RECOVERY, 1);
	knockback_scale_y = min(knockback_scale_y + KNOCKBACK_RECOVERY, 1);
	
	// give up if too far away
	if (dist > safe_distance) {
		state = state.gohome;
		knockback_scale_x = 1;
		knockback_scale_y = 1;
	}
}

function gohome() {
	if (!Player.isMoving) {
		return;
	}
	
	dir = point_direction(x, y, xstart, ystart);
	dist = point_distance(x, y, xstart, ystart);
	if (dist > 2 * speed_scale) {
		x += dcos(dir) * speed_scale;
		y -= dsin(dir) * speed_scale;
	} else {
		// made it home
		state = state.idle
	}	
	
	// Reverse direction if necessary
	image_xscale = -sign(dcos(dir))
}

if (Player.isMoving) {
	sprite_set_speed(sprite_index, 4, spritespeed_framespersecond);
} else {
	sprite_set_speed(sprite_index, 0, spritespeed_framespersecond);
}

switch (state) {
	case state.idle: idle(); break;
	case state.swoop: swoop(); break;
	case state.gohome: gohome(); break;
}
