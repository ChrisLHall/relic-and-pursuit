// don't inherit bc we don't want the player.embush behavior
//event_inherited()

audio_play_sound_at(DEATH_SOUND, x, y, 0, 200, 400, 1, false, 15)
instance_create_layer(x, y, layer, oBabyDieVFX)

// yay
Player.wonGame = true;
