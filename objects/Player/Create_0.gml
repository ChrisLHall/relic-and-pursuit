WALK_SPEED = 5;
GRAV = .5;
JUMP_SPEED = -10;
TERMINAL_VELOCITY = 12;

xSpeed = 0;
ySpeed = 0;

inAir = false;

xKnockback = 0;
X_KNOCKBACK_SPEED = 6;
X_KNOCKBACK_RECOVERY = .3;
Y_KNOCKBACK_SPEED = 4;

isMoving = false;

HP_MAX = 3
hp = HP_MAX
BLINK_INTERVAL = 5
INVULN_BLINKS = 20
blinksRemaining = 0
blinkOn = true

chargeBar = 1
// if you use up all your power you have to wait
forceRecharge = false 
CHARGE_BAR_MAX = 1
RECHARGE_RATE = .005
ATTACK_DISCHARGE = .25



// Animation
IDLE_SPRITE = Idle
RUN_SPRITE = Run
LEAP_SPRITE = Leap
FALL_SPRITE = Fall


function check_for_wall(xPos, yPos, includeOneWay) {
	if (place_meeting(xPos, yPos, oWallBase)) {
		return true;	
	}
	if (includeOneWay and (ySpeed >= 0 or !inAir) and place_meeting(xPos, yPos, oWallOneWay)) {
		// see if we are above the wall
		var wallInstance = instance_place(xPos, yPos, oWallOneWay)
		if (wallInstance.bbox_top >= y) {
			return true;	
		}
	}
	return false;
}


function get_hit(attacker) {
	if (!is_invulnerable()) {
		hp = max(0, hp - attacker.DAMAGE)
		xKnockback = X_KNOCKBACK_SPEED * sign(x - attacker.x)
		ySpeed -= Y_KNOCKBACK_SPEED;
		// start iframes
		blinksRemaining = INVULN_BLINKS
		alarm_set(0, 1)
	}
}

function is_invulnerable() {
	return blinksRemaining > 0
}

audio_play_sound(Distant_Horizon, 10, true);
