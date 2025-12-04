extends Node2D
@onready var actual_hint: Label = $ActualHint


func _on_close_button_pressed() -> void:
	visible = false


func _on_show_hint_pressed() -> void:
	visible = true
	match Events.current_room:
		1:
			Events.rooms["room1"]["hints"] += 1
			match Events.rooms["room1"]["hints"]:
				1:
					actual_hint.text = "G=6,674e-11 \n
					m aarde = 5,972e34 kg"
				2:
					actual_hint.text = "M = 1,9884e30 kg"
				3:
					actual_hint.text = "Antwoord is zon"
		2:
			Events.rooms["room2"]["hints"] += 1
			match Events.rooms["room2"]["hints"]:
				1:
					actual_hint.text = "goed naar de kleur van streepjes kijken!"
				2:
					actual_hint.text = "Jullie moeten een strookje met indicator in een drank plaatsen en vervolgens kijken welke kleur verschijnt. Vergelijk die kleur met het schema. Als de kleur dicht bij de pH-waarde van 6 ligt, dan is het een geschikte drank. "
				3:
					actual_hint.text = "Antwoord is bio-synergy(paars)"
		3:
			Events.rooms["room3"]["hints"] += 1
			match Events.rooms["room3"]["hints"]:
				1:
					actual_hint.text = "+ betekent neuraliseren. - betekent niet en +- betekent gedeeltelijk"
				2:
					actual_hint.text = "Antwoord is Helix A (bruin)"
		4:
			Events.rooms["room4"]["hints"] += 1
			match Events.rooms["room4"]["hints"]:
				1:
					actual_hint.text = "Combinaties met Pyreon zijn onbetrouwbaar."
				2:
					actual_hint.text = "De juiste combinatie is calmisol en Inertase."
				3:
					actual_hint.text = "Is de generator aan? Trek de touw. Je moet ook de tube verbinden met de kast."
		5:
			Events.rooms["room5"]["hints"] += 1
			match Events.current_stickynote:
				null:
					actual_hint.text = "remember de eerste letter/cijfer is geldig. bij 4 moet je dat opsplitsen."
				1:
					actual_hint.text = "concentratie = c"
				2:
					actual_hint.text = "hypotenuse = h"
				3:
					actual_hint.text = "antwoord is 3 of -2"
				4:
					actual_hint.text = "Moeilijk? Jullie krijgen een hint: de dieren staan namelijk voor temperatuur. 
					Als jullie de opdracht goed lezen, wordt het duidelijk waarom we het hier over temperatuur hebben. 
					Denk er eerst aan dat je de gegevens voor waterstof naar een andere eenheid moet omzetten."
					
