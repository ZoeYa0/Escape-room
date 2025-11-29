extends Node2D


@onready var RoomResult: Node2D = $BoxStats

func _ready():
	for room_id in Events.rooms.keys():
		var data = Events.rooms[room_id]
		
		RoomResult.set_data(
		Events.rooms[room_id],
		data["time"],
		data["wrong"],
		data["hints"]
		)


func _on_pyreon_pressed() -> void:
	pass # Replace with function body.


func _on_calmisol_pressed() -> void:
	pass # Replace with function body.


func _on_endryl_pressed() -> void:
	pass # Replace with function body.


func _on_inertase_pressed() -> void:
	pass # Replace with function body.
