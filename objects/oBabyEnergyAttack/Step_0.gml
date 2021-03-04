if Player.isMoving {
	lifeTimer--
	if lifeTimer == 0 {
		instance_destroy(self)
		return
	}
	
	// first slow down
	xSpeed -= SLOW_FACTOR * xSpeed
	ySpeed -= SLOW_FACTOR * ySpeed
	
	// now accelerate towards player
	var deltaX = Player.x - x
	var deltaY = Player.y - y
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
}