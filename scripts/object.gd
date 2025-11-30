extends Node2D
@onready var label: Label = $Label

var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos: Vector2
var home_position: Vector2
var current_dropable: Node2D = null


func _ready() -> void:
	label.text = name
	home_position = global_position
	
func _process(delta: float) -> void:
	for slot in Events.dropable_states.keys():
		var obj = Events.dropable_states[slot]
		print(slot.name, " contains ", obj.name)


	if draggable:
		if Input.is_action_just_pressed('click'):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			Events.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
			
		elif Input.is_action_just_released("click"):
			Events.is_dragging = false
			
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				snap_to_dragable(body_ref)
			else:
				return_home()
				

func snap_to_dragable(dropable):
	if dropable.occupant and dropable.occupant != self:
		dropable.occupant.return_home()

	dropable.occupant = self
	Events.dropable_states[dropable] = self
	# Snap to the dropable’s position
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position",body_ref.position,0.2).set_ease(Tween.EASE_OUT)

	current_dropable = dropable
	
func return_home():
	if current_dropable:
		current_dropable.occupant = null
		current_dropable = null
		Events.dropable_states.erase(current_dropable)
	

	var tween = get_tree().create_tween()
	tween.tween_property(self, 'global_position',initialPos,0.2).set_ease(Tween.EASE_OUT)
	
func _on_area_2d_mouse_entered() -> void:
	if not Events.is_dragging:
		scale = Vector2(0.3,0.3)
		draggable = true
		
func _on_area_2d_mouse_exited() -> void:
	if not Events.is_dragging:
		draggable = false
		scale = Vector2(0.25,0.25)
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("dropable"):
		is_inside_dropable = true
		body.modulate = Color(Color.PALE_VIOLET_RED, 1.0)
		body_ref = body
		


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("dropable"):
		is_inside_dropable = false
		body.modulate = Color(Color.PALE_VIOLET_RED, 0.7)
	if body_ref == body:
		body_ref = null
