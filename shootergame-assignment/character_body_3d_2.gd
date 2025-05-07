extends Camera3D

func _process(delta):
	if Input.is_action_just_pressed("mouse_down"):
		$AudioStreamPlayer3D.play()
	if Input.is_action_just_released("mouse_down"):
		$AudioStreamPlayer3D.stop()
