extends Node2D
#--------dialogues
@export var intro: DialogueResource
@export var combien: DialogueResource
@export var computer: DialogueResource
#--------onreadys
@onready var RoomResult: Node2D = $BoxStats

func _ready():
	Events.current_room = 4
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
