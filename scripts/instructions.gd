extends Node2D
@onready var answer_field = $AnswerField


func _on_close_button_pressed() -> void:
	visible = false


func _on_show_puzzle_button_pressed() -> void:
	visible = true


func _on_submit_button_pressed() -> void:
	
	var answer = answer_field.text.strip_edges()

	if answer.to_lower() == "zon":        # correct answer
		print("Correct!")
		Events.can_curtains_open = true
		visible = false
		
	else:
		print("Wrong answer!")
