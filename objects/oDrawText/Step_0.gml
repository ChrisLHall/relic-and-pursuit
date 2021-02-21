if (TIMER) {
	TIMER -= 1;
} else {
	instance_destroy();
}

if (ALPHA < 1) {
	ALPHA += .05;
}
