key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_up);

var move = key_right - key_left;
xSpeed = move * WALK_SPEED;

//x = x + xSpeed
if (place_meeting(x + xSpeed, y, ObjWallBase)) {
	while (!place_meeting(x + sign(xSpeed), y, ObjWallBase)) {
		x += sign(xSpeed);	
	}
	xSpeed = 0;
} else {
	x += xSpeed;
}


if (inAir) {
	ySpeed += GRAV;
	if (place_meeting(x, y + ySpeed, ObjWallBase)) {
		while (!place_meeting(x, y + sign(ySpeed), ObjWallBase)) {
			y += sign(ySpeed);	
		}
		inAir = false;
		ySpeed = 0;
	} else {
		y += ySpeed;
	}
} else {
	ySpeed = 0;
	if (place_empty(x, y + 1)) {
		inAir = true;	
	} else if (key_jump) {
		inAir = true;
		ySpeed = JUMP_SPEED;
	}
}


// Animation
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
	if (xSpeed != 0) {
		sprite_index = RUN_SPRITE;	
	} else {
		sprite_index = IDLE_SPRITE;
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

