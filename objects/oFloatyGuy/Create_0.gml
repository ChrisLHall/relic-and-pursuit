event_inherited()

enum floatystates { patrol, aggro, shoot };

hp = 4

aggro_range = 240;
state = floatystates.patrol;
speed_scale = 4;
patrol_angle = random(360)
patrol_dir = 1
if (random(1) < .5) {
	patrol_dir = -1	
}
PATROL_SPEED = 1.5
PATROL_RADIUS_X = 40
PATROL_RADIUS_Y = 6

SHOOT_DELAY = 10
SHOOT_DELAY_2 = 40

stateTimer = 0
PATROL_STATE_TIME = 30
AGGRO_STATE_TIME = 30
SHOOT_STATE_TIME = 40

targetPosX = x
targetPosY = y

knockbackX = 0;
knockbackY = 0;
KNOCKBACK_CONSTANT = 8;
KNOCKBACK_RECOVERY = .2;

HIT_SOUND = floaty_hit;
DEATH_SOUND = basic_death;
