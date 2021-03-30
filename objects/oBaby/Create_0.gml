event_inherited()

enum babystates { sleep, waking, idle, attack, teleport, die };

hp = 6

AGGRO_RANGE = 180;
CHASE_RANGE = 120;
state = babystates.sleep;
stateTimer = 0
angry = false

TURN_AROUND_DIST = 30
IDLE_STATE_TIME = 50

ATTACK_SOUND_DELAY = 6
ATTACK_DELAY = 48
TELEPORT_DELAY = 45
TELEPORT_SOUND_1_DELAY = 40
TELEPORT_SOUND_2_DELAY = 65
TELEPORT_BUFFER = 5
ENERGY_BALL_DELAY = 55
TELEPORT_X_DIST = 80
TELEPORT_Y_DIST = 40

// todo how to move/knockback
targetPosX = x
targetPosY = y

knockbackX = 0;
knockbackY = 0;
KNOCKBACK_CONSTANT = 8;
KNOCKBACK_RECOVERY = .2;

HIT_Y_OFFSET = -6;

HIT_SOUND = bboxer_hit;
DEATH_SOUND = bboxer_death;

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
	
	var foundSomewhere = false
	// search for a y destination that is on the ground
	var destY = Player.y - TELEPORT_Y_DIST
	for (var checkY = Player.y - TELEPORT_Y_DIST; checkY < Player.y + TELEPORT_Y_DIST; checkY += 1) {
		if !(place_meeting(destX, checkY, oWallBase) or place_meeting(destX, checkY, oWallOneWay)) and (place_meeting(destX, checkY + 1, oWallBase) or place_meeting(destX, checkY + 1, oWallOneWay)) {
			destY = checkY
			foundSomewhere = true
		}
	}
	
	if (foundSomewhere) {
		x = destX
		y = destY
	}
}
