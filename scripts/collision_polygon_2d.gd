extends CollisionPolygon2D

@export var rotation_degrees_step := 10.0



func rotate_polygon(angle: float):
	var poly := polygon
	if poly.is_empty():
		return

	var centroid := Vector2.ZERO
	for p in poly:
		centroid += p
	centroid /= poly.size()

	var new_poly : Array[Vector2] = []
	for p in poly:
		var offset := p - centroid
		offset = offset.rotated(angle)
		new_poly.append(centroid + offset)

	polygon = new_poly


func _on_sphere_pressed() -> void:
	rotate_polygon(deg_to_rad(rotation_degrees_step))
