#most of this script is from https://youtu.be/qF5u-l388e8
extends CharacterBody3D

@export var score = 0
@export var rot_speed = 500
var controlling = true
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var relative:Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	
# please god can I GET A WORKING CAMERA PLEASE
# i dont ask for a lot literally all i want is for my camera to move like any other camera in any other game
# is that too much to ask for??? do i as k for too much from this world???????
# please just give me a working camera
# i don't care if it takes me 5 hours to boot up my project
# as long as i can move the same way the camera moves i will ask for nothing more

	move_and_slide()
