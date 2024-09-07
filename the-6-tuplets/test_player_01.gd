extends CharacterBody3D


@export var SPEED = 5.0
@export var JUMP_VELOCITY = 4.5
@export var path : PathFollow3D

func _physics_process(delta):
	
	var target_velocity = Vector3.ZERO
	if not is_on_floor():
		target_velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		target_velocity.y = JUMP_VELOCITY

	var direction = Input.get_action_strength("run_right") - Input.get_action_strength("run_left")
	
	if direction:
		target_velocity.x = direction * SPEED
	else:
		target_velocity.x = move_toward(velocity.x, 0, SPEED)
	
	path.progress += target_velocity.x * delta;
	transform = path.transform
	

	move_and_slide()
