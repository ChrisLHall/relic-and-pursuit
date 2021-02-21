// Idle
function idle() {
	if (distance_to_object(Player) < aggro_range) {
		state = state.swoop; // Switch states
		hdir = sign(Player.x - oBat.x); // Horizontal direction to player
	}
}

// Swoop
function swoop() {
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
	x += dcos(dir) * speed_scale;
	y -= dsin(dir) * speed_scale;
	
	// Reverse direction if necessary
	if ((abs(Player.x - oBat.x) > turn_distance) && (sign(Player.x - oBat.x) == -hdir)) {
		hdir = -hdir;
		image_xscale *= -1
	}
}

switch (state) {
 case state.idle: idle(); break;
 case state.swoop: swoop(); break;
}
