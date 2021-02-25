event_inherited()

enum babystates { sleep, waking, idle, attack, teleport, die };

hp = 4

aggro_range = 60;
state = babystates.sleep;
stateTimer = 0
angry = false

IDLE_STATE_TIME = 70

TELEPORT_DELAY = 30

// todo how to move/knockback
targetPosX = x
targetPosY = y

knockbackX = 0;
knockbackY = 0;
KNOCKBACK_CONSTANT = 8;
KNOCKBACK_RECOVERY = .2;

function set_state(newState) {
	state = newState
	stateTimer = 0
	image_index = 0
	
	if (newState == babystates.sleep) {
		sprite_index = BBoxer_Sleep
	} else if (newState == babystates.waking) {
		sprite_index = BBoxer_Wake
	} else if (newState == babystates.idle) {
		//sprite_index = BBoxer_Idle
	} else if (newState == babystates.attack) {
		sprite_index = BBoxer_Attack
	}
}
