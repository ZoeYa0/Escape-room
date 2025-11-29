extends StaticBody2D


# colorrect also detects mouse. disable
func _ready() -> void:
	modulate = Color(Color.PALE_VIOLET_RED,0.7)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Events.is_dragging:
		visible = true
	else:
		visible = false
