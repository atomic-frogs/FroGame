extends KinematicBody2D

export (int) var speed = 50
export (int) var jump_speed = -100
export (int) var gravity = 200
export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25

var velocity = Vector2.ZERO
var dir = 0

onready var raycast = $RayCast2D
onready var sprite = $player_sprite_on
onready var sprite2 = $player_sprite_off
onready var animationPlayer = $AnimationPlayer
onready var blackground = $Blackground

func get_input():
	dir = 0
	if Input.is_action_pressed("right"):
		dir += 1
		sprite.flip_h = 0
		sprite2.flip_h = 0
	if Input.is_action_pressed("left"):
		dir -= 1
		sprite.flip_h = 1
		sprite2.flip_h = 1
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
	
	
	if Input.is_action_just_pressed("grudar"):
		kill()

func jump():
	if Input.is_action_just_pressed("jump"):
		return true

func _physics_process(delta):
	if $walljumptimer.is_stopped():
		get_input()
	
	if is_on_floor():
		if dir == 0 :
			animationPlayer.play("Stand")
		else:
			animationPlayer.play("Walk")
		
		
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
				animationPlayer.play("Grude")
				
				if jump():
					
					$walljumptimer.start()
					velocity.y = jump_speed
					velocity.x = (dir * -1) * 150
					
					animationPlayer.play("Jump")
	
	
	if Global.off:
		blackground.show()
		blackground.play()
		
		sprite2.show()
		sprite.hide()
		
	else:
		blackground.hide()
		blackground.stop()
		
		sprite2.hide()
		sprite.show()

	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)


func kill():
	get_parent().end_game()
