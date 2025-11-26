extends Node2D
@onready var arrow: Button = $ArrowLeft


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	arrow.visible = false


func _on_green_button_3_pressed() -> void:
	arrow.visible = true


func _on_opdracht_pressed() -> void:
	pass # Replace with function body.
