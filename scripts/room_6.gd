extends Node2D

@onready var everything: Label = $Everything

@onready var RoomResult: Node2D = $BoxStats


#for room_id in Events.rooms.keys():
	#var data = Events.rooms[room_id]
	#
	#RoomResult.set_data(
	#Events.rooms[room_id],
	#data["time"],
	#data["wrong"],
	#data["hints"]
	#)
func _ready() -> void:
	for room_name in Events.rooms:
		var stats = Events.rooms[room_name]

		var label: Label = $Labels.get_node(room_name)
		label.text = "Time: %d | Wrong: %d | Hints: %d" % [
			stats.time, stats.wrong, stats.hints
		]




	
