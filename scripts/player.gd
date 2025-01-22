extends CharacterBody2D

@export var move_speed = 300
@export var jump_force = 800

@export var death_height = 1000
@export var initial_position : Vector2 = Vector2(10, -100)

@export var max_health_points : int = 5
@export var health_points : int

func _init() -> void:
	health_points = max_health_points

func _physics_process(delta):
	#check_inputs()
	
	if !is_on_floor():
		velocity.y += 30
		
		if(velocity.y > 1000):
			velocity.y = 1000
	else:
		if Input.is_action_just_pressed("jump"):
			velocity.y = -jump_force
	
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	velocity.x = move_speed * horizontal_direction
	move_and_slide()
	
	check_height()

func check_inputs():
	if Input.is_action_just_pressed("heal"):
		heal(1)
	if Input.is_action_just_pressed("take_damage"):
		take_damage(1)
	
func check_height():
	if position.y >= death_height:
		player_death()

func heal(amount: int):
	health_points += amount
	
	if health_points > max_health_points:
		reset_hp()
	
	print(health_points)

func take_damage(amount: int):
	health_points -= amount
	
	if health_points <= 0:
		player_death()
		
	print(health_points)

func player_death():
	reset_pos(initial_position)
	reset_hp()

func reset_pos(pos: Vector2):
	position = pos

func reset_hp():
	health_points = max_health_points
