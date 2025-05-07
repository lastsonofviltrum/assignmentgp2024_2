extends CharacterBody3D

func _on_CharacterBody3D_body_entered(body):
	if body == player:
		hide()
