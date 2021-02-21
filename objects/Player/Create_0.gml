WALK_SPEED = 5;
GRAV = .5;
JUMP_SPEED = -10;

xSpeed = 0;
ySpeed = 0;

inAir = false;


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


function check_for_wall(xPos, yPos) {
	if (place_meeting(xPos, yPos, oWallBase)) {
		return true;	
	}
	if ((ySpeed >= 0 or !inAir) && place_meeting(xPos, yPos, oWallOneWay)) {
		// see if we are above the wall
		var wallInstance = instance_place(xPos, yPos, oWallOneWay)
		if (wallInstance.bbox_top >= y) {
			return true;	
		}
	}
	return false;
}