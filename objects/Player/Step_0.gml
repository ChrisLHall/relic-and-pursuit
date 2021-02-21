key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_up);
key_attack = keyboard_check_pressed(vk_space);

// Movement //////////////////////////////////////

var move = key_right - key_left;
var tryingToRun = key_right || key_left;
xSpeed = move * WALK_SPEED;

//x = x + xSpeed
if (check_for_wall(x + xSpeed, y)) {
	// grid align
	// x = round(x)
	while (!check_for_wall(x + sign(xSpeed), y)) {
		x += sign(xSpeed);	
	}
	xSpeed = 0;
} else {
	x += xSpeed;
}


if (inAir) {
	ySpeed += GRAV;
	if (check_for_wall(x, y + ySpeed)) {
		// grid align
		// y = round(y)
		while (!check_for_wall(x, y + sign(ySpeed))) {
			y += sign(ySpeed);	
		}
		inAir = false;
		ySpeed = 0;
	} else {
		y += ySpeed;
	}
} else {
	ySpeed = 0;
	if (!check_for_wall(x, y + 1)) {
		inAir = true;	
	} else if (key_jump) {
		inAir = true;
		ySpeed = JUMP_SPEED;
	}
}

// see if this fkn sucks
x = round(x)
y = round(y)

// Animation and facing ////////////////////////////////////

if (xSpeed > 0) {
	image_xscale = 1	
} else if (xSpeed < 0) {
	image_xscale = -1
}

if (inAir) {
	if (ySpeed < 0) {
		sprite_index = LEAP_SPRITE;	
	} else {
		sprite_index = FALL_SPRITE;
	}
} else {
	if (tryingToRun) {
		sprite_index = RUN_SPRITE;	
	} else {
		sprite_index = IDLE_SPRITE;
	}
}


// Attack //////////////////////////////////////

chargeBar = min(CHARGE_BAR_MAX, chargeBar + RECHARGE_RATE)
if (chargeBar == CHARGE_BAR_MAX) {
	forceRecharge = false;	
}

if (key_attack && chargeBar > 0 && !forceRecharge) {
	var attack = instance_create_layer(x, y, layer, oPlayerAttack)
	attack.image_xscale = image_xscale
	chargeBar = max(0, chargeBar - ATTACK_DISCHARGE)
	if (chargeBar == 0) {
		forceRecharge = true
	}
}


// TODO REMOVE
if (keyboard_check(vk_backspace)) {
	x = xstart;
	y = ystart;
	xSpeed = 0;
	ySpeed = 0;
}

// TODO MOVE THIS ELSEWHERE?
if (keyboard_check(vk_f8)) {
	game_end();
}

