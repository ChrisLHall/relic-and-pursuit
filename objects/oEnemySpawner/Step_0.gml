if (!instance_dead_forever && !spawned && ((UPGRADE_INDEX >= 0 && Player.unlocks[UPGRADE_INDEX]) || spawn_on_create)) {
	spawned = true;
	instance = instance_create_layer(x, y, layer, spawn_type);
}

// if instance dies and player has unlocked the next upgrade, never respawn
if (!instance_dead_forever && spawned && !instance_exists(instance) && Player.unlocks[UPGRADE_INDEX + 1]) {
	instance_dead_forever = true
	spawned = false
}

if (!Player.dead && playerWasDead) {
	triggered_respawn = false;
	if (instance_exists(instance)) {
		instance.silent_death = true;
		instance_destroy(instance);
	}
	spawned = false;
}
playerWasDead = Player.dead;
