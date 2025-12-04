extends Node2D

@onready var total: Label = $Total
@onready var title: Label = $Title


#for room_id in Events.rooms.keys():
	#var data = Events.rooms[room_id]
	#
	#RoomResult.set_data(
	#Events.rooms[room_id],
	#data["time"],
	#data["wrong"],
	#data["hints"]
	#)
var total_time := 0
var total_wrong := 0
var total_hints := 0
func _ready() -> void:
	for room_name in Events.rooms:
		var stats = Events.rooms[room_name]

		var label: Label = $Labels.get_node(room_name)
		label.text = "Time: %d | Wrong: %d | Hints: %d" % [
			stats.time, stats.wrong, stats.hints
		]
		total_time += stats.time
		total_wrong += stats.wrong
		total_hints += stats.hints
	total.text = "Total stats:\n
	Total Time: %d
	Total Wrong attempts: %d
	Total Hints: %d" % [
	total_time, total_wrong, total_hints
	]#huh \n gives double breaks
	


@export var hue = 0.0

func _process(delta: float) -> void:
	title.modulate = Color.from_hsv(hue, 1.0, 1.0, 1.0)
	if hue < 1.0:
		hue += 0.001
	else:
		hue = 0.0

	
