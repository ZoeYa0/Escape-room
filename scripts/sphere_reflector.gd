class_name SphereReflector
extends Node2D

var output_angle_degrees: float = 0.0#don't export bc then it's stored on cloud
@onready var sphere: Button = get_children().filter(func(c): return c is Button)[0]
#best practice to find first button amongst children

func _ready() -> void:
	sphere.angle_changed.connect(on_angle_changed)
	
	
func get_reflection_dir() -> Vector2:
	var total_deg := output_angle_degrees + rotation_degrees
	return Vector2.RIGHT.rotated(deg_to_rad(total_deg)).normalized()
	
func on_angle_changed():
	
	output_angle_degrees += 60.0
