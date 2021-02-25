// do this first, before becoming invulnerable
if (other.can_hit() && !invulnerable) {
	knockback_scale_x = KNOCKBACK_CONSTANT
	knockback_scale_y = KNOCKBACK_CONSTANT * .7
}

event_inherited()
