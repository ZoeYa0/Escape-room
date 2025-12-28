extends Node2D
@onready var rightanswer: AudioStreamPlayer = $"../Rightanswer"
@onready var wronganswer: AudioStreamPlayer = $"../Wronganswer"

var correct_answer := ["c", "h", "2", "2", "2", "0"]

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


	for i in range(fields.size()):
		var user_letter = fields[i].text #.strip_edges().to_upper()

		if user_letter == correct_answer[i]:
			_set_feedback_correct(fields[i])
		else:
			_set_feedback_incorrect(fields[i])
			all_correct = false
			wronganswer.play()
	if all_correct:
		_unlock_puzzle()
		rightanswer.play()


func _set_feedback_correct(field: LineEdit):
	field.modulate = Color.GREEN


func _set_feedback_incorrect(field: LineEdit):
	Events.rooms["room5"]["wrong"] += 1
	field.modulate = Color.RED


func _unlock_puzzle():
	get_tree().change_scene_to_file("res://scenes/room_7.tscn")
