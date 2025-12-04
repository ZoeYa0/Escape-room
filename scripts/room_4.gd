extends Node2D
#--------dialogues
@export var intro: DialogueResource
@export var computer: DialogueResource
@export var fuel_combined: DialogueResource
#--------onreadys
@onready var room_3: Sprite2D = $Room3
@onready var windows: Button = $Windows
@onready var show_hint: Button = $ShowHint
@onready var show_instructions: Button = $ShowInstructions
@onready var hints: Node2D = $Hints
@onready var fuel: Node2D = $Fuel
@onready var pull_button: Button = $PullButton
@onready var pngwing_com: Sprite2D = $Pngwing_com
@onready var reset: Button = $Reset
@onready var straw: Sprite2D = $Straw

@onready var generator: Node2D = $Generator
@onready var power_button: Button = $Generator/PowerButton
@onready var power_light: ColorRect = $Generator/PowerLight
@onready var power_indicator: Node2D = $Generator/PowerIndicator
@onready var answers: Node2D = $Generator/Answers
@onready var fuel_slot: StaticBody2D = $Generator/Answers/FuelSlot
@onready var fuel_slot_2: StaticBody2D = $Generator/Answers/FuelSlot2
@onready var tube: Area2D = $Tube
@onready var collision_polygon_2d: CollisionPolygon2D = $Tube/CollisionPolygon2D
@onready var untitled_1220251202184007: Sprite2D = $Tube/Untitled1220251202184007
@onready var red: ColorRect = $Generator/PowerIndicator/Red
@onready var orange: ColorRect = $Generator/PowerIndicator/Orange
@onready var green: ColorRect = $Generator/PowerIndicator/Green

var start_time = 0

func _ready():
	straw.visible = false
	hints.visible = false
	windows.visible = false
	Events.current_room = 4
	Events.tube_clicked.connect(on_tube_clicked)
	power_light.color = Color.DARK_RED
	#FORCING pointing hand
	for node in get_tree().get_nodes_in_group("Buttons"):
		node.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	start_time = Time.get_ticks_msec()

func _process(delta: float) -> void:
	Events.rooms["room4"]["time"] = (Time.get_ticks_msec() - start_time) / 1000.0
	
func on_tube_clicked():
	Events.straw_connected = true
	straw.visible = true
	
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
		Events.energy = get_reaction(fuel1, fuel2)

		print(Events.energy)
		DialogueManager.show_dialogue_balloon(fuel_combined,'start')
		match Events.energy:
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
				await get_tree().create_timer(3.0).timeout
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
	elif Events.energy == "High":
		windows.visible = true



func _on_windows_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/room_5.tscn") 


func _on_reset_pressed() -> void:
	get_tree().reload_current_scene()


func _on_show_hint_pressed() -> void:
	hints.visible = true


	
