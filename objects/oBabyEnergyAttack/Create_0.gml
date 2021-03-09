DAMAGE = 1

lifeTimer = irandom_range(100, 200)

ACCEL_FACTOR = 1.008
START_SPEED = 2

xSpeed = 0
ySpeed = 0


randomOffsetAngle = random_range(0, 360)
randomOffsetSpeed = random_range(-5, 5)

glowPhase = random_range(0, 360)

audio_play_sound(floaty_shoot, 10, false)

function start_moving_towards(targetX, targetY) {
	var dir = point_direction(x, y, targetX, targetY)
	xSpeed = dcos(dir) * START_SPEED
	ySpeed = -dsin(dir) * START_SPEED
}
