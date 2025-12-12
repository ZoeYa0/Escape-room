extends Control
@onready var answers: Node2D = $Answers
@onready var red: Button = $Answers/Red
@onready var blue: Button = $Answers/Blue
@onready var yellow: Button = $Answers/Yellow
@onready var brown: Button = $Answers/Brown
@onready var line_edit: LineEdit = $LineEdit
@onready var submit: Button = $Submit
@onready var label: Label = $Label
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var red_2: ColorRect = $Red2
@onready var blue_2: ColorRect = $Blue2
@onready var yellow_2: ColorRect = $Yellow2
@onready var brown_2: ColorRect = $Brown2
@onready var correct: Label = $Correct
@onready var rightanswer: AudioStreamPlayer = $Rightanswer
@onready var wronganswer: AudioStreamPlayer = $Wronganswer

@export var correct_virus: DialogueResource
signal room3_solved
var lights_solved = false
var virus_solved = false

func _ready():
	Events.lights_solved.connect(on_lights_solved)
	Events.reset_lights.connect(on_reset_lights)
	set_process_unhandled_input(true)
	visible = false
	
func on_reset_lights():
	wronganswer.play()
	Events.rooms["room3"]["wrong"]+=1
	red.modulate = Color.TRANSPARENT
	blue.modulate = Color.TRANSPARENT
	yellow.modulate = Color.TRANSPARENT
	brown.modulate = Color.TRANSPARENT
	
func on_lights_solved():
	red_2.visible = true
	blue_2.visible = true
	yellow_2.visible = true
	brown_2.visible = true
	lights_solved = true
	if virus_solved and lights_solved:
		room3_solved.emit()
		rightanswer.play()
		visible = false
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if !get_global_rect().has_point(get_global_mouse_position()):
			hide() 



func _on_show_answerpad_pressed() -> void:
	visible = true

func _on_red_pressed() -> void:
	set_gray(red)
	Events.register_press("1")

func _on_blue_pressed() -> void:
	set_gray(blue)
	Events.register_press("2")
	

func _on_yellow_pressed() -> void:
	Events.register_press("3")
	set_gray(yellow)

func _on_brown_pressed() -> void:
	Events.register_press("4")
	set_gray(brown)

func set_gray(node):
	node.modulate = Color.DIM_GRAY
	


func _on_submit_pressed() -> void:
	var answer = $LineEdit.text.to_lower()
	if answer == "helixa":
		virus_solved = true
		correct.visible = true
		if virus_solved and lights_solved:
			room3_solved.emit()
			rightanswer.play()
	else:
		wronganswer.play()
		Events.rooms["room3"]["wrong"]+=1
			
