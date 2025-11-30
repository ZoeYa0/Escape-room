extends Node2D
#--------dialogues
@export var intro: DialogueResource
@export var combien: DialogueResource
@export var computer: DialogueResource
#--------onreadys
@onready var RoomResult: Node2D = $BoxStats
@onready var power_light: ColorRect = $PowerLight
@onready var power_indicator: Node2D = $PowerIndicator
@onready var red: ColorRect = $PowerIndicator/Red
@onready var orange: ColorRect = $PowerIndicator/Orange
@onready var green: ColorRect = $PowerIndicator/Green

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


func _on_pull_button_pressed() -> void:
	if Events.dropable_states.size() == 2 and Events.power_on == true:
		var energy = get_reaction(Events.dropable_states[][],)
		match energy:
			"Low":
				green.visible = true
				orange.visible = false
				red.visible = false
			"None":
				green.visible = false
				orange.visible = false
				red.visible = false
			"High":
				green.visible = true
				orange.visible = true
				red.visible = true
				
func get_reaction(a, b):
	if Events.REACTION_TABLE.has(a) and Events.REACTION_TABLE[a].has(b):
		return Events.REACTION_TABLE[a][b]
	elif Events.REACTION_TABLE.has(b) and Events.REACTION_TABLE[b].has(a):
		return Events.REACTION_TABLE[b][a]
