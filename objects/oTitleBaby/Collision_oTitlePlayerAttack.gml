if (!invulnerable) {
  show_debug_message("HIT!!")
  invulnerable = true
  alarm_set(0, 50)
  alarm_set(1, 3)
  alarm_set(2, 1)
}
