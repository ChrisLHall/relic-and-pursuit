event_inherited()

enum babystates { sleep, waking, idle, attack, teleport, die };

hp = 4

AGGRO_RANGE = 60;
CHASE_RANGE = 120;
state = babystates.sleep;
stateTimer = 0
angry = false

TURN_AROUND_DIST = 30
IDLE_STATE_TIME = 50

ATTACK_DELAY = 32
TELEPORT_DELAY = 50
TELEPORT_X_DIST = 80
TELEPORT_Y_DIST = 40

// todo how to move/knockback
targetPosX = x
targetPosY = y

knockbackX = 0;
knockbackY = 0;
KNOCKBACK_CONSTANT = 8;
KNOCKBACK_RECOVERY = .2;

HIT_SOUND = bboxer_hit;

function set_state(newState) {
	state = newState
	stateTimer = 0
	image_index = 0
	
	if (newState == babystates.sleep) {
		sprite_index = BBoxer_Sleep
	} else if (newState == babystates.waking) {
		sprite_index = BBoxer_Wake
	} else if (newState == babystates.idle) {
		sprite_index = BBoxer_Idle
	} else if (newState == babystates.attack) {
		sprite_index = BBoxer_Attack
	} else if (newState == babystates.teleport) {
		sprite_index = BBoxer_Teleport
	}
}


function teleport_somewhere() {
	// choose a place to the right or left of the player
	var destX = Player.x - TELEPORT_X_DIST
	if random(1) < .5 {
		// to the right of the player
		destX = Player.x + TELEPORT_X_DIST
	}
	
	show_debug_message("teleporting")
	
	var foundSomewhere = false
	// search for a y destination that is on the ground
	var destY = Player.y - TELEPORT_Y_DIST
	for (var checkY = Player.y - TELEPORT_Y_DIST; checkY < Player.y + TELEPORT_Y_DIST; checkY += 1) {
		if !(place_meeting(destX, checkY, oWallBase) or place_meeting(destX, checkY, oWallOneWay)) and (place_meeting(destX, checkY + 1, oWallBase) or place_meeting(destX, checkY + 1, oWallOneWay)) {
			destY = checkY
			foundSomewhere = true
			show_debug_message("found dest y " + string(destY))
		}
	}
	
	if (foundSomewhere) {
		x = destX
		y = destY
	}
}
