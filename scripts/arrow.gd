extends Button
@export var destination_scene: int

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/room_" + str(destination_scene)+ ".tscn") 
	
func _ready() -> void:
	visible = false
	Events.room_lit.connect(on_room_lit)
	
func on_room_lit():
	visible = true
