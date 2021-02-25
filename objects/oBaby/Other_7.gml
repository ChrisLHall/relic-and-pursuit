if state == babystates.waking {
	set_state(babystates.idle)
} else if state == babystates.attack {
	set_state(babystates.idle)
} else if state == babystates.teleport {
	set_state(babystates.idle)
} else if state == babystates.die {
	instance_destroy(self)
}