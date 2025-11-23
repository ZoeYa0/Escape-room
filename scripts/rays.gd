extends Node2D

#var sender = "." no sender
@onready var line = $Line2D
@onready var sphere: Button = $"../LightSystem/SphereReflector/Sphere"
@onready var sphere_reflector: SphereReflector = $"../LightSystem/SphereReflector"


var bounces := 4

var rot := 0.0
var starting_rot = -15.0

const MAX_LENGTH := 590 # max length 


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
	
	#$End.emitting = true
	rot = get_local_mouse_position().angle()
	
	line.clear_points()
	line.add_point(global_position)
	
	max_cast_to = Vector2(MAX_LENGTH, 0).rotated(rot)
	#max_cast_to = Vector2(MAX_LENGTH, 0).rotated(starting_rot)
	

	var direction = Vector2.RIGHT.rotated(rotation)
	
	var idx = -1
	for raycast in lasers:
		
		idx += 1
		var raycastcollision = raycast.get_collision_point()
		
		raycast.target_position = max_cast_to#here is angle determined
		
		if raycast.is_colliding():
			line.add_point(raycastcollision)
			
			#max_cast_to = max_cast_to.bounce(raycast.get_collision_normal())
			max_cast_to = sphere_reflector.get_reflection_dir() * MAX_LENGTH
			
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
			
		
