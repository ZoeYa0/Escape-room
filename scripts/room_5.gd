extends Node2D
#--------dialogues
@export var intro: DialogueResource
@export var computer: DialogueResource
#--------onreadys
func _ready() -> void:
	#FORCING pointing hand
	for node in get_tree().get_nodes_in_group("Buttons"):
		node.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
