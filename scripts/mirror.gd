extends Area2D

signal room_lit

func trigger_light():
	emit_signal("room_lit")
