extends VideoStreamPlayer


func _ready():
	AudioServer.set_bus_mute(1, true)
	stream = load("res://other assets/elize drugged.ogv")
	play()
	# Connect the finished signal using a callable
	finished.connect(_on_first_video_finished)

func _on_first_video_finished():
	# Play the second video
	stream = load("res://other assets/WhatsApp Video 2025-12-15 at 21.32.39.ogv")
	play()
	finished.disconnect(_on_first_video_finished)
	finished.connect(_on_second_video_finished)

func _on_second_video_finished():
	get_tree().change_scene_to_file("res://scenes/room_7.tscn")
