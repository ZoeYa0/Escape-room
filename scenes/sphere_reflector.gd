class_name SphereReflector
extends Node2D


@export var output_angle_degrees: float = 0.0

func _ready() -> void:
	$Sphere.angle_changed.connect(on_angle_changed)
	
func get_reflection_dir() -> Vector2:
	var total_deg := output_angle_degrees + rotation_degrees
	print(str(Vector2.RIGHT.rotated(deg_to_rad(total_deg)).normalized()))
	return Vector2.RIGHT.rotated(deg_to_rad(total_deg)).normalized()
	
func on_angle_changed():
	output_angle_degrees += 45.0
