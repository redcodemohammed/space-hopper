extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@export var camera:Camera3D

var camera_position
func _ready():
	camera_position = camera.position
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		position.z -= 2
		camera_position.z -= 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("ui_down") and is_on_floor():
		position.z += 2
		camera_position.z += 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("ui_left") and is_on_floor():
		position.x -= 2
		camera_position.x -= 2
		$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("ui_right") and is_on_floor():
		position.x += 2
		camera_position.x += 2
		$AudioStreamPlayer.play()
	move_and_slide()
	

func _process(delta):
	camera.position = lerp(camera.position, camera_position, 5 * delta)
