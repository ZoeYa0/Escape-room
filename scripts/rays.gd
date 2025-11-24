extends Node2D

#var sender = "." no sender
@onready var line = $Line2D
@onready var sphere: Button = $"../LightSystem/SphereReflector/Sphere"
@onready var sphere_reflector_1: SphereReflector = $"../LightSystem/SphereReflector"
@onready var sphere_reflector_2: SphereReflector = $"../LightSystem/SphereReflector2"
@onready var sphere_reflector_3: SphereReflector = $"../LightSystem/SphereReflector3"
var active := true
signal room_lit

var bounces := 4

var rot := 0.0
var starting_rot = 0.62

const MAX_LENGTH := 2000 # max length 


var max_cast_to # vector that updates based on rotation

var lasers := []

func _ready():
	
	#sender = get_parent()
	
	lasers.append($Laser)
	for i in range(bounces):
		var raycast = $Laser.duplicate()
		raycast.enabled = false
		#raycast.add_exception(sender)
		add_child(raycast)
		lasers.append(raycast)
	
	#max_cast_to = Vector2(MAX_LENGTH, 0).rotated(rot)
	max_cast_to = Vector2(MAX_LENGTH, 0).rotated(starting_rot)
	#$Laser.add_exception(sender)
	$Laser.target_position = max_cast_to#updated from cast to
	#$Line2D.set_as_toplevel(true) would be used to stop from following parent. is useless here
	

func _process(_delta):
	if not active:
		return
	#$End.emitting = true
	#rot = get_local_mouse_position().angle()
	#print(rot)
	rot = starting_rot
	
	line.clear_points()
	line.add_point(global_position)
	
	max_cast_to = Vector2(MAX_LENGTH, 0).rotated(rot)
	#max_cast_to = Vector2(MAX_LENGTH, 0).rotated(starting_rot)
	

	#var direction = Vector2.RIGHT.rotated(rotation)
	
	var idx = -1
	for raycast in lasers:
		
		idx += 1
		var raycastcollision = raycast.get_collision_point()
		
		#raycast.target_position = max_cast_to#here is angle determined. causes not 180
		var d = max_cast_to.normalized()
		#raycast.rotation = d.angle()
		raycast.target_position = d * MAX_LENGTH

		
		if raycast.is_colliding():
			line.add_point(raycastcollision)
			
			#max_cast_to = max_cast_to.bounce(raycast.get_collision_normal())
			#max_cast_to = sphere_reflector.get_reflection_dir() * MAX_LENGTH
			var new_dir = sphere_reflector_1.get_reflection_dir().normalized()
			#---- replacement for new dir
			var collider = raycast.get_collider().get_parent()
			if lasers[idx].get_collider().name == "Mirror":
				lasers[idx].get_collider().trigger_light()#somehow it hits mirror instead of collider??
				room_lit.emit()
				print("mirror hit")
				break
			new_dir = collider.get_reflection_dir().normalized()
			#----
			max_cast_to = new_dir * MAX_LENGTH
			
			if idx < lasers.size()-1:
				lasers[idx+1].enabled = true
				lasers[idx+1].global_position = raycastcollision+(1*max_cast_to.normalized())
			#if idx == lasers.size()-1:
				#$End.global_position = raycastcollision
			if lasers[idx].get_collider().name == "Mirror":
				lasers[idx].get_collider().trigger_light()#somehow it hits mirror instead of collider??
				print("mirror hit")
				break
		else:
			line.add_point(global_position + max_cast_to)
			#$End.emitting = false
			break
			
		
