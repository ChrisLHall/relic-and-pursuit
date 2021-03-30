key_attack = keyboard_check_pressed(vk_space);

if (key_attack) {
	sprite_index = Swing;
	image_index = 0;
	var attack = instance_create_layer(x + 26 * sign(image_xscale), y - 12, layer, oTitlePlayerAttack)
	attack.image_xscale = image_xscale
	attack.image_yscale = image_yscale
}
