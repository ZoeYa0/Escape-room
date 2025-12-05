extends Node2D




func _on_english_pressed() -> void:
	Events.language = "English"
	TranslationServer.set_locale('en')
	get_tree().change_scene_to_file("res://scenes/room_1.tscn") 


func _on_dutch_pressed() -> void:
	Events.language = "Dutch"
	TranslationServer.set_locale('nl')
	get_tree().change_scene_to_file("res://scenes/room_1.tscn") 
