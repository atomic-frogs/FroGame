extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0

@onready var sheet_on = $FrogSheetOn
@onready var sheet_off = $FrogSheetOff
@onready var animation_player = $AnimationPlayer
var is_dark = -1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_dark = -is_dark

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	animation(direction)
	if not is_on_floor() and not is_on_wall():
		velocity.y += gravity * delta
	if is_on_wall_only():
		velocity.y = 50 * delta

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	

func animation(dir):
	if dir > 0:
		sheet_off.set_flip_h(0)
		sheet_on.set_flip_h(0)
	elif dir < 0:
		sheet_off.set_flip_h(1)
		sheet_on.set_flip_h(1)
	if is_dark > 0:
		sheet_on.set_visible(0)
		sheet_off.set_visible(1)
	else:
		sheet_on.set_visible(1)
		sheet_off.set_visible(0)
	if is_on_floor() and dir == 0:
		animation_player.play("idle")
	elif is_on_floor():
		animation_player.play("walk")
	elif is_on_wall_only():
		animation_player.play("slide")
	else:
		animation_player.play("land")
