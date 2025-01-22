extends Node2D

var bullet_path = preload("res://scenes/bullet.tscn")

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	rotation_degrees = wrap(rotation_degrees, 0 , 360)
	
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1
	
	if Input.is_action_just_pressed("fire"):
		fire()

func fire():
	var bullet = bullet_path.instantiate()
	get_tree().root.add_child(bullet)
	bullet.global_position = global_position 
	bullet.rotation = rotation
