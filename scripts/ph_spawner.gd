extends Node2D
@export var ph_strip: PackedScene
@onready var button: Button = $Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	var p = ph_strip.instantiate()
	p.global_position = button.global_position
	p.scale = Vector2(0.3,0.3)
	add_child(p)
