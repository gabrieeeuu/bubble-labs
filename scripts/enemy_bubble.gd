extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var move_speed : float = 500
@export var destroy_bubble_timer : float = 2.0
@export var float_speed : float = 100
@export var bubble_scale = 0.5

var inertia_velocity : Vector2

func _physics_process(delta: float) -> void:
	position.y -= 0.2
	position += transform.x * move_speed * delta
	var bubble_tween = get_tree().create_tween()
	var duration : float = 0.5
	bubble_tween.parallel().tween_property(sprite_2d, "scale", Vector2(bubble_scale, bubble_scale), duration)
	await get_tree().create_timer(destroy_bubble_timer).timeout
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.take_damage(1)
		print("Player Hit")
		queue_free()
