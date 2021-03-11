/// @description Stop death animation and restart

if (sprite_index == Death) {
	image_speed = 0
	image_index = image_number - 1
	
	inst = instance_create_layer(x, y, layer, oDrawText);
	with (inst) {
		STRING = "GAME OVER."
	}
	
	alarm_set(2, 330)
}
