if state == babystates.waking {
	set_state(babystates.idle)
} else if state == babystates.attack {
	// teleport if the player is running, or if you feel like it
	if point_distance(x, y, Player.x, Player.y) > CHASE_RANGE || random(1) < .3 {
		set_state(babystates.teleport)
	} else {
		set_state(babystates.idle)
	}
} else if state == babystates.teleport {
	set_state(babystates.idle)
	var energy = instance_create_layer(x, y - 20, layer, oBabyEnergyAttack)
	energy.start_moving_towards(Player.x, Player.y - 20)
} else if state == babystates.die {
	instance_destroy(self)
}