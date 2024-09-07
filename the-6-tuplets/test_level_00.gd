extends Node

@export var SPEED = 5
@export var path : PathFollow3D

func move_dummy_to_start(dummy : Node3D):
	dummy.transform.basis = path.transform.basis
	dummy.transform.origin.x = path.transform.origin.x
	dummy.transform.origin.z = path.transform.origin.z
	

# Called when the node enters the scene tree for the first time.
func _ready():
	path.progress = 0.0
	move_dummy_to_start($Dummy)
	move_dummy_to_start($Dummy2)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_action_strength("run_right") - Input.get_action_strength("run_left")
	var step = direction * SPEED
		
	path.progress += step * delta;
	pass
