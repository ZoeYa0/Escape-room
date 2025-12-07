extends Node2D
@onready var arrow: Button = $Arrow
@onready var ph_image: Sprite2D = $PHImage
@onready var hints: Node2D = $Hints
@onready var colorblind: Button = $PHImage/Colorblind
@onready var lever: AnimatedSprite2D = $Lever
@onready var answer_ph: Node2D = $AnswerPh
@onready var answer_button: Button = $AnswerPh/AnswerButton
@onready var ph: Button = $AnswerPh/PH
@onready var animated_sprite_2d: AnimatedSprite2D = $AnswerPh/AnimatedSprite2D
@onready var jelly_button: AudioStreamPlayer = $Audio/JellyButton
@onready var rightanswer_952192: AudioStreamPlayer = $"Audio/Rightanswer-952192"
@onready var wronganswer_37702: AudioStreamPlayer = $"Audio/Wronganswer-37702"
@onready var click: AudioStreamPlayer = $Audio/Click

#-------------------------
@export var start_dialogue: DialogueResource
@export var room_2_finished: DialogueResource
@export var wrong_drink: DialogueResource
@export var died: DialogueResource

#-------------
var start_time = 0
var health = 1

func _ready() -> void:
	#FORCING pointing hand
	for node in get_tree().get_nodes_in_group("Buttons"):
		node.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	Events.current_room = 2
	start_time = Time.get_ticks_msec()
	
	arrow.visible = false
	ph_image.visible = false
	DialogueManager.show_dialogue_balloon(start_dialogue,"start")


func _process(delta: float) -> void:
	Events.rooms["room2"]["time"] = str((Time.get_ticks_msec() - start_time) / 1000.0)

func _on_small_ph_pressed() -> void:
	ph_image.visible = true


func _on_answer_button_pressed() -> void:
	#print(Events.drink, Events.ph)
	click.play()
	lever.play("Play")
	if Events.drink % 7  == 2 and (Events.ph % 15) ==7:
		rightanswer_952192.play()
		arrow.visible = true
		DialogueManager.show_dialogue_balloon(room_2_finished,"start")
	else:
		Events.rooms["room2"]["wrong"] +=1
		wronganswer_37702.play()


func _on_ph_pressed() -> void:
	Events.ph = (Events.ph + 1) % 15 #modulo wrap
	ph.text = str(Events.ph)
	jelly_button.play()

func _on_drink_button_pressed() -> void:
	var frame_count = animated_sprite_2d.sprite_frames.get_frame_count(animated_sprite_2d.animation)
	animated_sprite_2d.frame = (animated_sprite_2d.frame + 1) % frame_count
	Events.drink = (Events.drink + 1) % 6
	jelly_button.play()
