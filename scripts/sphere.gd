class_name SphereReflector
extends Node2D

@export var output_angle_degrees := 0.0


func get_reflection_dir() -> Vector2:
	# Direction relative to global rotation of this node
	return Vector2.RIGHT.rotated(deg_to_rad(output_angle_degrees + rotation_degrees))

func rotate_by(deg: float):
	rotation_degrees += deg
