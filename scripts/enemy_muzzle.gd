extends Node2D

var bubble_path = preload("res://scenes/enemy_bubble.tscn")

@export var timer_duration = 2.0
@export var timer = 2.0

func _ready() :
	timer = timer_duration
	
func _process(delta: float) -> void:
	timer -= delta
	
	if timer <= 0:
		fire()
		timer = timer_duration

func fire():
	var bubble = bubble_path.instantiate()
	get_tree().root.add_child(bubble)
	bubble.global_position = global_position 
	bubble.rotation = get_parent().rotation
