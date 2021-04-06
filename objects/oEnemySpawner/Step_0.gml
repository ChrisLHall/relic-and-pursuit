if (!spawned && (Player.unlocks[UPGRADE_INDEX] || spawn_on_create)) {
	spawned = true;
	instance = instance_create_layer(x, y, layer, spawn_type);
}

if (!Player.dead && playerWasDead && spawned) {
	triggered_respawn = false;
	instance.silent_death = true;
	instance_destroy(instance);
	spawned = false;
}
playerWasDead = Player.dead;