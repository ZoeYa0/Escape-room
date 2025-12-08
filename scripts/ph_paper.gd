extends Node2D


@onready var sprite: Sprite2D = $Sprite2D
@onready var area2D: Area2D = $Area2D
@onready var color_rect: ColorRect = $ColorRect

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
		color_rect.visible = true#because moduluate on yellow doesn't give right color
		sprite.visible = false
		color_rect.modulate = color
		
#-----------------------------
@export var angle_x_max: float = 15.0
@export var angle_y_max: float = 15.0
@export var max_offset_shadow: float = 50.0

@export_category("Oscillator")
@export var spring: float = 150.0
@export var damp: float = 10.0
@export var velocity_multiplier: float = 2.0

var displacement: float = 0.0 
var oscillator_velocity: float = 0.0

var tween_rot: Tween
var tween_hover: Tween
var tween_destroy: Tween
var tween_handle: Tween

var last_mouse_pos: Vector2
var mouse_velocity: Vector2
var following_mouse: bool = false
var last_pos: Vector2
var velocity: Vector2


func _ready() -> void:
	# Convert to radians because lerp_angle is using that
	angle_x_max = deg_to_rad(angle_x_max)
	angle_y_max = deg_to_rad(angle_y_max)
	#collision_shape.set_deferred("disabled", true)

func _process(delta: float) -> void:
	rotate_velocity(delta)
	
func rotate_velocity(delta: float) -> void:
	if not following_mouse: return
	var center_pos: Vector2 = global_position - (sprite.size/2.0)
	print("Pos: ", center_pos)
	print("Pos: ", last_pos)
	# Compute the velocity
	velocity = (position - last_pos) / delta
	last_pos = position
	
	print("Velocity: ", velocity)
	oscillator_velocity += velocity.normalized().x * velocity_multiplier
	
	# Oscillator stuff
	var force = -spring * displacement - damp * oscillator_velocity
	oscillator_velocity += force * delta
	displacement += oscillator_velocity * delta
	
	rotation = displacement
