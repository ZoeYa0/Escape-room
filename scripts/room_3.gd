extends  Node2D

@export var start_dialogue: DialogueResource
@export var microscope: DialogueResource
@export var room3_solved: DialogueResource
@export var wrong_virus: DialogueResource
@export var virus_pressed: DialogueResource
@onready var window_erased: Sprite2D = $WindowErased
@onready var answerpad: Control = $Answerpad


#---------------onreadys
@onready var arrow: Button = $Arrow
var start_time = 0

func _ready() -> void:
	Events.current_room = 3
	answerpad.room3_solved.connect(on_room3_solved)
	#FORCING pointing hand
	for node in get_tree().get_nodes_in_group("Buttons"):
		node.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	start_time = Time.get_ticks_msec()
	
func on_room3_solved():
	arrow.visible = true
	DialogueManager.show_dialogue_balloon(room3_solved,'start')

func _process(delta: float) -> void:
	Events.rooms["room3"]["time"] = (Time.get_ticks_msec() - start_time) / 1000.0

func _on_microscope_pressed() -> void:
	DialogueManager.show_dialogue_balloon(microscope,"start")



#---------------viruses
func _on_nexa_pressed() -> void:
	adding_virus("nexa_3")


func _on_zytphera_pressed() -> void:
	adding_virus("zytphera")


func _on_pandora_x_pressed() -> void:
	adding_virus("pandora_x")


func _on_helixona_pressed() -> void:
	adding_virus("helixona")

func adding_virus(virus):
	Events.virus = str(virus)
	DialogueManager.show_dialogue_balloon(virus_pressed,"start")


func _on_clean_window_pressed() -> void:
	window_erased.visible = true
