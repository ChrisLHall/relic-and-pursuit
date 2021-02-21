// Idle
function patrol() {
	if (!Player.isMoving) {
		return;
	}
	
	patrol_angle += patrol_dir * PATROL_SPEED
	targetPosX = xstart + dcos(patrol_angle) * PATROL_RADIUS
	targetPosY = ystart - dsin(patrol_angle) * PATROL_RADIUS
	
	if (targetPosX > x) {
		image_xscale = 1
	} else if (targetPosX < x) {
		image_xscale = -1
	}
	
	if (distance_to_object(Player) < aggro_range) {
		state = floatystates.aggro; // Switch states
		alarm_set(1, 60)
		audio_play_sound(floaty_aggro, 10, false)
	}
}

// Swoop
function aggro() {
	if (!Player.isMoving) {
		return;
	}
	
	targetPosX = x
	targetPosY = Player.y
	
	if (Player.x < x) {
		image_xscale = -1
	} else {
		image_xscale = 1	
	}
}

function shoot() {
	if (!Player.isMoving) {
		return;
	}
	
	// anything needed?
}

if (Player.isMoving) {
	image_speed = 1
} else {
	image_speed = 0
}

// move
if (Player.isMoving) {
	var newX = x
	var newY = y
	dir = point_direction(x, y, targetPosX, targetPosY);
	dist = point_distance(x, y, targetPosX, targetPosY);
	if (dist > speed_scale) {
		newX = x + dcos(dir) * speed_scale
		newY = y - dsin(dir) * speed_scale
	} else {
		newX = targetPosX
		newY = targetPosY
	}
	if (!place_meeting(newX, y, oWallBase)) {
		x = newX	
	}
	if (!place_meeting(x, newY, oWallBase)) {
		y = newY
	}
	
	// Recover from knockback
	if (abs(knockbackX) > KNOCKBACK_RECOVERY) {
		knockbackX -= sign(knockbackX) * KNOCKBACK_RECOVERY
	} else {
		knockbackX = 0	
	}
	if (abs(knockbackY) > KNOCKBACK_RECOVERY) {
		knockbackY -= sign(knockbackY) * KNOCKBACK_RECOVERY
	} else {
		knockbackY = 0
	}
}

switch (state) {
	case floatystates.patrol: patrol(); break;
	case floatystates.aggro: aggro(); break;
	case floatystates.shoot: shoot(); break;
}
