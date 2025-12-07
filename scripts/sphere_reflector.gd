class_name SphereReflector
extends Node2D
var output_angle_degrees: float = 0.0#don't export bc then it's stored on cloud
@onready var sphere: Button = get_children().filter(func(c): return c is Button)[0]
#best practice to find first button amongst children. why did i not just connect button here??

	
	
func get_reflection_dir() -> Vector2:
	var total_deg := output_angle_degrees + rotation_degrees
	return Vector2.RIGHT.rotated(deg_to_rad(total_deg)).normalized()
	


func _on_sphere_pressed() -> void:
	output_angle_degrees += 60.0
	
	#$Sprite2D.pivot_offset = $Sprite2D.size * 0.5 only on button
	$Sprite2D.rotation_degrees += 60.0 #why did i go to room 1?? doesn't make sense.
	#sphere_reflector.rotation += deg_to_rad(45.0)#control nodes use rad
