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
			Events.current_stickynote = null




func _on_s_1_pressed() -> void:
	visible = true
	Events.current_stickynote = 1


func _on_s_2_pressed() -> void:
	visible = true
	Events.current_stickynote = 2


func _on_s_3_pressed() -> void:
	visible = true
	Events.current_stickynote = 3



func _on_s_4_pressed() -> void:
	visible = true
	Events.current_stickynote = 4
