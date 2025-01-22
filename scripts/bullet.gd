extends Node2D

@export var move_speed = 1000

func _process(delta: float) -> void:
	position += transform.x * move_speed * delta
