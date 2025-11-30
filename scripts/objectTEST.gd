extends Node2D


@export var home_position: Vector2 = Vector2.ZERO

var dragging: bool = false
var drag_offset: Vector2 = Vector2.ZERO

var hovered_slot: Area2D = null
var current_slot: Area2D = null

func _ready():
	# Use the position in the scene as the home by default
	if home_position == Vector2.ZERO:
		home_position = global_position

	# optional visual:
	modulate = Color(1,1,1,1)

# Use input_event so clicks only register when clicking the CollisionShape2D
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# start drag
			dragging = true
			drag_offset = get_global_mouse_position() - global_position
				# draw above others
			set_physics_process(true)
		else:
			# release
			if dragging:
				dragging = false
				set_physics_process(false)
				_on_drag_released()

# Move the Area2D while dragging
func _physics_process(delta):
	if dragging:
		global_position = get_global_mouse_position() - drag_offset

# Called when the mouse is released
func _on_drag_released() -> void:
	if hovered_slot:
		snap_to_slot(hovered_slot)
	else:
		return_home()

# Snap to the slot and handle occupant replacement
func snap_to_slot(slot: Area2D) -> void:
	# Defensive check
	if not slot or not slot.is_in_group("dropable"):
		return_home()
		return

	# Kick out an existing occupant (if any)
	if slot.has_method("get_occupant") and slot.get_occupant() != null and slot.get_occupant() != self:
		var old = slot.get_occupant()
		# Call its public method to return home
		if old.has_method("return_home"):
			old.return_home()
		else:
			# fallback: just null the occupant if something weird
			slot.set_occupant(null)

	# Assign ourselves
	if slot.has_method("set_occupant"):
		slot.set_occupant(self)
	else:
		# if the slot script differs, set property directly
		slot.occupant = self

	current_slot = slot

	# Tween into exact slot position (use global_position for consistency)
	var t = get_tree().create_tween()
	t.tween_property(self, "global_position", slot.global_position, 0.18).set_ease(Tween.EASE_OUT)

# Return this draggable to its home
func return_home() -> void:
	# clear slot reference
	if current_slot:
		if current_slot.has_method("clear_occupant"):
			current_slot.clear_occupant()
		elif current_slot.has_method("set_occupant"):
			current_slot.set_occupant(null)
		else:
			current_slot.occupant = null
		current_slot = null

	var t = get_tree().create_tween()
	t.tween_property(self, "global_position", home_position, 0.18).set_ease(Tween.EASE_OUT)


# SIGNALS: area_entered / area_exited
# Connect the Area2D's `area_entered(area)` and `area_exited(area)` signals to these functions.

func _on_Draggable_area_entered(area: Area2D) -> void:
	# When the draggable's Area2D overlaps a dropable Area2D, record it
	if area.is_in_group("dropable"):
		hovered_slot = area
		# optional highlight:
		if area.has_node("Sprite2D"):
			area.get_node("Sprite2D").modulate = Color(1,1,1,1)

func _on_Draggable_area_exited(area: Area2D) -> void:
	if area.is_in_group("dropable") and hovered_slot == area:
		hovered_slot = null
		# optional un-highlight:
		if area.has_node("Sprite2D"):
			area.get_node("Sprite2D").modulate = Color(1,1,1,0.7)
