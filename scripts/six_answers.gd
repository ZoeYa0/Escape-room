extends Node2D

# The answer for each slot (6 letters)
var correct_answer := ["c", "h", "a", "a", "a", "a"]

@onready var fields := [
	$L1,
	$L2,
	$L3,
	$L4,
	$L5,
	$L6
]

func _ready():
	# Set each LineEdit to only allow 1 character
	for f in fields:
		f.max_length = 1
		f.text = ""
		#f.minimum_character_width = 0


func _on_submit_button_pressed() -> void:
	var all_correct := true

	# --- Loop through all fields ---
	for i in range(fields.size()):
		var user_letter = fields[i].text #.strip_edges().to_upper()

		# Compare with correct letter
		if user_letter == correct_answer[i]:
			_set_feedback_correct(fields[i])
		else:
			_set_feedback_incorrect(fields[i])
			all_correct = false

	# --- Full password correct? ---
	if all_correct:
		_unlock_puzzle()


# -------------------------------------------------------------
# FEEDBACK FUNCTIONS – customize these however you like
# -------------------------------------------------------------
func _set_feedback_correct(field: LineEdit):
	field.modulate = Color.GREEN


func _set_feedback_incorrect(field: LineEdit):
	field.modulate = Color.RED


func _unlock_puzzle():
	print("✔ Puzzle Solved!")
	get_tree().change_scene_to_file("res://scenes/room_6.tscn")
