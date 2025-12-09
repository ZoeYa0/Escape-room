extends Node2D
@onready var actual_hint: Label = $ActualHint

func _ready() -> void:
	visible = false
func _on_close_button_pressed() -> void:
	visible = false


func _on_show_hint_pressed() -> void:
	visible = true
	match Events.current_room:
		1:
			if Events.rooms["room1"]["hints"] < 3:
				Events.rooms["room1"]["hints"] += 1
			match Events.rooms["room1"]["hints"]:
				1:
					actual_hint.text = tr("HINTS_1.1")
				2:
					actual_hint.text = tr("HINTS_1.2")
				3:
					actual_hint.text = tr("HINTS_1.3")
		2:
			if Events.rooms["room2"]["hints"] < 3:
				Events.rooms["room2"]["hints"] += 1
			match Events.rooms["room2"]["hints"]:
				1:
					actual_hint.text = tr("HINTS_2.1")
				2:
					actual_hint.text = tr("HINTS_2.2")
				3:
					actual_hint.text = tr("HINTS_2.3")
		3:
			if Events.rooms["room3"]["hints"] < 3:
				Events.rooms["room3"]["hints"] += 1
			match Events.rooms["room3"]["hints"]:
				1:
					actual_hint.text = tr("HINTS_3.1")
				2:
					actual_hint.text = tr("HINTS_3.2")
				3:
					actual_hint.text = tr("HINTS_3.3")
		4:
			if Events.rooms["room4"]["hints"] < 3:
				Events.rooms["room4"]["hints"] += 1
			print(Events.rooms["room4"]["hints"])
			match Events.rooms["room4"]["hints"]:
				1:
					actual_hint.text = tr("HINTS_4.1")
				2:
					actual_hint.text = tr("HINTS_4.2")
				3:
					actual_hint.text = tr("HINTS_4.3")
		5:
			
			Events.rooms["room5"]["hints"] += 1
			match Events.current_stickynote:
				null:
					actual_hint.text = tr("HINTS_5.0")
				1:
					actual_hint.text = tr("HINTS_5.1")
				2:
					actual_hint.text = tr("HINTS_5.2")
				3:
					actual_hint.text = tr("HINTS_5.3")
				4:
					actual_hint.text = tr("HINTS_5.4")
					
