extends Button
signal angle_changed

func _on_pressed():
	angle_changed.emit()

func _ready() -> void:
	Events.room_lit.connect(on_room_lit)
	
func on_room_lit():
	disabled = true
