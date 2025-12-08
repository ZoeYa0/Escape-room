extends Node2D
@onready var answer_field = $AnswerField
@onready var label: Label = $Label
@onready var text_r: Label = $TextR
@onready var text_l: Label = $TextL

func _ready() -> void:
	
	match Events.current_room:
		1:
			label.text = tr("INSTRUCTION_1")
		2:
			label.text = tr("INSTRUCTION_2")
		3:
			text_l.text = tr("INSTRUCTION_3.1")
			text_r.text = tr("INSTRUCTION_3.2")#bad bad setup. need label for all nodes

func _on_close_button_pressed() -> void:
	visible = false


func _on_submit_button_pressed() -> void:
	$Click.play()
	var answer = answer_field.text.strip_edges()
	if Events.current_room == 1:
		if answer.to_lower() == tr('ANSWER_1'): 
			Events.show_crank.emit()
			visible = false
			
		else:
			Events.rooms["room1"]["wrong"] +=1


func _on_show_instructions_pressed() -> void:
	visible = true
