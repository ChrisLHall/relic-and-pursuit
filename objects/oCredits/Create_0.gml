progress = 0;
DRAW_SPEED = 0.04;

STRING = "PROGRAMMING AND DESIGN:\n"
if random(1) < .5 {
	STRING += "Panic Stevenson and Chris Hall\n\n"
} else {
	STRING += "Chris Hall and Panic Stevenson\n\n"
}
STRING += "VISUAL ASSETS:\n"
STRING += "0x72.itch.io\no-lobster.itch.io\npenusbmic.itch.io\n\n"; // TODO
STRING += "SOUNDS:\n"
STRING += "shapeforms.itch.io\nobsydianx.itch.io\nsfxr.me\n\n"; // TODO
STRING += "MUSIC / AMBIENCE:\n"
STRING += "Distant Horizon - Marcelo Fernandez\nkayugames.itch.io\n\n\n\n"; // TODO
STRING += "THANKS FOR PLAYING!!!";

audio_sound_gain(spaceship1, 0, 0);
audio_play_sound(spaceship1, 10, true);
audio_sound_gain(spaceship1, 0.20, 400);