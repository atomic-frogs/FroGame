extends KinematicBody2D

export (int) var speed = 50
export (int) var jump_speed = -100
export (int) var gravity = 200
export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25

var velocity = Vector2.ZERO
var dir = 0

onready var raycast = $RayCast2D
onready var sprite = $player_sprite
onready var animationPlayer = $AnimationPlayer
onready var blackground = $Blackground

func get_input():
	dir = 0
	if Input.is_action_pressed("right"):
		dir += 1
		sprite.flip_h = 0
	if Input.is_action_pressed("left"):
		dir -= 1
		sprite.flip_h = 1
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
	
	if !$walljumptimer.is_stopped():
		dir = 0
		
	if Input.is_action_just_pressed("grudar"):
		kill()

func jump():
	if Input.is_action_just_pressed("jump"):
		return true

func _physics_process(delta):
	get_input()
	if is_on_floor():
		if dir == 0 :
#			print("stand")
			animationPlayer.play("Stand")
		if jump():
			velocity.y = jump_speed
			animationPlayer.play("Jump")
			print("jump")
	else:
		if raycast.is_colliding() and !animationPlayer.is_playing():
			print("caindo")
#			animationPlayer.animation_set_next("Jump","Fall")
			animationPlayer.play("Fall")
		
		
		if is_on_wall():
			if dir != 0:
				velocity.y = 0
				
				if jump():
					
					$walljumptimer.start()
					velocity.y = jump_speed
					velocity.x = (dir * -1) * 150
					
					animationPlayer.play("Jump")
	
	
	if Global.off:
		blackground.show()
		blackground.play()
	else:
		blackground.hide()
		blackground.stop()

	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)


func kill():
	get_parent().end_game()
