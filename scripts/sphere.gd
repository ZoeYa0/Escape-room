extends Button
signal angle_changed
@onready var rays: Node2D = $"../../../Rays"

func _on_pressed():
	angle_changed.emit()

func _ready() -> void:
	rays.room_lit.connect(on_room_lit)
	
func on_room_lit():
	disabled = true
