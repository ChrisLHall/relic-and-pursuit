if (other.can_hit() && !invulnerable) {
	knockback_scale_x = KNOCKBACK_CONSTANT
	knockback_scale_y = KNOCKBACK_CONSTANT * .5
	
	hp -= 1
	if (hp <= 0) {
		// TODO VFX SFX
		instance_destroy(self)
	} else {
		invulnerable = true
		alarm_set(0, 20)
	}
}