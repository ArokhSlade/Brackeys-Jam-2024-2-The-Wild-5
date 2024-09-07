extends Node3D

@export var SPEED = 5.0
@export var JUMP_VELOCITY = 4.5
@export var path : PathFollow3D
@export var rail = Vector3(1.0,0.0,1.0)


func _physics_process(delta):
	
	var target_velocity = Vector3.ZERO	

	var direction = Input.get_action_strength("run_right") - Input.get_action_strength("run_left")
	var step = direction * SPEED
	if direction:
		target_velocity.x = step
	
	transform.basis = path.transform.basis
	
	transform.origin += transform.basis.z.normalized() * step * delta * -1
