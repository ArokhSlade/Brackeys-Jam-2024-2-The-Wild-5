extends RigidBody3D

@export var SPEED = 5
@export var JUMP_VELOCITY = 4.5
@export var path : PathFollow3D
@export var rail = Vector3(1.0,0.0,1.0)

func move_to_path():
	transform.basis =    path.transform.basis
	transform.origin.x = path.transform.origin.x
	transform.origin.z = path.transform.origin.z

func _ready():
	move_to_path()

func _physics_process(delta):
	
	var target_velocity = Vector3.ZERO	

	var direction = Input.get_action_strength("run_right") - Input.get_action_strength("run_left")
	var step = direction * SPEED	
	
	transform.basis = path.transform.basis
	target_velocity = Vector3(0,0,-1) * step
	var rot = transform.basis.get_rotation_quaternion()
	target_velocity = rot * target_velocity
	linear_velocity = target_velocity
