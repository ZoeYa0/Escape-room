extends VideoStreamPlayer

var first_video = preload("res://other assets/elize drugged.ogv")
var second_video = preload("res://other assets/WhatsApp Video 2025-12-15 at 21.32.39.ogv")

@onready var warning_label: Label = $"../WarningLabel"

func _ready():
	AudioServer.set_bus_mute(1, true)
	stream = first_video
	play()
	finished.connect(_on_first_video_finished)

func _on_first_video_finished():
	stream = second_video
	play()
	finished.disconnect(_on_first_video_finished)
	finished.connect(_on_second_video_finished)

func _on_second_video_finished():
	get_tree().change_scene_to_file("res://scenes/room_7.tscn")
