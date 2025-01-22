extends Node2D

var bubble_path = preload("res://scenes/bubble.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fire"):
		fire()

func fire():
	var bubble = bubble_path.instantiate()
	get_tree().root.add_child(bubble)
	bubble.global_position = global_position 
	bubble.rotation = get_parent().rotation
