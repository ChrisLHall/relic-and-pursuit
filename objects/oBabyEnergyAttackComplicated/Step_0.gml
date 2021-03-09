glowPhase += 20
image_alpha = .7 + dcos(glowPhase) * .3

if Player.isMoving {
	// first slow down
	xSpeed -= SLOW_FACTOR * xSpeed
	ySpeed -= SLOW_FACTOR * ySpeed
	
	// now accelerate towards target
	var xOffset = dcos(randomOffsetAngle)
	var yOffset = -dsin(randomOffsetAngle)
	randomOffsetAngle += randomOffsetSpeed
	var deltaX = (targetX + xOffset * 8) - x
	var deltaY = (targetY + yOffset * 8) - y
	xSpeed += deltaX * ACCEL_FACTOR
	ySpeed += deltaY * ACCEL_FACTOR
	
	// top speed
	var currentSpeed = sqrt(sqr(xSpeed) + sqr(ySpeed))
	if (currentSpeed > TOP_SPEED) {
		xSpeed *= (TOP_SPEED / currentSpeed)
		ySpeed *= (TOP_SPEED / currentSpeed)
	}
	
	x += xSpeed
	y += ySpeed
	
	
	lifeTimer--
	if lifeTimer == 0 {
		instance_destroy(self)
	}
}

if Player.isMoving {
	image_speed = 1
} else {
	image_speed = 0	
}