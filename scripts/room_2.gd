extends Node2D
@onready var arrow: Button = $Arrow
@onready var ph_image: Sprite2D = $PHImage
@onready var timer: Label = $Timer
@onready var hints: Node2D = $Hints
#-------------------------
@export var start_dialogue: DialogueResource
@export var room_2_finished: DialogueResource
@export var wrong_drink: DialogueResource
@export var died: DialogueResource
@export var dont_guess: DialogueResource

#-------------
var start_time = 0
var health = 1

func _ready() -> void:
	#FORCING pointing hand
	for node in get_tree().get_nodes_in_group("Buttons"):
		node.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		
	Events.current_room = 2
	start_time = Time.get_ticks_msec()
	arrow.visible = false
	ph_image.visible = false
	DialogueManager.show_dialogue_balloon(start_dialogue,"start")


func _process(delta: float) -> void:
	timer.text = str((Time.get_ticks_msec() - start_time) / 1000.0)

func _on_small_ph_pressed() -> void:
	ph_image.visible = true

func _on_good_pressed() -> void:
	#puzzle solved!
	if Events.can_puzzle_be_solved:
		arrow.visible = true
		DialogueManager.show_dialogue_balloon(room_2_finished,"start")
	else:
		DialogueManager.show_dialogue_balloon(dont_guess,"start")


func _on_green_button_pressed() -> void:
	DialogueManager.show_dialogue_balloon(wrong_drink,"start")


func _on_green_button_2_pressed() -> void:
	on_wrong_drink_pressed()


func _on_green_button_4_pressed() -> void:
	on_wrong_drink_pressed()


func _on_green_button_5_pressed() -> void:
	on_wrong_drink_pressed()


func _on_green_button_6_pressed() -> void:
	on_wrong_drink_pressed()
	
func on_wrong_drink_pressed():
	DialogueManager.show_dialogue_balloon(wrong_drink,"start")
	health -= 1
	if health == 0:
		DialogueManager.show_dialogue_balloon(died,"start")
		#await DialogueManager.bridge_get_line_completed
		#get_tree().reload_current_scene()
