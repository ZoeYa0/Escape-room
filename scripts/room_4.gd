extends Node2D
#--------dialogues
@export var intro: DialogueResource
@export var combien: DialogueResource
@export var computer: DialogueResource
#--------onreadys
@onready var RoomResult: Node2D = $BoxStats
@onready var power_light: ColorRect = $PowerLight

func _ready():
	Events.current_room = 4
	power_light.color = Color.DARK_RED
	#FORCING pointing hand
	for node in get_tree().get_nodes_in_group("Buttons"):
		node.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		
func _on_pyreon_pressed() -> void:
	pass # Replace with function body.


func _on_calmisol_pressed() -> void:
	pass # Replace with function body.


func _on_endryl_pressed() -> void:
	pass # Replace with function body.


func _on_inertase_pressed() -> void:
	pass # Replace with function body.


func _on_computer_pressed() -> void:
	DialogueManager.show_dialogue_balloon(computer,'start')

func _on_power_button_pressed() -> void:
	Events.power_on = true
	power_light.color = Color.GREEN
