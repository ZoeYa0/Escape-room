extends Control


func _ready():
	# Allow this node to receive input first
	set_process_unhandled_input(true)
	visible = false

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		# Check if mouse is inside this node's rect
		if !get_global_rect().has_point(get_global_mouse_position()):
			hide()  # or queue_free()


func _on_button_pressed() -> void:
	visible = true


func _on__pressed() -> void:
	visible = true


func _on_three_pressed() -> void:
	visible = true


func _on_four_pressed() -> void:
	visible = true
