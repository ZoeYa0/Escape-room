extends Node2D




func _on_english_pressed() -> void:
	Events.language = "English"
	get_tree().change_scene_to_file("res://scenes/room_1.tscn") 


func _on_dutch_pressed() -> void:
	Events.language = "Dutch"
	get_tree().change_scene_to_file("res://scenes/room_1.tscn") 
