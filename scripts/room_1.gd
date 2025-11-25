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
@onready var bg_instructions: Sprite2D = $Instructions/BgInstructions
@onready var close_button: Button = $Instructions/CloseButton
@onready var label: Label = $Instructions/Label
@onready var hints: Node2D = $Hints
@onready var bg: Sprite2D = $Hints/bg
@onready var hint: Button = $Hint
@onready var point_light_2d: PointLight2D = $PointLight2D
#---------------------------------------------------
@export var intro: DialogueResource # attach dialogue file
@export var dialogue_start: String = "start" #specify start
#---------------------------------------------------
func _ready() -> void:
	curtain.disabled = false
	rays.room_lit.connect(on_room_lit)
	DialogueManager.show_dialogue_balloon(intro, "start")

#func _on_sphere_pressed() -> void:
	#sphere.pivot_offset = sphere.size * 0.5
	#sphere.rotation += deg_to_rad(90.0)#control nodes use rad
	##collision_polygon_2d.pivot_offset = collision_polygon_2d.size * 0.5
	##collision_polygon_2d.rotation += deg_to_rad(90.0)
	##get_parent().rotation_degrees += 45.0

func _on_sphere_2_pressed() -> void:
	sphere_2.pivot_offset = sphere_2.size * 0.5
	sphere_2.rotation += deg_to_rad(90.0)

func _on_sphere_3_pressed() -> void:
	sphere_3.pivot_offset = sphere_3.size * 0.5
	sphere_3.rotation += deg_to_rad(90.0)


func _on_curtain_pressed() -> void:
	Events.curtain_opened.emit()
	curtain.disabled = true
	
func on_room_lit():
	temp_bg.modulate = Color(1,1,1,1)

	
	

	
