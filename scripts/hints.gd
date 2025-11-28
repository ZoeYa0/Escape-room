extends Node2D
@onready var actual_hint: Label = $ActualHint


func _on_close_button_pressed() -> void:
	visible = false


func _on_show_hint_pressed() -> void:
	visible = true
	if Events.current_room == 1:
		if Events.can_curtains_open == false:
			Events.rooms["room1"]["hints"] += 1
			match Events.rooms["room1"]["hints"]:
				1:
					actual_hint.text = "G=6,674e-11 \n
					m aarde = 5,972e34 kg"
				2:
					actual_hint.text = "M = 1,9884e30 kg"
				3:
					actual_hint.text = "Antwoord is zon"
	if Events.current_room == 2:
		Events.rooms["room2"]["hints"] += 1
		match Events.rooms["room2"]["hints"]:
			1:
				actual_hint.text = "goed naar de kleur van streepjes kijken!"
			2:
				actual_hint.text = "Jullie moeten een strookje met indicator in een drank plaatsen en vervolgens kijken welke kleur verschijnt. Vergelijk die kleur met het schema. Als de kleur dicht bij de pH-waarde van 6 ligt, dan is het een geschikte drank. "
			3:
				actual_hint.text = "Antwoord is bio-synergy(paars)"
	if Events.current_room == 3:
		Events.rooms["room3"]["hints"] += 1
		match Events.rooms["room3"]["hints"]:
			1:
				actual_hint.text = "+ betekent neuraliseren. - betekent niet en +- betekent gedeeltelijk"
			2:
				actual_hint.text = "Antwoord is Helix A (bruin)"
