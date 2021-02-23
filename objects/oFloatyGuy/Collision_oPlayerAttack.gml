event_inherited()

if (other.can_hit() && !invulnerable) {
	knockbackX = sign(other.x - x) * KNOCKBACK_CONSTANT * random_range(.5, 1)
	knockbackY = KNOCKBACK_CONSTANT * random_range(-1, 1)
}