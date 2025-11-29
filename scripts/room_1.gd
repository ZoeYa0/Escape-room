extends Node2D

#this is controller! not event! autoload will break bc paths will be moved

@onready var temp_bg: Sprite2D = $TempBg
@onready var curtain: Button = $Curtain
@onready var rays: Node2D = $Rays
@onready var laser: RayCast2D = $Rays/Laser
@onready var line_2d: Line2D = $Rays/Line2D
@onready var light_system: Control = $LightSystem
@onready var mirror: Area2D = $LightSystem/Mirror
@onready var collision_shape_2d: CollisionShape2D = $LightSystem/Mirror/CollisionShape2D
@onready var sphere_reflector: SphereReflector = $LightSystem/SphereReflector
@onready var sphere: Button = $LightSystem/SphereReflector/Sphere
@onready var area_2d: Area2D = $LightSystem/SphereReflector/Area2D
@onready var sphere_reflector_2: SphereReflector = $LightSystem/SphereReflector2
@onready var sphere_2: Button = $LightSystem/SphereReflector2/Sphere2
@onready var sphere_reflector_3: SphereReflector = $LightSystem/SphereReflector3
@onready var sphere_3: Button = $LightSystem/SphereReflector3/Sphere3
@onready var arrow: Button = $Arrow
@onready var show_puzzle_button: Button = $ShowPuzzleButton
@onready var instructions: Node2D = $Instructions
@onready var close_button: Button = $Instructions/CloseButton
@onready var label: Label = $Instructions/Label
@onready var hints: Node2D = $Hints
@onready var color_rect: ColorRect = $Hints/ColorRect
@onready var hint_close_button: Button = $Hints/CloseButton
@onready var hint_label: Label = $Hints/Label
@onready var timer: Label = $Timer
@onready var closed_curtain: ColorRect = $ClosedCurtain
@onready var curtains_opened: Sprite2D = $CurtainsOpened

@onready var point_light_2d: PointLight2D = $PointLight2D
#---------------------------------------------------
@export var intro: DialogueResource # attach dialogue file
@export var room_finished: DialogueResource
@export var curtains_stuck: DialogueResource
@export var curtains_cant_open: DialogueResource
#---------------------------------------------------
var start_time = 0

func _ready() -> void:
	Events.current_room = 1
	start_time = Time.get_ticks_msec()
	rays.room_lit.connect(on_room_lit)
	DialogueManager.show_dialogue_balloon(intro, "start")
	Events.curtains_opened.connect(on_curtains_opened)
	Events.room_lit.connect(on_room_lit)
	
	line_2d.visible = false
	curtains_opened.visible = false
	closed_curtain.visible = true
	
	
func _process(delta: float) -> void:
	timer.text = str((Time.get_ticks_msec() - start_time) / 1000.0)
	Events.rooms["room1"]["time"] = str((Time.get_ticks_msec() - start_time) / 1000.0)
#func _on_sphere_pressed() -> void:
	#sphere.pivot_offset = sphere.size * 0.5
	#sphere.rotation += deg_to_rad(45.0)#control nodes use rad
	##get_parent().rotation_degrees += 45.0
#
#func _on_sphere_2_pressed() -> void:
	#sphere_2.pivot_offset = sphere_2.size * 0.5
	#sphere_2.rotation += deg_to_rad(45.0)
#
#func _on_sphere_3_pressed() -> void:
	#sphere_3.pivot_offset = sphere_3.size * 0.5
	#sphere_3.rotation += deg_to_rad(45.0)
#

func _on_curtain_pressed() -> void:
	print("curtainspressed")
	if Events.can_curtains_open:
		curtains_opened.visible = true
		closed_curtain.visible = false
		line_2d.visible = true	
		curtain.disabled = true
		DialogueManager.show_dialogue_balloon(curtains_stuck,'start')
	else:
		DialogueManager.show_dialogue_balloon(curtains_cant_open,'start')
		
	
func on_room_lit():
	temp_bg.modulate = Color(1,1,1,1)
	$LightSystem/Mirror/Sprite2D.modulate = Color(1,1,1,1)
	DialogueManager.show_dialogue_balloon(room_finished,'start')
	Events.puzzle_solved = true

func on_curtains_opened():
	show_puzzle_button.disabled = true
	
	


func _on_show_puzzle_button_pressed() -> void:
	pass # Replace with function body.
