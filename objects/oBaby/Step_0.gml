function sleep() {
	if (distance_to_object(Player) < AGGRO_RANGE) {
		set_state(babystates.waking)
		audio_play_sound_at(bboxer_aggro, x, y, 0, 200, 400, 1, false, 15)
	}
}

function waking() {
	
}

function idle() {
	if (Player.x > x + TURN_AROUND_DIST) {
		image_xscale = 1
	} else if (Player.x < x - TURN_AROUND_DIST) {
		image_xscale = -1
	}
	
	if stateTimer > IDLE_STATE_TIME {
		set_state(babystates.attack)	
	}
}

function attack() {
	if stateTimer == ATTACK_SOUND_DELAY {
		audio_play_sound(bboxer_chargeup_sound, 15, false)	
	}
	if stateTimer == ATTACK_DELAY {
		var swipe = instance_create_layer(x, y, layer, oBabyAttack)
		swipe.image_xscale = image_xscale
	}
}

function teleport() {
	if stateTimer == TELEPORT_DELAY {
		teleport_somewhere()
		// face the player
		if (Player.x > x) {
			image_xscale = 1
		} else if (Player.x < x) {
			image_xscale = -1
		}
	}
	if (stateTimer == (TELEPORT_SOUND_1_DELAY - TELEPORT_BUFFER)) {
		can_do_damage = false;
	}
	if stateTimer == TELEPORT_SOUND_1_DELAY {
		audio_play_sound(bboxer_tp_1, 15, false)
	}
	if stateTimer == TELEPORT_SOUND_2_DELAY {
		audio_play_sound(bboxer_tp_2, 15, false)
	}
	if (stateTimer == (TELEPORT_SOUND_2_DELAY + TELEPORT_BUFFER)) {
		can_do_damage = true;
	}
}

function die() {
	
}


if (Player.isMoving) {
	stateTimer += 1
	image_speed = 1
} else {
	image_speed = 0
}

// move
/*
if (Player.isMoving) {
	var newX = x
	var newY = y
	dir = point_direction(x, y, targetPosX, targetPosY);
	dist = point_distance(x, y, targetPosX, targetPosY);
	if (dist > speed_scale) {
		newX = x + dcos(dir) * speed_scale + knockbackX
		newY = y - dsin(dir) * speed_scale + knockbackY
	} else {
		newX = targetPosX + knockbackX
		newY = targetPosY + knockbackY
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
*/

// sleep, waking, idle, attack, teleport, die };
// state machine
if (Player.isMoving) {
	switch (state) {
		case babystates.sleep: sleep(); break;
		case babystates.waking: waking(); break;
		case babystates.idle: idle(); break;
		case babystates.attack: attack(); break;
		case babystates.teleport: teleport(); break;
		case babystates.die: die(); break;
	}
}
