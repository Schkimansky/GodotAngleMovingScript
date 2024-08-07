 extends CharacterBody2D


const SPEED = 300.0
const DASH_VELOCITY = -400.0


# This function will be used so that the velocity variable is moved forwards, By forwards i mean 90 degrees.
func move_towards_angle(angle, amount):
	velocity.x = cos(deg_to_rad(angle)) * amount
	velocity.y = sin(deg_to_rad(angle)) * amount

func _physics_process(delta):
	# Dash
	if Input.is_action_just_pressed("ui_accept"):
		# This will change velocity so that the velocity moves towards the angle 90 degree's by the amount: 3000
		move_towards_angle(90, 3000)

	# Movement
	velocity.x += Input.get_axis("ui_left", "ui_right") * SPEED
	velocity.y += Input.get_axis("ui_up", "ui_down") * SPEED

	# Friction
	velocity *= 0.6

	move_and_slide()
