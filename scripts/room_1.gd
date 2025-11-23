extends Node2D
signal curtains_opened
@onready var temp_bg: Sprite2D = $TempBg
@onready var curtain: Button = $Curtain
@onready var arrow: Button = $Arrow
@onready var show_puzzle_button: Button = $ShowPuzzleButton
@onready var rays: Node2D = $Rays
@onready var line_2d: Line2D = $Rays/Line2D
@onready var ray_cast_2d: RayCast2D = $Rays/RayCast2D


@onready var light_system: Control = $LightSystem
@onready var mirror: Area2D = $LightSystem/Mirror
@onready var sphere_reflector = $LightSystem/SphereReflector
@onready var area_2d: Area2D = $LightSystem/SphereReflector/Area2D
@onready var sphere: Button = $LightSystem/SphereReflector/Area2D/Sphere
@onready var collision_shape_2d: CollisionShape2D = $LightSystem/SphereReflector/Area2D/CollisionShape2D
@onready var sphere_2: Button = $LightSystem/Sphere2
@onready var sphere_3: Button = $LightSystem/Sphere3
#@onready var collision_polygon_2d: CollisionPolygon2D = $LightSystem/SphereReflector/Area2D/CollisionPolygon2D

@onready var instructions: Node2D = $Instructions
@onready var hints: Node2D = $Hints
@onready var hint: Button = $Hint
@onready var point_light_2d: PointLight2D = $PointLight2D


func _ready() -> void:
	curtain.disabled = false
	mirror.room_lit.connect(on_room_lit)

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
	visible = false
	curtains_opened.emit()
	curtain.disabled = true
	
func on_room_lit():
	temp_bg.modulate = Color(1,1,1,1)
	
	
