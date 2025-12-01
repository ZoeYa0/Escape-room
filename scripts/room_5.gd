extends Node2D
#--------dialogues
@export var intro: DialogueResource
@export var computer: DialogueResource
var energy
#--------onreadys
#@onready var RoomResult: Node2D = $BoxStats
@onready var power_light: ColorRect = $PowerLight
@onready var power_indicator: Node2D = $PowerIndicator
@onready var red: ColorRect = $PowerIndicator/Red
@onready var orange: ColorRect = $PowerIndicator/Orange
@onready var green: ColorRect = $PowerIndicator/Green
@onready var show_hint: Button = $ShowHint
@onready var arrow: Button = $Arrow
@onready var windows: Sprite2D = $Windows

func _ready():
	windows.visible = false
	Events.current_room = 4
	power_light.color = Color.DARK_RED
	#FORCING pointing hand
	for node in get_tree().get_nodes_in_group("Buttons"):
		node.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		

func _on_computer_pressed() -> void:
	DialogueManager.show_dialogue_balloon(computer,'start')

func _on_power_button_pressed() -> void:
	Events.power_on = true
	power_light.color = Color.GREEN


func _on_pull_button_pressed() -> void:
	print("DROP KEYS: ", Events.dropable_states.keys())

	if Events.dropable_states.has("FuelSlot") and Events.dropable_states.has("FuelSlot2") and Events.power_on == true:
		#size = 2 gives error
		var fuel1 = Events.dropable_states["FuelSlot"]
		var fuel2 = Events.dropable_states["FuelSlot2"]
		print(fuel1,fuel2)
		energy = get_reaction(fuel1, fuel2)

		print(energy)
		match energy:
			"Low":
				green.visible = true
				orange.visible = false
				red.visible = false
				await get_tree().create_timer(1.0).timeout
				lights_out()
			"None":
				green.visible = false
				orange.visible = false
				red.visible = false
			"High":
				green.visible = true
				orange.visible = true
				red.visible = true
				await get_tree().create_timer(1.0).timeout
				lights_out()
				
				
func get_reaction(a, b):
	if Events.REACTION_TABLE.has(a) and Events.REACTION_TABLE[a].has(b):
		return Events.REACTION_TABLE[a][b]
	elif Events.REACTION_TABLE.has(b) and Events.REACTION_TABLE[b].has(a):
		return Events.REACTION_TABLE[b][a]
func lights_out():
	if Events.straw_connected == false:
		green.visible = false
		orange.visible = false
		red.visible = false
	elif energy == "High":
		windows.visible = true


func _on_straw_pressed() -> void:
	Events.straw_connected = true


func _on_windows_pressed() -> void:
	pass # Replace with function body.
