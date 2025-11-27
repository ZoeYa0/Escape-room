extends Node2D


@onready var arrow: Button = $Arrow

#-----------------
@export var start_dialogue: DialogueResource
@export var microscope: DialogueResource
@export var correct_answer: DialogueResource
@export var wrong_answer: DialogueResource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_dialogue_balloon(start_dialogue,"start")
	arrow.visible = false


func _on_microscope_pressed() -> void:
	DialogueManager.show_dialogue_balloon(microscope,"start")


func _on_brown_pressed() -> void:
	DialogueManager.show_dialogue_balloon(correct_answer,"start")
	arrow.visible = true


func _on_red_pressed() -> void:
	wrong_answer_clicked()


func _on_blue_pressed() -> void:
	wrong_answer_clicked()


func _on_gray_pressed() -> void:
	wrong_answer_clicked()
	
func wrong_answer_clicked():
	DialogueManager.show_dialogue_balloon(wrong_answer,"start")
