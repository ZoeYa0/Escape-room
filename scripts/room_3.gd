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
