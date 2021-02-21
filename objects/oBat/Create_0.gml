enum state { idle, swoop, gohome };
max_swoop = 8;
turn_distance = 10;
aggro_range = 180;
safe_distance = 360;
state = state.idle;
speed_scale = 2;

knockback_scale_x = 1;
knockback_scale_y = 1;
KNOCKBACK_CONSTANT = -4;
KNOCKBACK_RECOVERY = .15;

DAMAGE = 1

hp = 3
invulnerable = false

// TODO: Move to player
player_moving = false;