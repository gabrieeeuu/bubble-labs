extends Node2D

var bubble_path = preload("res://scenes/enemy_bubble.tscn")
@onready var pos = get_node("/root/World/Player").global_position

func _process(delta: float) -> void:
	pos = get_node("/root/World/Player").global_position
	look_at(pos)
	
	rotation_degrees = wrap(rotation_degrees, 0 , 360)
	
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -0.5
	else:
		scale.y = 0.5
