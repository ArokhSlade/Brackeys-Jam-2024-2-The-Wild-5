extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if $Cube_Test/AnimationPlayer.is_playing():
			$Cube_Test/AnimationPlayer.pause()
		else:
			
			$Cube_Test/AnimationPlayer.play()
