if (other.can_hit() && !invulnerable) {
	hp -= 1
	if (hp <= 0) {
		// TODO VFX SFX
		instance_destroy(self)
	} else {
		invulnerable = true
		alarm_set(0, 20)
		alarm_set(1, 5)
	}
}