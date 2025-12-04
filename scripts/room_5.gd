extends Node2D
#--------dialogues
@export var intro: DialogueResource
@export var computer: DialogueResource
#--------onreadys
var start_time = 0
func _ready() -> void:
	#FORCING pointing hand
	Events.current_room = 5
	for node in get_tree().get_nodes_in_group("Buttons"):
		node.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	start_time = Time.get_ticks_msec()

func _process(delta: float) -> void:
	Events.rooms["room5"]["time"] = (Time.get_ticks_msec() - start_time) / 1000.0
