extends CharacterBody3D

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body.is_in_group($"../CharacterBody3D/Camera3D/Ukelele/UkeleleBeam"): # Check if the colliding body is an enemy
		# Apply damage or effect to the enemy
			body.queue_free() # Destroy the enemy if health is zero
