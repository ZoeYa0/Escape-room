extends Node2D

@onready var label: Label = $Label
@onready var text_r: Label = $TextR
@onready var text_l: Label = $TextL
@onready var answer_field: LineEdit = $AnswerField

@onready var book_opening_3458082: AudioStreamPlayer = $"../Audio/Book-opening-3458082"
@onready var click: AudioStreamPlayer = $"../Audio/Click"
@onready var rightanswer: AudioStreamPlayer = $"../Audio/Rightanswer"
@onready var wronganswer: AudioStreamPlayer = $"../Audio/Wronganswer"

func _on_close_button_pressed() -> void:
	visible = false


func _on_submit_button_pressed() -> void:
	var answer = answer_field.text.strip_edges()
	if Events.current_room == 1:
		if answer.to_lower() == tr('ANSWER_1'): 
			Events.show_crank.emit()
			rightanswer.play()
			visible = false
			
		else:
			Events.rooms["room1"]["wrong"] +=1
			wronganswer.play()


func _on_show_instructions_pressed() -> void:
	visible = true
	match Events.current_room:
		
		1:
			label.text = tr("INSTRUCTION_1")
		2:
			label.text = tr("INSTRUCTION_2")
		3:
			text_l.text = tr("INSTRUCTION_3.1")
			text_r.text = tr("INSTRUCTION_3.2")
			book_opening_3458082.play()
			
