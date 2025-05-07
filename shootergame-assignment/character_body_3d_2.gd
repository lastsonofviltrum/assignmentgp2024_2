extends Camera3D

@export var score = 0
@export var speed:float = 10
@export var rot_speed = 500
var controlling = true
const JUMP_VELOCITY = 4.5


var relative:Vector2 = Vector2.ZERO

func _input(event):
	if event is InputEventMouseMotion and controlling:
		relative = event.relative
	if event.is_action_pressed("ui_cancel"):
		if controlling:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:            
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		controlling = ! controlling
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.

@export var can_move:bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(Vector3.DOWN, deg_to_rad(relative.x * deg_to_rad(rot_speed) * delta))
	rotate(transform.basis.x,deg_to_rad(- relative.y * deg_to_rad(rot_speed) * delta))
	relative = Vector2.ZERO
	if can_move:
		var _v = Vector3.ZERO
		
		var _mult = 1
		if Input.is_key_pressed(KEY_SHIFT):
			_mult = 3
		
	if Input.is_action_just_pressed("mouse_down"):
		$AudioStreamPlayer3D.play()
	if Input.is_action_just_released("mouse_down"):
		$AudioStreamPlayer3D.stop()

func _physics_process(delta):
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	
