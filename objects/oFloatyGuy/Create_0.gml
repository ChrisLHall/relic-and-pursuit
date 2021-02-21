event_inherited()

enum floatystates { patrol, aggro, shoot };

hp = 4

aggro_range = 80;
state = floatystates.patrol;
speed_scale = 4;
patrol_angle = random(360)
patrol_dir = 1
if (random(1) < .5) {
	patrol_dir = -1	
}
PATROL_SPEED = 1.5
PATROL_RADIUS = 50

blasting = false

targetPosX = x
targetPosY = y

knockbackX = 0;
knockbackY = 0;
KNOCKBACK_CONSTANT = 4;
KNOCKBACK_RECOVERY = .15;
