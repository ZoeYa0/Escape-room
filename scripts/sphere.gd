extends Button


func _ready() -> void:
	Events.room_lit.connect(on_room_lit)
	
func on_room_lit():
	disabled = true
