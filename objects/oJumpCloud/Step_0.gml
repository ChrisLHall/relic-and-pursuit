floatAwaySpeed = FLOAT_COEFFICIENT / power((image_index + 1), 2);

x -= SPEED * floatAwaySpeed + (floatAwaySpeed * sign(image_xscale));

show_debug_message(floatAwaySpeed)