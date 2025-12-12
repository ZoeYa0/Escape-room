extends Control
@onready var book_opening_345808: AudioStreamPlayer = $"../Book-opening-345808"


func _ready():
	# Allow this node to receive input first
	set_process_unhandled_input(true)
	visible = false

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		# Check if mouse is inside this node's rect
		if !get_global_rect().has_point(get_global_mouse_position()):
			hide()  # or queue_free()
			Events.current_stickynote = null




func _on_s_1_pressed() -> void:
	$Label.text = tr("INSTRUCTION_5.1")
	visible = true
	Events.current_stickynote = 1
	book_opening_345808.play(0.44)


func _on_s_2_pressed() -> void:
	$Label.text = tr("INSTRUCTION_5.2")
	visible = true
	Events.current_stickynote = 2
	book_opening_345808.play(0.44)

func _on_s_3_pressed() -> void:
	$Label.text = tr("INSTRUCTION_5.3.1")
	$Label2.text = tr("INSTRUCTION_5.3.2")
	visible = true
	Events.current_stickynote = 3
	book_opening_345808.play(0.44)


func _on_s_4_pressed() -> void:
	$Label.text = tr("INSTRUCTION_5.4.1")
	$Label2.text = tr("INSTRUCTION_5.4.2")
	visible = true
	Events.current_stickynote = 4
	book_opening_345808.play(0.44)
