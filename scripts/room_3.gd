extends  Node2D

@export var start_dialogue: DialogueResource
@export var microscope: DialogueResource
@export var correct_virus: DialogueResource
@export var wrong_virus: DialogueResource
@export var virus_pressed: DialogueResource

#---------------onreadys
@onready var arrow: Button = $Arrow

func _ready() -> void:
	Events.current_room = 3
	DialogueManager.show_dialogue_balloon(start_dialogue,"start")
	arrow.visible = false
	
	#FORCING pointing hand
	for node in get_tree().get_nodes_in_group("Buttons"):
		node.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND



func _on_microscope_pressed() -> void:
	DialogueManager.show_dialogue_balloon(microscope,"start")


#----------------viruss
func _on_brown_pressed() -> void:
	DialogueManager.show_dialogue_balloon(correct_virus,"start")
	arrow.visible = true


func _on_red_pressed() -> void:
	wrong_virus_clicked()

func _on_blue_pressed() -> void:
	wrong_virus_clicked()

func _on_gray_pressed() -> void:
	wrong_virus_clicked()

	
func wrong_virus_clicked():
	DialogueManager.show_dialogue_balloon(wrong_virus,"start")

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
