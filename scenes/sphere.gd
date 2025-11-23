extends Button
signal angle_changed

func _on_pressed():
	angle_changed.emit()
