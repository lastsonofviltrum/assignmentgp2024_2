extends MeshInstance3D

func _process(delta):
	if Input.is_action_pressed("mouse_down") == false:
		hide()
	if Input.is_action_just_pressed("mouse_down"):
		show()
	if Input.is_action_just_released("mouse_down"):
		hide()
