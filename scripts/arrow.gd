extends Button
@export var destination_scene: int
@onready var opening_door_411632: AudioStreamPlayer = $"../Audio/Opening-door-411632"

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/room_" + str(destination_scene)+ ".tscn") 
	if Events.current_room == 3:
		opening_door_411632.play()
	
func _ready() -> void:
	visible = false
	if Events.puzzle_solved == false:
		visible = false
	Events.room_lit.connect(on_room_lit)
	
func on_room_lit():
	visible = true
