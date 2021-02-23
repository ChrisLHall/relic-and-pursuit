// do this first, before becoming invulnerable
if (other.can_hit() && !invulnerable) {
	knockbackX = sign(x - other.x) * KNOCKBACK_CONSTANT * random_range(.8, 1)
	knockbackY = KNOCKBACK_CONSTANT * .5
}

event_inherited()
