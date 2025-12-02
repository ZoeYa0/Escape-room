extends Node2D


@onready var sprite: Sprite2D = $Sprite2D
@onready var area2D: Area2D = $Area2D
var dragging := false
var drag_offset := Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# if clicked
				if sprite.get_rect().has_point(to_local(event.position)):
					dragging = true
					drag_offset = global_position - event.position
					get_viewport().set_input_as_handled()
			else:
				# drop paper
				dragging = false
				
	if event is InputEventMouseMotion and dragging:
		global_position = event.position + drag_offset

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name.begins_with("PH"):
		print(area.name)
		var color = Color(area.name.trim_prefix("PH"))
		sprite.modulate = color
		Events.can_puzzle_be_solved = true
		
