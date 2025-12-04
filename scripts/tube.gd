extends Area2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		Events.tube_clicked.emit()
		Events.straw_connected = true
		visible = false
