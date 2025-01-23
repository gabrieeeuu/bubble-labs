extends Area2D

@onready var wind : Area2D = $Wind
@onready var collision_shape_2d : CollisionShape2D = $Wind/CollisionShape2D

signal has_entered_wind_area

@export var is_fan_active : bool = true

var wind_direction : Vector2 = Vector2.ZERO

@export var wind_force : float = 100.0
@export var wind_length : float = 200.0

func _ready() -> void:
	collision_shape_2d.scale.y = wind_length

func _physics_process(delta: float) -> void:
	if is_fan_active:
		collision_shape_2d.disabled = false 
	else:
		collision_shape_2d.disabled = true
	
	if is_fan_active and self.rotation == 90 or self.rotation == -90:  
		wind_direction.x = wind_direction.x * wind_force
	
	if is_fan_active and self.rotation == 0 or self.rotation == 180:
		wind_direction.y = wind_direction.y * wind_force
	
	

func _on_wind_body_entered(body: Node2D) -> void:
	has_entered_wind_area.emit()
