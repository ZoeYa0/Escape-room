extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var label: Label = $Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func set_data(name, time, wrong, hints):
	label.text = str(name) + ":\n" + "Time: " + str(time) + "\n Wrong Attempts: " + str(wrong) + "\n Hints: " + str(hints)
