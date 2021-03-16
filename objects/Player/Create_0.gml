randomise()


WALK_SPEED = 5;
GRAV = .5;
JUMP_SPEED = -10;
TERMINAL_VELOCITY = 12;

xSpeed = 0;
ySpeed = 0;

inAir = false;
// 2nd unlock
doubleJumped = false;

xKnockback = 0;
X_KNOCKBACK_SPEED = 6;
X_KNOCKBACK_RECOVERY = .3;
Y_KNOCKBACK_SPEED = 4;

// read externally
isMoving = false;
isMovingFromAttack = false;

HP_MAX = 4
hp = HP_MAX
BLINK_INTERVAL = 5
INVULN_TIME = 80
blinkOn = true
invulnRemaining = 0

step = 0;
last_known_pos = [-1, -1];

dead = false

EMBUSH = false;

chargeBar = 1
// if you use up all your power you have to wait
forceRecharge = false 
CHARGE_BAR_MAX = 1
RECHARGE_RATE = .005
ATTACK_DISCHARGE = .4


// UNLOCKS
unlocks[0] = false
unlocks[1] = false
unlocks[2] = false
unlocks[3] = false
// 0 - drop
// 1 - double jump
// 2 - big attack
// 3 - fast recharge???

wonGame = false;
wonGameTimerStarted = false;
bboxerAnimFinished = 0;
//credits
transition_progress = 0;

// Animation
IDLE_SPRITE = Idle
RUN_SPRITE = Run
LEAP_SPRITE = Leap
FALL_SPRITE = Fall

jumpBuffer = 0;

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

function add_hp(amount) {
	hp = min(HP_MAX, hp + amount)	
}

function get_hit(attacker, doXKnockback, doYKnockback) {
	if (!is_invulnerable() && !dead) {
		hp = max(0, hp - attacker.DAMAGE)
		if (hp > 0) {
			audio_play_sound(player_hit, 15, false);
			if (doXKnockback) {
				xKnockback = X_KNOCKBACK_SPEED * sign(x - attacker.x)
			}
			if (doYKnockback) {
				ySpeed -= Y_KNOCKBACK_SPEED;
			}
			// start iframes
			invulnRemaining = INVULN_TIME
			alarm_set(0, 1)
		} else {
			// die
			dead = true
			invulnRemaining = 0
			chargeBar = CHARGE_BAR_MAX
			// fade music out
			audio_sound_gain(Distant_Horizon, 0, 400);
			audio_sound_gain(ambiancebass, 0, 400);
			audio_sound_gain(controlroom, 0, 400);
			audio_sound_gain(event1, 0, 400);
			audio_sound_gain(embush_loop, 0, 400);
	
			audio_sound_gain(strangecorporation, 0, 0);
			audio_play_sound(strangecorporation, 15, false);
			audio_sound_gain(strangecorporation, 0.25, 900);
	
			audio_play_sound(death_woops, 15, false);
			// game restarts after this anim finishes
			sprite_index = Death
			image_index = 0
		}
	}
}

function is_invulnerable() {
	return invulnRemaining > 0
}

audio_sound_gain(Distant_Horizon, 0, 0);
audio_play_sound(Distant_Horizon, 10, true);
audio_sound_gain(Distant_Horizon, 0.15, 400);
