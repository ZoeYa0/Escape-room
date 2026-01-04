extends Node2D

@onready var total: Label = $Total
@onready var title: Label = $Title
@onready var your_scores: Label = $YourScores
@onready var backup: Label = $Backup


var total_time := 0
var total_wrong := 0
var total_hints := 0

func _ready() -> void:
	print("UI _ready")
	await get_tree().process_frame
	print("After 1 frame")
	await get_tree().process_frame
	print("After 2 frames")
	print("Events.rooms keys: ", Events.rooms.keys())
	print("Events.rooms values: ", Events.rooms.values())
	
	
	
	AudioServer.set_bus_mute(1, false)
	title.text = tr("UI_THANKS")
	your_scores.text = tr("UI_YOURSCORE")
	
	for room_name in Events.rooms:
		var stats = Events.rooms[room_name]

		var label: Label = $Labels.get_node(room_name.to_lower())
		#label.text = tr('UI_SCORE') % [
			#stats.time, stats.wrong, stats.hints
		#]
		total_time += stats.time
		total_wrong += stats.wrong
		total_hints += stats.hints
		label.text = tr("UI_SCORE").format({
	"time": stats.time,
	"wrong": stats.wrong,
	"hints": stats.hints
})
	total.text = tr("UI_TOT_SCORE") % [
	total_time, total_wrong, total_hints
	]

@export var hue: float = 0.0

func _process(delta: float) -> void:
	# Hard safety: never allow null
	if hue == null:
		hue = 0.0

	title.modulate = Color.from_hsv(hue, 1.0, 1.0, 1.0)

	hue += 0.001
	if hue >= 1.0:
		hue = 0.0

	backup.text = str(Events.rooms.values() if Events.rooms != null else [])


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/room_6.tscn")
