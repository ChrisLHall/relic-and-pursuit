if not pressed {
	pressed = true
	alarm_set(0, 120)
	oScreenFade.alphaTarget = 1
	audio_play_sound(snd_upgrade, 10, false)
}
