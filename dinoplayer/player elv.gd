extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
const Gravity = 1910


func _physics_process(delta):
	if GHUD.is_playing== true:
		if is_on_floor():
			if Input.is_action_pressed("ui_down"):
				$AnimatedSprite2D.play("dash")
			else:
				$AnimatedSprite2D.play("run")
		else:
			$AnimatedSprite2D.play("jump")
			velocity.y +=(Gravity*delta)
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y= JUMP_VELOCITY
		velocity.x=SPEED + GHUD.Score
		move_and_slide()
