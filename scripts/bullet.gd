extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var move_speed : float = 700
@export var bubble_stop_timer : float = 0.5
@export var destroy_bubble_timer : float = 5.0

var inertia_velocity : Vector2


func _process(delta: float) -> void:
	position += transform.x * move_speed * delta
	await get_tree().create_timer(bubble_stop_timer).timeout
	var bubble_tween = get_tree().create_tween()
	var duration : float = 0.5
	bubble_tween.parallel().tween_property(self, "move_speed", 0, duration)
	bubble_tween.parallel().tween_property(sprite_2d, "scale", Vector2.ONE, duration)
	await get_tree().create_timer(destroy_bubble_timer).timeout
	queue_free()
