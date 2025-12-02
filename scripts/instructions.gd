extends Node2D
@onready var answer_field = $AnswerField


func _on_close_button_pressed() -> void:
	visible = false


func _on_show_puzzle_button_pressed() -> void:
	visible = true


func _on_submit_button_pressed() -> void:
	
	var answer = answer_field.text.strip_edges()
	if Events.current_room == 1:
		if answer.to_lower() == "zon": 
			Events.show_crank.emit()
			visible = false


func _on_show_instructions_pressed() -> void:
	visible = true
