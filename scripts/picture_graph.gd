extends Button
@onready var picture_graph_2: Button = $"../PictureGraph2"


func _on_pressed() -> void:
	
	visible = false
	picture_graph_2.visible = true


func _on_picture_graph_2_pressed() -> void:
	visible = true
	picture_graph_2.visible = false
